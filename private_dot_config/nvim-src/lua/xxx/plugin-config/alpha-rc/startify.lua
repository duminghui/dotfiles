local M = {}

local version = vim.version()
local ver_str = string.format('%s.%s.%s', version.major, version.minor, version.patch)

local icons = require('xxx.core.icons')

function M.get_sections()
  local header = {
    type = 'text',
    val = {
      'Neovim ' .. ver_str,
    },
    opts = {
      hl = 'Label',
      shrink_margin = false,
      -- wrap = "overflow";
    },
  }

  local top_buttons = {
    entries = {
      { 'e', icons.ui.File .. '  New File', '<CMD>ene!<CR>' },
    },
  }

  local bottom_buttons = {
    entries = {
      { 'q', 'Quit', '<CMD>quit<CR>' },
    },
  }

  local footer = {
    type = 'group',
  }

  return {
    header = header,
    top_buttons = top_buttons,
    bottom_buttons = bottom_buttons,
    -- this is probably broken
    footer = footer,
  }
end

return M
