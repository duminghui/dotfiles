local M = {}

local icons = require('xxx.core.icons')

M.opts = {
  override = {
    default_icon = {
      icon = icons.ui.File,
      color = '#6d8086',
      cterm_color = '66',
      name = 'Default',
    },
    ['bat'] = {
      icon = '󰒓',
      color = '#C1F12E',
      cterm_color = '191',
      name = 'Bat',
    },
    ['cmake'] = {
      icon = '󰒓',
      color = '#6d8086',
      cterm_color = '66',
      name = 'CMake',
    },
    ['conf'] = {
      icon = '󰒓',
      color = '#6d8086',
      cterm_color = '66',
      name = 'Conf',
    },
    ['gd'] = {
      icon = '󰒓',
      color = '#6d8086',
      cterm_color = '66',
      name = 'GDScript',
    },
    ['ini'] = {
      icon = '󰒓',
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
      icon = '󰪷',
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
      icon = '󰒓',
      color = '#6d8086',
      cterm_color = '66',
      name = 'Toml',
    },
    ['yaml'] = {
      icon = '󰒓',
      color = '#6d8086',
      cterm_color = '66',
      name = 'Yaml',
    },
    ['yml'] = {
      icon = '󰒓',
      color = '#6d8086',
      cterm_color = '66',
      name = 'Yml',
    },
  },
  default = false,
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
  devicons.setup(M.opts)
end

return M
