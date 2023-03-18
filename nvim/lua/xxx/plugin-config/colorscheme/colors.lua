local colors = {
  yellow = "#000000",
  orange = "#000000",
  red = "#000000",
  magenta = "#000000",
  violet = "#000000",
  blue = "#000000",
  cyan = "#000000",
  green = "#000000",
  purple = "#000000",
  bufferline = {
    text = "#000000",
    text_selected = "#000000",
    tag_fg = "#000000",
    tag_bg = "#000000",
    modified = "#000000",
    pick = "#000000",
  },
  statuline = {
    mode_fg = "#000000",
    fg = "#000000",
    bg = "#000000",
  },
}

local M = {}

function M.set_colors(universal_colors)
  universal_colors = universal_colors or {}
  colors = vim.tbl_deep_extend("force", colors, universal_colors)
end

function M.colors()
  return colors
end

return M
