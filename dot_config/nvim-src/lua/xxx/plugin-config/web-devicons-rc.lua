local M = {}

local icons = require('xxx.core.icons')

M.opts = {
  override = {
    default_icon = {
      icon = icons.ui.Text,
      color = '#6d8086',
      cterm_color = '66',
      name = 'Default',
    },
    ['bat'] = {
      icon = icons.ui.Gear,
      color = '#C1F12E',
      cterm_color = '191',
      name = 'Bat',
    },
    ['cmake'] = {
      icon = icons.ui.Gear,
      color = '#6d8086',
      cterm_color = '66',
      name = 'CMake',
    },
    ['conf'] = {
      icon = icons.ui.Gear,
      color = '#6d8086',
      cterm_color = '66',
      name = 'Conf',
    },
    ['gd'] = {
      icon = icons.ui.Gear,
      color = '#6d8086',
      cterm_color = '66',
      name = 'GDScript',
    },
    ['ini'] = {
      icon = icons.ui.Gear,
      color = '#6d8086',
      cterm_color = '66',
      name = 'Ini',
    },
    ['lock'] = {
      icon = icons.ui.LockOpen,
      color = '#bbbbbb',
      cterm_color = '250',
      name = 'Lock',
    },
    ['log'] = {
      icon = icons.ui.TextMultiple,
      color = '#ffffff',
      cterm_color = '231',
      name = 'Log',
    },
    ['lua'] = {
      icon = '󰢱',
      color = '#51a0cf',
      cterm_color = '74',
      name = 'Lua',
    },
    ['toml'] = {
      icon = icons.ui.Gear,
      color = '#6d8086',
      cterm_color = '66',
      name = 'Toml',
    },
    ['yaml'] = {
      icon = icons.ui.Gear,
      color = '#6d8086',
      cterm_color = '66',
      name = 'Yaml',
    },
    ['yml'] = {
      icon = icons.ui.Gear,
      color = '#6d8086',
      cterm_color = '66',
      name = 'Yml',
    },
  },
  default = true,
  strict = true,
  override_by_filename = {
    ['tasks.json'] = {
      icon = '󰘦',
      color = '#cbcb41',
      cterm_color = '185',
      name = 'Jsonc',
    },
  },
}

function M.setup()
  local devicons = require('nvim-web-devicons')
  -- plugin use vim.tbl_extend("force",icons,...)
  devicons.setup(M.opts)
end

return M
