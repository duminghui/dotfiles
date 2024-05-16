local M = {}

function M.print_clients_config()
  local active_clients = vim.lsp.get_active_clients()
  for _, client in ipairs(active_clients) do
    vim.schedule(function()
      vim.notify(client.name .. ' : ' .. vim.inspect(client.config))
    end)
  end
end

function M.print_clients_server_capabilities()
  local active_clients = vim.lsp.get_active_clients()
  for _, client in ipairs(active_clients) do
    vim.schedule(function()
      vim.notify(client.name .. ' : ' .. vim.inspect(client.server_capabilities))
    end)
  end
end

return M
