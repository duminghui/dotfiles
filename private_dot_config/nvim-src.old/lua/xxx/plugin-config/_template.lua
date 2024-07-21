local M = {}

M.opts = {}

function M.setup()
  --   vim.print(M.opts)
  require('xxxxx').setup(M.opts)
end

function M.set_highlight()
  vim.cmd([[highlight xxxxx guifg=#FFD700]])
end

return M
