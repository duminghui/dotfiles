require("neosolarized").set_colors()

local colorbuddy = require("colorbuddy")
local Color = colorbuddy.Color
local colors = colorbuddy.colors
local Group = colorbuddy.Group
local groups = colorbuddy.groups
local styles = colorbuddy.styles

local darkgold = colors.gold:dark()

-- Color.new("gold", "#FFD700")
Color.new("darkgold", darkgold:to_vim())

-- Color.new("base03", "#002b36")
-- Color.new("base02", "#073642")
-- Color.new("base01", "#586e75")
-- Color.new("base00", "#657b83")
-- Color.new("base0", "#839496")
-- Color.new("base1", "#93a1a1")
-- Color.new("base2", "#eee8d5")
-- Color.new("base3", "#fdf6e3")
-- Color.new("yellow", "#b58900")
-- Color.new("orange", "#cb4b16")
-- Color.new("red", "#dc322f")
-- Color.new("magenta", "#d33682")
-- Color.new("violet", "#6c71c4")
-- Color.new("blue", "#268bd2")
-- Color.new("cyan", "#2aa198")
-- Color.new("green", "#719e07")
Color.new("green", "#859900")
Color.new("white", "#eee8d5")
-- Color.new("azure", "#87CEEB")
-- Color.new("azure", "#87CEFA")
-- #2b8db3
Color.new("azure", "#51a0cf")

local opts = LazyVim.opts("neosolarized.nvim") or {}

---@diagnostic disable-next-line: undefined-field
local opts_bg_color = opts.background_color or Color.none

---@diagnostic disable-next-line: undefined-field
if opts.background_set and opts_bg_color == Color.none then
  opts.background_color = colors.base03
end

local bg_color = opts.background_color

-- Group.new = function(name, fg, bg, style, guisp, blend)
-- "guisp" is used for various underlines.

-- Group.new("Normal", colors.base0, bg_color) -- 原值
Group.new("Normal", colors.base1, bg_color)
-- 浮动窗口
-- print(false and Color.none or colors.base02)
-- print(true and Color.none or colors.base02)
-- 上面的全部返回colors.base02
---@diagnostic disable-next-line: undefined-field
Group.new("NormalFloat", colors.base1, not opts.background_set and Color.none or colors.base02) -- 原值
-- normal non-current text
--Group.new("NormalNC", colors.base0:dark(), bg_color)
-- 比如: 在alpha-dashboard界面,弹出Telescope界面后,dashboard的字体顔色就会变成下面设置的
Group.new("NormalNC", colors.base1:dark(), bg_color)

-- fix dressing float title color
Group.new("FloatTitle", colors.base00, colors.none, styles.none)
-- Group.new('FloatTitle', colors.red, colors.none, styles.reverse)

-- Group.new('TabLineSel', colors.yellow, bg_color) -- 原值

-- Group.new('LineNr', colors.base01, bg_color, styles.NONE)-- 原值
Group.new("LineNr", colors.base01, colors.none, styles.NONE)
Group.new("CursorLine", colors.none, colors.base02, styles.none, colors.base01)
-- Group.new("CursorLineNr", colors.gold, colors.base02, styles.bold, colors.base01)
Group.new("CursorLineNr", colors.gold, colors.none, styles.bold, colors.base01)
Group.link("CursorColumn", groups.CursorLine)

Group.new("StatusLine", colors.base1, colors.base02, styles.reverse)
Group.new("StatusLineNC", colors.base00, colors.base02, styles.reverse)
-- fix statusline 上的白块
-- Group.new('StatusLine', colors.base02)
-- Group.new('StatusLineNC', colors.base02)
-- Group.new('StatusLine', colors.base03, colors.none)
-- Group.new('StatusLineNC', colors.base03, colors.none)

