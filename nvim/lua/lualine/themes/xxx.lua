local colors = require("xxx.plugin-config.colorscheme.colors").colors()

-- local fg = "#657b83"
-- local fg = "#282c34"
local fg = colors.statuline.mode_fg
local bg = nil
local purple = colors.purple
local green = colors.green
local yellow = colors.yellow

return {
  normal = {
    a = { bg = purple, fg = fg, gui = "bold" },
    b = { bg = bg, fg = fg },
    c = { bg = bg, fg = fg },
  },
  insert = {
    a = { bg = green, fg = fg, gui = "bold" },
  },
  visual = {
    a = { bg = yellow, fg = fg, gui = "bold" },
  },
  replace = {
    a = { bg = green, fg = fg, gui = "bold" },
  },
  command = {
    a = { bg = purple, fg = fg, gui = "bold" },
  },
  -- inactive = {
  --     a = { bg = "darkgray", fg = gray, gui = 'bold' },
  --     b = { bg = "darkgray", fg = gray },
  --     c = { bg = "darkgray", fg = gray }
  -- }
}
