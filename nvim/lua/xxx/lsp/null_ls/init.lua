local M = {}
local Log = require "xxx.core.log"
local lsp_opts = require "xxx.lsp.config"

function M.setup()
  local status_ok, null_ls = pcall(require, "null-ls")
  if not status_ok then
    Log:error "Missing null-ls dependency"
    return
  end

  local default_opts = require("xxx.lsp").get_common_opts()
  null_ls.setup(vim.tbl_deep_extend("force", default_opts, lsp_opts.null_ls.setup))
end

return M
