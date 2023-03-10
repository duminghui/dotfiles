local M = {}
M.opts  = {
  -- true: when treesitter-context show had bug
  multi_windows = false,
}

function M.setup()
  local hop = require("hop")
  hop.setup(M.opts)
end

return M
