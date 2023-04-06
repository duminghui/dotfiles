local M = {}

local disable_filetype = require('xxx.config.exclude-filetypes')
local icons = require('xxx.core.icons')

M.opts = {
  max_lines = 500,
  handle = {
    blend = 0,
  },
  marks = {
    Cursor = {
      text = icons.ui.SquareSmall,
      priority = 0,
      color = '#FFD700',
      cterm = nil,
      highlight = 'Normal',
    },
    Search = {
      color = '#FFD700',
    },
  },
  handlers = {
    diagnostic = true,
    gitsigns = true,
    -- not set to true, will conflict hlslens's setup
    search = false,
  },
  excluded_buftypes = {
    'terminal',
    'nofile',
    'quickfix',
    'prompt',
  },
  excluded_filetypes = disable_filetype.scrollbar,
}

function M.setup()
  local scrollbar = require('scrollbar')

  scrollbar.setup(M.opts)

  require('xxx.plugin-config.scroll.nvim-hlslens-rc').integrate_with_scrollbar()
end

return M
