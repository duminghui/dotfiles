local M = {}

M.opts = {
  multi_windows = false,
  -- create_hl_autocmd = false,
}

function M.setup()
  require('hop').setup(M.opts)
end

return M
