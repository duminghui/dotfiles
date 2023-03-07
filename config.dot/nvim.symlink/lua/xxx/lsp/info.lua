local M = {}
local Log = require "xxx.core.log"

function M.print_clients_config()
  -- P = { "<cmd>lua =vim.lsp.get_active_clients()[1].config<CR>", "Clients[1] Config" },
  local active_clients = vim.lsp.get_active_clients()
  for _, client in ipairs(active_clients) do
    Log:debug(vim.inspect(client.config))
  end
end

return M
