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
  },
  default = true,
  override_by_filename = {
    ['tasks.json'] = {
      icon = 'ﬥ',
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