-- custom for statusline
Group.new("SlEmpty")
Group.new("SlComponent", colors.base00, colors.base02)
Group.new("SlDiffAdd", colors.green, colors.base02)
Group.new("SlDiffChange", colors.yellow, colors.base02)
Group.new("SlDiffDelete", colors.red, colors.base02)
Group.new("SlTreesitterActive", colors.blue, colors.base02)
Group.new("SlTreesitterInactive", colors.red, colors.base02)
Group.new("SlClientCopilot", colors.green, colors.base02)
Group.new("SlClientActive", colors.green, colors.base02)
Group.new("SlClientInactive", colors.yellow, colors.base02)
Group.new("SlSessionActive", colors.green, colors.base02)
Group.new("SlSessionInactive", colors.red, colors.base02)
Group.new("SlLocation", colors.base03, colors.green)
Group.new("SlFileProgress", colors.base03, colors.yellow)
Group.new("SlFileScrollbar", colors.gold)

Group.new("Visual", colors.none, colors.base03, styles.reverse)

-- pum (popup menu)
Group.new("Pmenu", groups.Normal, colors.base02, styles.none) -- popup menu normal item
-- Group.new("PmenuSel", colors.base03, colors.base1, styles.reverse) -- selected item
Group.new("PmenuSel", colors.none, colors.base03) -- selected item
Group.new("PmenuSbar", colors.base02, colors.purple, styles.reverse) -- 这个还不知道用哪里
Group.new("PmenuThumb", colors.base0, colors.none, styles.reverse)

-- be nice for this float border to be cyan if active
-- Group.new('FloatBorder', colors.base02) -- 原值
-- 修正 vim.opt.winblend != 0 时边框的背景色变成黑色
-- Group.new('FloatBorder', colors.base02, groups.NormalFloat) -- fix bg
Group.new("FloatBorder", colors.base03, groups.NormalFloat) -- fix bg

-- signcolumn ~ color
Group.new("EndOfBuffer", colors.base03, colors.none, styles.none)

-- Nvim-Tree
-- vim.cmd('highlight link NvimTreeFolderName NvimTreeNormal')
-- Group.new('NvimTreeRootFolder', colors.yellow, colors.none, styles.none)
-- Group.new('NvimTreeFolderIcon', colors.yellow, colors.none, styles.none)
-- vim.cmd('highlight link NvimTreeOpenedFolderName NvimTreeNormal')
-- Group.new('NvimTreeGitDirty', colors.yellow, colors.none, styles.none)
-- Group.new('NvimTreeGitNew', colors.green, colors.none, styles.none)

-- neo-tree
Group.new("NeoTreeRootName", colors.darkgold, nil, styles.bold)
Group.new("NeoTreeDirectoryIcon", colors.yellow)
Group.link("NeoTreeFileIcon", groups.Normal)
Group.new("NeoTreeFileNameOpened", groups.Normal, nil, styles.bold)
Group.new("NeoTreeSymbolicLinkTarget", colors.cyan)
Group.new("NeoTreeModified", colors.darkgold)

-- Group.new("NeoTreeTabInactive", colors.base00, colors.base03)
-- Group.new("NeoTreeTabActive", colors.base1, nil, styles.bold + styles.italic)
-- Group.new("NeoTreeTabSeparatorInactive", colors.base02, colors.base03)
-- Group.new("NeoTreeTabSeparatorActive", colors.base02)

vim.cmd([[
    highlight! link NeoTreeTabInactive BufferLineBackground
    highlight! link NeoTreeTabActive BufferLineBufferSelected
    highlight! link NeoTreeTabSeparatorInactive BufferLineSeparator
    highlight! link NeoTreeTabSeparatorActive BufferLineSeparatorSelected
    highlight! link NeoTreeDirectoryName Normal
    highlight! link NeoTreeFileName Normal
  ]])

-- Telescope
-- Group.new('TelescopeMatching', colors.orange, groups.Special, groups.Special, groups.Special)
-- Group.new('TelescopeBorder', colors.base01) -- float border not quite dark enough, maybe that needs to change?
-- Group.new('TelescopePromptBorder', colors.cyan) -- active border lighter for clarity
-- Group.new('TelescopeTitle', groups.Normal) -- separate them from the border a little, but not make them pop
-- Group.new('TelescopePromptPrefix', groups.Normal) -- default is groups.Identifier
-- Group.link('TelescopeSelection', groups.CursorLine)
-- Group.new('TelescopeSelectionCaret', colors.cyan)

