local M = {}

local icons = require('xxx.core.icons')

M.opts = {
  signcolumn = true,
  sign_priority = 60,
  signs = {
    add = {
      text = icons.ui.BoldLineLeft,
    },
    change = {
      text = icons.ui.BoldLineLeft,
    },
    delete = {
      text = icons.ui.TriangleShortArrowRight,
    },
    topdelete = {
      text = icons.ui.TriangleShortArrowRight,
    },
    changedelete = {
      text = icons.ui.BoldLineLeft,
    },
    untracked = { text = '┆' },
  },
  numhl = false,
  linehl = false,
  word_diff = false,
  attach_to_untracked = true,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  max_file_length = 40000,
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'rounded',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1,
  },
  watch_gitdir = {
    interval = 1000,
    follow_files = true,
  },
  update_debounce = 200,
  status_formatter = nil, -- Use default
}

function M.setup()
  local gitsigns = require('gitsigns')
  gitsigns.setup(M.opts)
end

return M
