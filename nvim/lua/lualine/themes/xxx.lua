local colors = require('xxx.core.colors').universal()

-- local fg = "#657b83"
-- local fg = "#282c34"
local fg = colors.statuline.mode_fg
local bg = nil
local magenta = colors.magenta
local green = colors.green
local yellow = colors.yellow

return {
  normal = {
    a = { bg = magenta, fg = fg, gui = 'bold' },
    b = { bg = bg, fg = fg },
    c = { bg = bg, fg = fg },
  },
  insert = {
    a = { bg = green, fg = fg, gui = 'bold' },
  },
  visual = {
    a = { bg = yellow, fg = fg, gui = 'bold' },
  },
  replace = {
    a = { bg = green, fg = fg, gui = 'bold' },
  },
  command = {
    a = { bg = magenta, fg = fg, gui = 'bold' },
  },
  -- inactive = {
  --     a = { bg = "darkgray", fg = gray, gui = 'bold' },
  --     b = { bg = "darkgray", fg = gray },
  --     c = { bg = "darkgray", fg = gray }
  -- }
}