-- 下面三个的背景色和Normal保持一至, 即使Normal没有背景色也要填上
Group.new("TelescopeBorder", colors.base01, colors.base03) -- fix bg
Group.new("TelescopePromptBorder", colors.cyan, colors.base03) -- fix bg
Group.new("TelescopeNormal", groups.Normal, colors.base03, styles.none) -- fix bg
-- Group.new('TelescopePromptTitle', colors.base1, colors.purple, styles.none)
-- Group.new('TelescopePreviewTitle', colors.base02, colors.green, styles.none)
-- Group.new('TelescopeResultsTitle', colors.base02, colors.yellow, styles.none)
Group.new("TelescopePromptTitle", colors.base2, colors.purple, styles.none)
Group.new("TelescopePreviewTitle", colors.base2, colors.green, styles.none)
Group.new("TelescopeResultsTitle", colors.base2, colors.yellow, styles.none)

-- fidget
-- Group.link('FidgetDone', groups.Constant) -- Constant
-- Group.link('FidgetProgress', groups.WarningMsg) -- WarningMsg
-- Group.link('FidgetGroup', groups.Title) -- Title
-- Group.link('FidgetIcon', groups.Question) -- Question
-- Group.link('FidgetGroupSeparator', groups.Comment) -- Comment
-- Group.link('FidgetNormal', groups.Comment) -- Comment
-- Group.link('FidgetBorder', groups.FloatBorder) -- FloatBorder

Group.new("FidgetDone", colors.green)
Group.new("FidgetProgress", colors.yellow)
Group.new("FidgetGroup", colors.magenta)
Group.new("FidgetIcon", colors.magenta)
Group.new("FidgetGroupSeparator", colors.base01)
Group.new("FidgetNormal", colors.base01)
Group.link("FidgetBorder", groups.FloatBorder)

-- TreesitterContext
vim.cmd("highlight link TreesitterContextLineNumber TreesitterContext")

-- Trouble
Group.new("TroubleIconDirectory", colors.yellow)

--

local cError = groups.Error.fg
local cWarn = groups.Warning.fg
local cInfo = groups.Information.fg
local cHint = groups.Hint.fg
local cOk = colors.green
-- 下面五个要和NormalFloat和背景色保持一至
-- lspsaga会使用下面四个来设置Diagnostic Window的内容和边框
-- https://github.com/nvimdev/lspsaga.nvim/blob/3112b7aba57653199ad20198f477d94781bb2310/lua/lspsaga/diagnostic/init.lua#L245
-- mini.icons也会用到下面五, 但是不能加背景色
-- Group.new("DiagnosticError", cError, groups.NormalFloat)
-- Group.new("DiagnosticWarn", cWarn, groups.NormalFloat)
-- Group.new("DiagnosticInfo", cInfo, groups.NormalFloat)
-- Group.new("DiagnosticHint", cHint, groups.NormalFloat)
-- Group.new("DiagnosticOk", cOk, groups.NormalFloat)
Group.new("DiagnosticError", cError)
Group.new("DiagnosticWarn", cWarn)
Group.new("DiagnosticInfo", cInfo)
Group.new("DiagnosticHint", cHint)
Group.new("DiagnosticOk", cOk)
Group.new("DiagnosticSignError", cError)
Group.new("DiagnosticSignWarn", cWarn)
Group.new("DiagnosticSignInfo", cInfo)
Group.new("DiagnosticSignHint", cHint)
Group.new("DiagnosticSignOk", cOk)
Group.new("DiagnosticVirtualTextError", cError, cError:dark():dark():dark():dark(), styles.none)
Group.new("DiagnosticVirtualTextWarn", cWarn, cWarn:dark():dark(), styles.none)
Group.new("DiagnosticVirtualTextInfo", cInfo, cInfo:dark():dark():dark(), styles.none)
Group.new("DiagnosticVirtualTextHint", cHint, cHint:dark():dark(), styles.none)
Group.new("DiagnosticVirtualTextOk", cOk, cOk:dark(), styles.none)
Group.new("DiagnosticUnderlineError", colors.none, colors.none, styles.undercurl, cError)
Group.new("DiagnosticUnderlineWarn", colors.none, colors.none, styles.undercurl, cWarn)
Group.new("DiagnosticUnderlineInfo", colors.none, colors.none, styles.undercurl, cInfo)
Group.new("DiagnosticUnderlineHint", colors.none, colors.none, styles.undercurl, cHint)
Group.new("DiagnosticUnderlineOk", colors.none, colors.none, styles.undercurl, cOk)

