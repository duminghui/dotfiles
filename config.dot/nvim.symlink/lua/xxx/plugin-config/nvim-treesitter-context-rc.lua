local M = {}

M.opts = {
  mode = "topline",
}

function M.setup()
  local context = require "treesitter-context"

  context.setup(M.opts)

  -- 行数背景色保持一样
  -- vim.cmd("highlight link TreesitterContextLineNumber TreesitterContext")
end

return M
