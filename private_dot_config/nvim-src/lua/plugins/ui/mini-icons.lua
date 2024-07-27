local patch_icons = {
  -- default --
  ["󰟀"] = "󰇄",
  -- directory --
  [""] = "󰊢",
  [""] = "󰊤",
  [""] = "󰛷",
  -- extension --
  [""] = true,
  [""] = true,
  [""] = "󰱾", -- 󱃡 csv tsv
  [""] = true,
  [""] = true,
  ["󱎒"] = "󰈬",
  [""] = true,
  [""] = true,
  [""] = "",
  [""] = true,
  [""] = true,
  [""] = "󰇁",
  -- [""] = {
  --   default = "󰇁",
  --   extension_fish = "󱢺",
  --   filetype_bash = "󱆃",
  --   filetype_fish = "󱢺",
  --   filetype_sh = "",
  --   filetype_zsh = "",
  -- },
  [""] = true,
  [""] = true,
  [""] = true,
  [""] = true,
  [""] = true,
  [""] = true,
  [""] = true,
  ["󱎐"] = "󰈧",
  [""] = true,
  [""] = true,
  [""] = "󰡪",
  [""] = "",
  ["󰡄"] = "󰹭",
  ["󱎏"] = "󰈛",
  [""] = true,
  -- file --
  [""] = "󱕵",
  [""] = "󰯂",
  [""] = true,
  [""] = "󰒓",
  [""] = "󰅩",
  [""] = "",
  -- file custom --
  [""] = true,
  [""] = "󰏗",
  -- filetype
  [""] = true,
  ["󱁷"] = "",
  [""] = true,
  [""] = true,
  [""] = true,
  [""] = true,
  [""] = true,
  [""] = "󰣚",
  [""] = true,
  [""] = true,
  [""] = true,
  [""] = true,
  [""] = true,
  [""] = true,
  [""] = "󰜈",
  [""] = "󰲒",
  [""] = true,
  [""] = "󰁄", -- 󰊔
  [""] = true,
  [""] = true,
  [""] = true,
  [""] = "󰊭",
  [""] = "󰌵",
  [""] = "󰌽",
  [""] = true,
  [""] = true,
  [""] = true,
  [""] = "󰜈",
  [""] = true,
  [""] = true,
  [""] = true,
  [""] = true,
  [""] = true,
  [""] = true,
  [""] = true,
  -- filetype custom --
  [""] = "󰙪",
  -- lsp --
  [""] = "󰅪", -- array
  [""] = "󰔡", -- boolean
  [""] = "󰌨", -- class
  [""] = "󰏘", -- color
  [""] = "󰕶", -- constant
  [""] = "󱀥", -- constructor
  [""] = "󰷐", -- enum
  [""] = "󰍴", -- enummeber
  [""] = "󰉁", -- event
  [""] = "", -- field
  [""] = "󰈔", -- file
  [""] = "󰉋", -- folder
  [""] = "󰡱", -- function
  [""] = "󰀽", -- interface
  [""] = "󱀍", -- key
  [""] = "󰌆", -- keyword
  [""] = "󰊕", -- method
  [""] = "󰘦", -- module namespace
  [""] = "󰟢", -- null
  [""] = "󰎠", -- number
  [""] = "󰘦", -- object
  [""] = true, -- operator
  [""] = "󰘦", -- package
  [""] = "󰖷", -- property
  [""] = "󰌹", -- reference
  [""] = "󰃐", -- snippet
  [""] = "󰀬", -- string
  [""] = "󰆩", -- struct
  [""] = "󰀬", -- text
  [""] = true, -- typeparameter
  [""] = "󰑭", -- unit
  [""] = "󰀫", -- value
  [""] = "󰫧", -- variable
  -- os --
}

---@param category string
---@param name string
---@param icon string
---@return string icon
---@return boolean icon
local function icon_patch(category, name, icon)
  if not icon then
    return icon, false
  end

  local new_icon = icon
  local patch_icon = patch_icons[icon]
  if patch_icon then
    if type(patch_icon) == "string" then
      new_icon = patch_icon
    elseif type(patch_icon) == "table" then
      local match_key = string.format("%s_%s", category, name)
      local match_icon = patch_icon[match_key]
      if match_icon then
        new_icon = match_icon
      elseif match_icon == patch_icon["default"] then
        new_icon = patch_icon["default"]
      end
    end
    -- vim.print(string.format("%-9s %-18s      %s  ->  %s  [%5s]", category, name, icon, new_icon, icon ~= new_icon))
  else
    local codepoint = require("utf8").codepoint(icon)
    if codepoint <= 0xF0000 then
      vim.print(string.format("%-9s %-18s      %s (0x%X) not patch", category, name, icon, codepoint))
    end
  end
  return new_icon, new_icon ~= icon
end

local M = {}

M.opts = function(_, opts)
  local new_opts = {
    extension = {
      fish = { glyph = "󱢺", hl = "MiniIconsGreen" },
    },
    file = {
      [".DS_Store"] = { glyph = "󰀵" },
      [".bash_profile"] = { glyph = "󱆃" },
      [".bashrc"] = { glyph = "󱆃" },
      [".npmignore"] = { glyph = "󰛷" },
      [".zshrc"] = { glyph = "" },
    },
    filetype = {
      bash = { glyph = "󱆃", hl = "MiniIconsGreen" },
      fish = { glyph = "󱢺", hl = "MiniIconsGreen" },
      sh = { glyph = "", hl = "MiniIconsGreen" },
      zsh = { glyph = "", hl = "MiniIconsGreen" },
    },
  }
  return LazyVim.merge({}, opts, new_opts)
  -- return vim.tbl_deep_extend("force", opts, new_opts)
end

M.config = function(_, opts)
  opts = opts or {}

  local mini_icons = require("mini.icons")
  local categories = mini_icons.list("default")
  local icons = {}
  -- categories = { "default", "directory", "extension", "file", "filetype", "lsp", "os" }
  for _, category in ipairs(categories) do
    local icon_names = mini_icons.list(category)
    for _, icon_name in ipairs(icon_names) do
      local icon, _, _ = mini_icons.get(category, icon_name)
      local category_icons = icons[category] or {}
      icons[category] = category_icons
      -- 在这里设置nl会影响原始文件中extension值为字符的图标顔色
      -- extension和filetype中都存在的,extension值为非字符的,以extension配置优先
      icons[category][icon_name] = { glyph = icon }
    end
  end

  opts = LazyVim.merge({}, icons, opts)
  -- opts = vim.tbl_deep_extend("force", icons, opts)

  for _, category in ipairs(categories) do
    for icon_name, icon_info in pairs(opts[category]) do
      local icon = icon_info.glyph
      local new_icon, is_patch = icon_patch(category, icon_name, icon)
      if is_patch then
        icon_info.glyph = new_icon
      end
    end
  end

  mini_icons.setup(opts) -- mini_icons.setup(opts)
end
return {
  { "uga-rosa/utf8.nvim", lazy = true },
  { "echasnovski/mini.icons", opts = M.opts, config = M.config },
}
