local M = {}

-- Turns #rrggbb -> { red, green, blue }
local function rgb_str2num(rgb_color_str)
  if rgb_color_str:find('#') == 1 then
    rgb_color_str = rgb_color_str:sub(2, #rgb_color_str)
  end
  local red = 255
  local green = 255
  local blue = 255
  if #rgb_color_str == 6 then
    red = tonumber(rgb_color_str:sub(1, 2), 16)
    green = tonumber(rgb_color_str:sub(3, 4), 16)
    blue = tonumber(rgb_color_str:sub(5, 6), 16)
  end
  return { red = red, green = green, blue = blue }
end

-- Turns { red, green, blue } -> #rrggbb
local function rgb_num2str(rgb_color_num)
  local rgb_color_str = string.format('#%02x%02x%02x', rgb_color_num.red, rgb_color_num.green, rgb_color_num.blue)
  return rgb_color_str
end

local function compositeAlpha(fgAlpha, bgAlpha)
  return 0xFF - (((0xFF - bgAlpha) * (0xFF - fgAlpha)) / 0xFF)
end

local function compositeComponent(fgC, fgA, bgC, bgA, a)
  if a == 0 then
    return 0
  end
  return ((0xFF * fgC * fgA) + (bgC * bgA * (0xFF - fgA))) / (a * 0xFF)
end

-- https://en.wikipedia.org/wiki/Alpha_compositing
-- https://cs.android.com/androidx/platform/frameworks/support/+/androidx-main:core/core/src/main/java/androidx/core/graphics/ColorUtils.java
function M.compositeColors(fg_alpha, fg, bg)
  local fg_color = rgb_str2num(fg)
  local bg_color = rgb_str2num(bg)
  local bg_alpha = 255

  local a = compositeAlpha(fg_alpha, bg_alpha)
  local r = compositeComponent(fg_color.red, fg_alpha, bg_color.red, bg_alpha, a)
  local g = compositeComponent(fg_color.green, fg_alpha, bg_color.green, bg_alpha, a)
  local b = compositeComponent(fg_color.blue, fg_alpha, bg_color.blue, bg_alpha, a)
  return rgb_num2str { red = r, green = g, blue = b }
end

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
  bg = '#000000',
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
  -- c5 = '#EE82EE',
  c5 = '#F06292',
  c6 = '#359FF4',
  -- c6 = "#6495ED",
  c7 = '#FFBD2A',
}

function M.rainbow()
  return rainbow
end
return M
