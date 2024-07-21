local M = {}

M.opts = {
  multi_windows = false,
  -- create_hl_autocmd = false,
}

function M.insert_highlights()
  local set = vim.api.nvim_set_hl

  -- Highlight used for the mono-sequence keys (i.e. sequence of 1).
  set(0, 'HopNextKey', { fg = '#ff007c', bold = true, ctermfg = 198, cterm = { bold = true }, default = false })

  -- Highlight used for the first key in a sequence.
  set(0, 'HopNextKey1', { fg = '#00dfff', bold = true, ctermfg = 45, cterm = { bold = true }, default = false })

  -- Highlight used for the second and remaining keys in a sequence.
  set(0, 'HopNextKey2', { fg = '#2b8db3', ctermfg = 33, default = false })

  -- Highlight used for the unmatched part of the buffer.
  set(0, 'HopUnmatched', { fg = '#666666', sp = '#666666', ctermfg = 242, default = false })

  -- Highlight used for the fake cursor visible when hopping.
  set(0, 'HopCursor', { link = 'Cursor', default = false })

  -- Highlight used for preview pattern
  set(0, 'HopPreview', { link = 'IncSearch', default = false })
end

function M.setup()
  require('hop').setup(M.opts)
  M.insert_highlights()
end

return M
