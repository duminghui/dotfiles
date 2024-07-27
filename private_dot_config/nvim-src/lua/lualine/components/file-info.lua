local lualine_require = require("lualine_require")
local modules = lualine_require.lazy_require({
  highlight = "lualine.highlight",
  utils = "lualine.utils.utils",
})

local icons = xxx.icons

local M = require("lualine.component"):extend()

local default_options = {
  format_symbols = {
    unix = "󰌽", -- f033d, e712 
    dos = "󰖳", -- f05b3, e70f 
    mac = "󰀵", -- f0035
  },
}

function M:init(options)
  M.super.init(self, options)
  self.options = vim.tbl_deep_extend("keep", self.options or {}, default_options)
  self.icon_hl_cache = {}
end

function M:file_type()
  local filetype = vim.bo.filetype or ""
  if filetype == "" then
    filetype = "NOFT"
  end

  local filename = vim.fn.expand("%:t")
  local devicons = require("nvim-web-devicons")
  local icon, icon_hl_group = devicons.get_icon(filename)
  if icon == nil then
    icon, icon_hl_group = devicons.get_icon_by_filetype(filetype)
  end
  if icon == nil and icon_hl_group == nil then
    -- icon = ''
    icon = icons.ui.Text
    icon_hl_group = "DevIconDefault"
  end

  local hl_color = modules.utils.extract_highlight_colors(icon_hl_group, "fg")
  if hl_color then
    local icon_hl = self.icon_hl_cache[hl_color]
    if not icon_hl or not modules.highlight.highlight_exists(icon_hl.name .. "_normal") then
      icon_hl = self:create_hl({ fg = hl_color }, icon_hl_group)
      self.icon_hl_cache[hl_color] = icon_hl
    end
    local default_hl = self:get_default_hl()
    icon = self:format_hl(icon_hl) .. icon .. default_hl
  end

  return icon .. " " .. filetype
end

function M:update_status()
  local shiftwidth = vim.api.nvim_get_option_value("shiftwidth", { buf = 0 })
  local infos = {}

  -- space
  local space = ""
  if shiftwidth > 0 then
    space = icons.ui.Space .. ":" .. shiftwidth
  else
    local tabstop = vim.api.nvim_get_option_value("tabstop", { buf = 0 })
    space = icons.ui.Tab .. tabstop
  end
  table.insert(infos, space)

  -- format
  local format = vim.bo.fileformat
  format = self.options.format_symbols[format] or format
  table.insert(infos, format)

  --encoding
  local encoding = ((vim.bo.fenc ~= "" and vim.bo.fenc) or vim.o.enc):upper()
  table.insert(infos, encoding)

  -- filetype
  local filetype = self:file_type()
  table.insert(infos, filetype)

  return table.concat(infos, " ")
end

return M
