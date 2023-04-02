local M = {}

M.opts = {
  multi_windows = false,
}

function M.setup()
  require("hop").setup(M.opts)
end

return M
