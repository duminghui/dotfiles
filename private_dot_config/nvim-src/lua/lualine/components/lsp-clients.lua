-- ## Usage
-- ## Options
--
-- *clients*
-- clients = { copilot = { symbol = icons.git.Octoface, color = { fg = "#6CC644", bg = com_bg } } }

local default_options = {
  icons = {
    active = "󰊲",
    inactive = "󰊱",
  },
  clients = {},
}

local M = require("lualine.component"):extend()
local icons = require("xxx.core.icons")

function M:init(options)
  M.super.init(self, options)
  self.options = vim.tbl_deep_extend("keep", self.options or {}, default_options)
  self.highlights = {}
  for key, client in pairs(self.options.clients) do
    self.highlights[key] = self:create_hl(client.color, "lsp_client_" .. key)
  end
end

function M:update_status()
  local buf_clients = vim.lsp.get_clients { bufnr = 0 }
  if not buf_clients or #buf_clients == 0 then
    return self.options.icons.inactive .. " Inactive "
  end
  local buf_client_names = {}
  local copilot_active = false
  for _, client in pairs(buf_clients) do
    -- print(client.name, client.method)
    if client.name ~= "null-ls" then
      table.insert(buf_client_names, client.name)
    end
    if client.name == "copilot" then
      copilot_active = true
    end
  end

  -- add formatter
  local buf_ft = vim.bo.filetype

  local nl = require("xxx.lsp.null-ls")

  local supported_formatters = nl.list_registered(buf_ft, "formatter")
  vim.list_extend(buf_client_names, supported_formatters)

  -- add linter
  local supported_linters = nl.list_registered(buf_ft, "linter")
  vim.list_extend(buf_client_names, supported_linters)

  -- add code action
  local supported_code_actions = nl.list_registered(buf_ft, "code-action")
  vim.list_extend(buf_client_names, supported_code_actions)

  local unique_client_names = vim.fn.uniq(buf_client_names)

  local language_servers = ""
  if type(unique_client_names) == "table" then
    language_servers = table.concat(unique_client_names, icons.ui.SquareSmall)
  end

  if copilot_active then
    local copilot = self.options.clients.copilot
    language_servers = language_servers .. self:format_hl(self.highlights["copilot"]) .. " " .. copilot.symbol -- .. "%*"
  end

  return self.options.icons.active .. " " .. language_servers
end

return M
