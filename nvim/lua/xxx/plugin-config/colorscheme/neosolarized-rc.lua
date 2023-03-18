local M = {}
M.opts = {
  comment_italics = true,
  background_set = false,
}

function M.setup()
  local n = require("neosolarized").setup(M.opts)

  local Color, colors, Group, groups, styles = require("colorbuddy").setup()

  Color.new("black", "#000000")
  Color.new("white", "FFFFFF")
  Color.new("gold1", "#FFD700")

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

  Group.new("Normal", colors.base1, colors.NONE, styles.NONE)
  Group.new("CursorLine", colors.NONE, colors.base03, styles.NONE, colors.base01)
  Group.new("CursorLineNr", colors.gold1, colors.base03, styles.NONE, colors.base01)
  Group.link("CursorColumn", n.groups.CursorLine)
  Group.new("Visual", colors.NONE, colors.base03, styles.reverse)

  local cError = groups.Error.fg
  local cInfo = groups.Information.fg
  local cWarn = groups.Warning.fg
  local cHint = groups.Hint.fg

  Group.new("DiagnosticVirtualTextError", cError, cError:dark():dark():dark():dark(), styles.NONE)
  Group.new("DiagnosticVirtualTextWarn", cWarn, cWarn:dark():dark(), styles.NONE)
  Group.new("DiagnosticVirtualTextInfo", cInfo, cInfo:dark():dark():dark(), styles.NONE)
  Group.new("DiagnosticVirtualTextHint", cHint, cHint:dark():dark():dark(), styles.NONE)
  Group.new("DiagnosticUnderlineError", colors.NONE, colors.NONE, styles.undercurl, cError)
  Group.new("DiagnosticUnderlineWarn", colors.NONE, colors.NONE, styles.undercurl, cWarn)
  Group.new("DiagnosticUnderlineInfo", colors.NONE, colors.NONE, styles.undercurl, cInfo)
  Group.new("DiagnosticUnderlineHint", colors.NONE, colors.NONE, styles.undercurl, cHint)
  Group.new("HoverBorder", colors.yellow, colors.NONE, styles.NONE)

  local universal_colors = {
    yellow = colors.yellow:to_rgb(),
    orange = colors.orange:to_rgb(),
    red = colors.red:to_rgb(),
    magenta = colors.magenta:to_rgb(),
    violet = colors.violet:to_rgb(),
    blue = colors.blue:to_rgb(),
    cyan = colors.cyan:to_rgb(),
    green = colors.green:to_rgb(),
    purple = "#d55fde",
    bufferline = {
      text = colors.base00:to_rgb(),
      text_selected = colors.base1:to_rgb(),
      tag_fg = colors.base02:to_rgb(),
      tag_bg = colors.base03:to_rgb(),
      modified = colors.red:dark():dark():to_rgb(),
      pick = colors.cyan:to_rgb(),
    },
    statuline = {
      mode_fg = colors.base03:to_rgb(),
      fg = colors.base00:to_rgb(),
      bg = colors.base02:to_rgb(),
    },
  }
  require("xxx.plugin-config.colorscheme.colors").set_colors(universal_colors)
end
return M
