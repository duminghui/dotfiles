local M = {}

local universal = {
  yellow = '#000000',
  orange = '#000000',
  red = '#000000',
  magenta = '#000000',
  violet = '#000000',
  blue = '#000000',
  cyan = '#000000',
  green = '#000000',
  purple = '#000000',
  darkgold = '#000000',
  bufferline = {
    text = '#000000',
    text_selected = '#000000',
    tag_fg = '#000000',
    tag_bg = '#000000',
    modified = '#000000',
    pick = '#000000',
  },
  statuline = {
    mode_fg = '#000000',
    mode_n_bg = '#000000',
    mode_i_bg = '#000000',
    mode_v_bg = '#000000',
    fg = '#000000',
    bg = '#000000',
  },
}

function M.set_universal(universal_colors)
  universal_colors = universal_colors or {}
  universal = vim.tbl_deep_extend('force', universal, universal_colors)
end

function M.universal()
  return universal
end

local rainbow = {
  c1 = '#FFD700',
  c2 = '#DA70D6',
  c3 = '#87CEFA',
  c4 = '#FFDB2A',
  -- c4 = "#FFA500",
  -- c4 = "#FFBD2A",
  c5 = '#EE82EE',
  -- c5 = "#F06292",
  c6 = '#359FF4',
  -- c6 = "#6495ED",
  c7 = '#FFA500',
}

function M.rainbow()
  return rainbow
end

return M