-- lspsaga
-- Group.new('HoverBorder', colors.yellow, colors.none, styles.none)

-- Hop
local set_hl = vim.api.nvim_set_hl
-- Highlight used for the mono-sequence keys (i.e. sequence of 1).
set_hl(0, "HopNextKey", { fg = "#ff007c", bold = true, ctermfg = 198, cterm = { bold = true }, default = false })
-- Highlight used for the first key in a sequence.
set_hl(0, "HopNextKey1", { fg = "#00dfff", bold = true, ctermfg = 45, cterm = { bold = true }, default = false })
-- Highlight used for the second and remaining keys in a sequence.
set_hl(0, "HopNextKey2", { fg = "#2b8db3", ctermfg = 33, default = false })
-- Highlight used for the unmatched part of the buffer.
set_hl(0, "HopUnmatched", { fg = "#666666", sp = "#666666", ctermfg = 242, default = false })
-- Highlight used for the fake cursor visible when hopping.
set_hl(0, "HopCursor", { link = "Cursor", default = false })
-- Highlight used for preview pattern
set_hl(0, "HopPreview", { link = "IncSearch", default = false })

-- mini.icons & which-key
Group.new("MiniIconsAzure", colors.azure)
Group.new("MiniIconsBlue", colors.blue)
Group.new("MiniIconsCyan", colors.cyan)
Group.new("MiniIconsGreen", colors.green)
Group.new("MiniIconsGrey", colors.none)
Group.new("MiniIconsOrange", colors.orange)
Group.new("MiniIconsPurple", colors.violet)
Group.new("MiniIconsRed", colors.red)
Group.new("MiniIconsYellow", colors.yellow)

-- nvim-notify
Group.new("NotifyINFOIcon", colors.green)
Group.new("NotifyINFOTitle", colors.green)

local universal_colors = {
  yellow = colors.yellow:to_vim(),
  orange = colors.orange:to_vim(),
  red = colors.red:to_vim(),
  magenta = colors.magenta:to_vim(),
  violet = colors.violet:to_vim(),
  blue = colors.blue:to_vim(),
  cyan = colors.cyan:to_vim(),
  green = colors.green:to_vim(),
  -- purple = "#d55fde",
  purple = colors.purple:to_vim(),
  darkgold = darkgold:to_vim(),
  bg = colors.base03:to_vim(),
  bufferline = {
    text = colors.base00:to_vim(),
    text_selected = colors.base1:to_vim(),
    tag_fg = colors.base02:to_vim(),
    tag_bg = colors.base03:to_vim(),
    modified = darkgold:to_vim(),
    pick = colors.magenta:to_vim(),
  },
}

require("xxx.core.colors").set_universal(universal_colors)

-- Enables pseudo-transparency for the |popup-menu|.
-- cmp's menu, vim.notify (nvim-notify)
vim.opt.pumblend = 0
-- Enables pseudo-transparency for a floating window. doc view
-- 当不为0时,如果边框的highlight没有设置背景色或者背景色偏黑色, 经过neovim计算后背景会变成黑色
-- 出现浮动框黑色背景的问题, 一般都是该浮动框设置了这个配置引起的
-- vim.opt.winblend = 7
