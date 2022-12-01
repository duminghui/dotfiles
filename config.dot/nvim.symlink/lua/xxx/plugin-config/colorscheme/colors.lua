local colors = {
  bg = "#000000",
  fg = "#000000",
  red = "#000000",
  orange = "#000000",
  yellow = "#000000",
  green = "#000000",
  cyan = "#000000",
  blue = "#000000",
  purple = "#000000",
  white = "#000000",
  black = "#000000",
  gray = "#000000",
  none = "NONE",
  bufferline_text_focus = "#949aa2",
  statusline_bg = "#2e323b",
}

local M = {}

function M.generate_colors_with(theme)
  colors = {
    bg = theme.bg,
    fg = theme.fg,
    red = theme.red,
    orange = theme.orange,
    yellow = theme.yellow,
    green = theme.green,
    cyan = theme.cyan,
    blue = theme.blue,
    purple = theme.purple,
    white = theme.white,
    black = theme.black,
    gray = theme.gray,
    bufferline_text_focus = theme.bufferline_text_focus,
    statusline_bg = theme.statusline_bg,
  }
end

function M.colors()
  return colors
end

return M
