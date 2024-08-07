local colors = require('xxx.core.colors').universal()

-- local fg = '#657b83'
-- local fg = '#282c34'
-- local fg = '#eee8d5'
-- local fg = '#fdf6e3'
local fg = colors.statusline.mode_fg
local bg = nil
local mode_n_bg = colors.statusline.mode_n_bg
local mode_i_bg = colors.statusline.mode_i_bg
local mode_r_bg = colors.statusline.mode_r_bg
local mode_v_bg = colors.statusline.mode_v_bg

return {
  normal = {
    a = { bg = mode_n_bg, fg = fg, gui = 'bold' },
    b = { bg = bg, fg = fg },
    c = { bg = bg, fg = fg },
  },
  insert = {
    a = { bg = mode_i_bg, fg = fg, gui = 'bold' },
  },
  visual = {
    a = { bg = mode_v_bg, fg = fg, gui = 'bold' },
  },
  replace = {
    a = { bg = mode_r_bg, fg = fg, gui = 'bold' },
  },
  command = {
    a = { bg = mode_i_bg, fg = fg, gui = 'bold' },
  },
  -- inactive = {
  --     a = { bg = "darkgray", fg = gray, gui = 'bold' },
  --     b = { bg = "darkgray", fg = gray },
  --     c = { bg = "darkgray", fg = gray }
  -- }
}
