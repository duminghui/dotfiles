local M = {}

function M.setup()
  local lsp_opts = require "xxx.lsp.config"
  require("mason-lspconfig").setup(lsp_opts.mason_lspconfig.setup)
  -- automatic_installation is handled by lsp-manager
  local settings = require "mason-lspconfig.settings"
  settings.current.automatic_installation = false

  -- 在mason配置后才能获取到列表
  -- print(vim.inspect(require("mason-lspconfig").get_available_servers()))
end

return M
