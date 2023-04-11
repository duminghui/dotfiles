local M = {}

M.opts = {
  override = {},
  default = true,
  strict = true,
  override_by_filename = {},
}

function M.setup()
  local devicons = require('nvim-web-devicons')
  -- plugin use vim.tbl_extend("force",icons,...)
  devicons.setup(M.opts)
end

return M
