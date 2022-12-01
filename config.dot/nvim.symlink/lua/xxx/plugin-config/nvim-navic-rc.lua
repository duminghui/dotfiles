local M = {}

local icons = require("xxx.core.icons")
local icons_kind = icons.kind

M.opts = {
  icons = {
    Array = icons_kind.Array .. " ",
    Boolean = icons_kind.Boolean,
    Class = icons_kind.Class .. " ",
    Color = icons_kind.Color .. " ",
    Constant = icons_kind.Constant .. " ",
    Constructor = icons_kind.Constructor .. " ",
    Enum = icons_kind.Enum .. " ",
    EnumMember = icons_kind.EnumMember .. " ",
    Event = icons_kind.Event .. " ",
    Field = icons_kind.Field .. " ",
    File = icons_kind.File .. " ",
    Folder = icons_kind.Folder .. " ",
    Function = icons_kind.Function .. " ",
    Interface = icons_kind.Interface .. " ",
    Key = icons_kind.Key .. " ",
    Keyword = icons_kind.Keyword .. " ",
    Method = icons_kind.Method .. " ",
    Module = icons_kind.Module .. " ",
    Namespace = icons_kind.Namespace .. " ",
    Null = icons_kind.Null .. " ",
    Number = icons_kind.Number .. " ",
    Object = icons_kind.Object .. " ",
    Operator = icons_kind.Operator .. " ",
    Package = icons_kind.Package .. " ",
    Property = icons_kind.Property .. " ",
    Reference = icons_kind.Reference .. " ",
    Snippet = icons_kind.Snippet .. " ",
    String = icons_kind.String .. " ",
    Struct = icons_kind.Struct .. " ",
    Text = icons_kind.Text .. " ",
    TypeParameter = icons_kind.TypeParameter .. " ",
    Unit = icons_kind.Unit .. " ",
    Value = icons_kind.Value .. " ",
    Variable = icons_kind.Variable .. " ",
  },
  highlight = true,
  separator = " " .. ">" .. " ",
  depth_limit = 0,
  depth_limit_indicator = "..",
}

function M.setup()
  local status_ok, navic = safe_require("nvim-navic")
  if not status_ok then
    return
  end
  -- M.create_winbar()
  navic.setup(M.opts)

end

M.winbar_filetype_exclude = require("xxx.config.exclude-filetypes").breadcrumbs
-- {
--     "help",
--     "startify",
--     "dashboard",
--     "packer",
--     "neo-tree",
--     "neogitstatus",
--     "NvimTree",
--     "Trouble",
--     "alpha",
--     "lir",
--     "Outline",
--     "spectre_panel",
--     "toggleterm",
--     "DressingSelect",
--     "Jaq",
--     "harpoon",
--     "dapui_scopes",
--     "dapui_breakpoints",
--     "dapui_stacks",
--     "dapui_watches",
--     "dap-repl",
--     "dap-terminal",
--     "dapui_console",
--     "lab",
--     "Markdown",
--     "",
-- }

M.get_filename = function()
  local filename = vim.fn.expand "%:t"
  local extension = vim.fn.expand "%:e"
  local f = require "xxx.utils.functions"

  if not f.isempty(filename) then
    local file_icon, file_icon_color =
    require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })

    local hl_group = "FileIconColor" .. extension

    vim.api.nvim_set_hl(0, hl_group, { fg = file_icon_color })
    if f.isempty(file_icon) then
      file_icon = icons_kind.File
    end

    -- TODO cache highlight
    local navic_text = vim.api.nvim_get_hl_by_name("Normal", true)
    vim.api.nvim_set_hl(0, "Winbar", { fg = navic_text.foreground })

    return " " .. "%#" .. hl_group .. "#" .. file_icon .. "%*" .. " " .. "%#Winbar#" .. filename .. "%*"
  end
end

local get_gps = function()
  local status_gps_ok, gps = pcall(require, "nvim-navic")
  if not status_gps_ok then
    return ""
  end

  local status_ok, gps_location = pcall(gps.get_location, {})
  if not status_ok then
    return ""
  end

  if not gps.is_available() or gps_location == "error" then
    return ""
  end

  if not require("xxx.utils.functions").isempty(gps_location) then
    -- TODO: replace with chevron
    return ">" .. " " .. gps_location
  else
    return ""
  end
end

local excludes = function()
  if vim.tbl_contains(M.winbar_filetype_exclude, vim.bo.filetype) then
    return true
  end
  return false
end

M.get_winbar = function()
  if excludes() then
    return
  end
  local f = require "xxx.utils.functions"
  local value = M.get_filename()

  local gps_added = false
  if not f.isempty(value) then
    local gps_value = get_gps()
    value = value .. " " .. gps_value
    if not f.isempty(gps_value) then
      gps_added = true
    end
  end

  if not f.isempty(value) and f.get_buf_option "mod" then
    -- TODO: replace with circle
    local mod = "%#LspCodeLens#" .. icons.ui.Circle .. "%*"
    if gps_added then
      value = value .. " " .. mod
    else
      value = value .. mod
    end
  end

  local num_tabs = #vim.api.nvim_list_tabpages()

  if num_tabs > 1 and not f.isempty(value) then
    local tabpage_number = tostring(vim.api.nvim_tabpage_get_number(0))
    value = value .. "%=" .. tabpage_number .. "/" .. tostring(num_tabs)
  end

  local status_ok, _ = pcall(vim.api.nvim_set_option_value, "winbar", value, { scope = "local" })
  if not status_ok then
    return
  end
end

M.create_winbar = function()
  vim.api.nvim_create_augroup("_winbar", {})
  if vim.fn.has "nvim-0.8" == 1 then
    vim.api.nvim_create_autocmd(
      { "CursorMoved", "CursorHold", "BufWinEnter", "BufFilePost", "InsertEnter", "BufWritePost", "TabClosed" },
      {
        group = "_winbar",
        callback = function()
          local status_ok, _ = pcall(vim.api.nvim_buf_get_var, 0, "lsp_floating_window")
          if not status_ok then
            -- TODO:
            require("xxx.plugin-config.breadcrumbs").get_winbar()
          end
        end,
      }
    )
  end
end


return M
