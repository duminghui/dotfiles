local M = require("lualine.component"):extend()

function M:update_status()
  return vim.b.gitsigns_head or ""
end

return M
