-- local fg = '#657b83'
-- local fg = '#282c34'
-- local fg = '#eee8d5'
-- local fg = '#fdf6e3'
local fg = "#002b36" -- base03
local bg = nil
local mode_n_bg = "#d33687" -- magenta
local mode_i_bg = "#859900" -- green
local mode_r_bg = "#cb4b16" -- orange
local mode_v_bg = "#b58900" -- yellow

return {
  normal = {
    a = { bg = mode_n_bg, fg = fg, gui = "bold" },
    b = { bg = bg, fg = fg },
    c = { bg = bg, fg = fg },
  },
  insert = {
    a = { bg = mode_i_bg, fg = fg, gui = "bold" },
  },
  visual = {
    a = { bg = mode_v_bg, fg = fg, gui = "bold" },
  },
  replace = {
    a = { bg = mode_r_bg, fg = fg, gui = "bold" },
  },
  command = {
    a = { bg = mode_i_bg, fg = fg, gui = "bold" },
  },
  -- inactive = {
  --     a = { bg = "darkgray", fg = gray, gui = 'bold' },
  --     b = { bg = "darkgray", fg = gray },
  --     c = { bg = "darkgray", fg = gray }
  -- }
}
