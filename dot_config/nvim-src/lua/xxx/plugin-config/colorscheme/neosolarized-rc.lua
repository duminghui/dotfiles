local M = {}
M.opts = {
  comment_italics = true,
  background_set = false,
}

function M.setup()
  require('neosolarized').setup(M.opts)

  local Color, colors, Group, groups, styles = require('colorbuddy').setup()

  local darkgold = colors.gold:dark()

  Color.new('black', '#000000')
  Color.new('white', '#FFFFFF')
  Color.new('bg1', '#001b21')
  -- Color.new("gold", "#FFD700")
  Color.new('darkgold', darkgold:to_rgb())

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
  Color.new('green', '#859900')

  Group.new('Normal', colors.base1, colors.none, styles.none)
  Group.new('CursorLine', colors.none, colors.base02, styles.none, colors.base01)
  Group.new('CursorLineNr', colors.gold, colors.base02, styles.bold, colors.base01)
  Group.link('CursorColumn', groups.CursorLine)
  Group.new('Visual', colors.none, colors.base03, styles.reverse)
  -- fix dressing float title color
  Group.new('FloatTitle', colors.base00, colors.none, styles.none)
  Group.new('PmenuSel', colors.base03, colors.base1, styles.reverse)
  -- signcolumn ~ color
  Group.new('EndOfBuffer', colors.bg1, colors.none, styles.none)

  -- Nvim-Tree
  vim.cmd('highlight link NvimTreeFolderName NvimTreeNormal')
  Group.new('NvimTreeRootFolder', colors.yellow, colors.none, styles.none)
  Group.new('NvimTreeFolderIcon', colors.yellow, colors.none, styles.none)
  vim.cmd('highlight link NvimTreeOpenedFolderName NvimTreeNormal')
  Group.new('NvimTreeGitDirty', colors.yellow, colors.none, styles.none)
  Group.new('NvimTreeGitNew', colors.green, colors.none, styles.none)

  -- Telescope
  Group.new('TelescopePromptTitle', colors.base1, colors.purple, styles.none)
  Group.new('TelescopePreviewTitle', colors.base02, colors.green, styles.none)
  Group.new('TelescopeResultsTitle', colors.base02, colors.yellow, styles.none)

  -- TreesitterContext
  vim.cmd('highlight link TreesitterContextLineNumber TreesitterContext')

  -- Trouble
  Group.new('TroubleFoldIcon', groups.CursorLineNr)

  local cError = groups.Error.fg
  local cInfo = groups.Information.fg
  local cWarn = groups.Warning.fg
  local cHint = groups.Hint.fg

  Group.new('DiagnosticVirtualTextError', cError, cError:dark():dark():dark():dark(), styles.none)
  Group.new('DiagnosticVirtualTextWarn', cWarn, cWarn:dark():dark(), styles.none)
  Group.new('DiagnosticVirtualTextInfo', cInfo, cInfo:dark():dark():dark(), styles.none)
  Group.new('DiagnosticVirtualTextHint', cHint, cHint:dark():dark(), styles.none)
  Group.new('DiagnosticUnderlineError', colors.none, colors.none, styles.undercurl, cError)
  Group.new('DiagnosticUnderlineWarn', colors.none, colors.none, styles.undercurl, cWarn)
  Group.new('DiagnosticUnderlineInfo', colors.none, colors.none, styles.undercurl, cInfo)
  Group.new('DiagnosticUnderlineHint', colors.none, colors.none, styles.undercurl, cHint)
  Group.new('HoverBorder', colors.yellow, colors.none, styles.none)

  local universal_colors = {
    yellow = colors.yellow:to_rgb(),
    orange = colors.orange:to_rgb(),
    red = colors.red:to_rgb(),
    magenta = colors.magenta:to_rgb(),
    violet = colors.violet:to_rgb(),
    blue = colors.blue:to_rgb(),
    cyan = colors.cyan:to_rgb(),
    green = colors.green:to_rgb(),
    -- purple = "#d55fde",
    purple = colors.purple:to_rgb(),
    darkgold = darkgold:to_rgb(),
    bg = colors.base03:to_rgb(),
    bufferline = {
      text = colors.base00:to_rgb(),
      text_selected = colors.base1:to_rgb(),
      tag_fg = colors.base02:to_rgb(),
      tag_bg = colors.base03:to_rgb(),
      modified = darkgold:to_rgb(),
      pick = colors.magenta:to_rgb(),
    },
    statuline = {
      mode_fg = colors.base03:to_rgb(),
      mode_n_bg = colors.magenta:to_rgb(),
      mode_i_bg = colors.green:to_rgb(),
      mode_v_bg = colors.yellow:to_rgb(),
      fg = colors.base00:to_rgb(),
      bg = colors.base02:to_rgb(),
    },
  }

  require('xxx.core.colors').set_universal(universal_colors)
  vim.opt.pumblend = 9
  vim.opt.winblend = 9
  Xvim.winblend = 0
  Xvim.which_key_winblend = 9
end

return M
