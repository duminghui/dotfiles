local M = {}

local tbl = require('xxx.utils.table')
local Log = require('xxx.core.log')

function M.is_client_active(name)
  local clients = vim.lsp.get_clients()
  return tbl.find_first(clients, function(client)
    return client.name == name
  end)
end

function M.get_active_clients_by_ft(filetype)
  local matches = {}
  local clients = vim.lsp.get_clients()
  for _, client in pairs(clients) do
    local supported_filetypes = client.config.filetypes or {}
    if client.name ~= 'null-ls' and vim.tbl_contains(supported_filetypes, filetype) then
      table.insert(matches, client)
    end
  end
  return matches
end

function M.get_client_capabilities(client_id)
  local client = vim.lsp.get_client_by_id(client_id)
  if not client then
    Log:warn('Unable to determine client from client_id: ' .. client_id)
    return
  end

  local enabled_caps = {}
  for capability, status in pairs(client.server_capabilities) do
    if status == true then
      table.insert(enabled_caps, capability)
    end
  end

  return enabled_caps
end

---Get supported filetypes per server
---@param server_name string can be any server supported by nvim-lsp-installer
---@return string[] supported filestypes as a list of strings
function M.get_supported_filetypes(server_name)
  local status_ok, config = pcall(require, ('lspconfig.server_configurations.%s'):format(server_name))
  if not status_ok then
    return {}
  end

  return config.default_config.filetypes or {}
end

---Get supported servers per filetype
---@param filter { filetype: string | string[] }?: (optional) Used to filter the list of server names.
---@return string[] list of names of supported servers
function M.get_supported_servers(filter)
  -- force synchronous mode, see: |mason-registry.refresh()|
  -- require('mason-registry').refresh()
  -- require('mason-registry').get_all_packages()

  local _, supported_servers = pcall(function()
    return require('mason-lspconfig').get_available_servers(filter)
  end)
  return supported_servers or {}
end

---Get all supported filetypes by nvim-lsp-installer
---@return string[] supported filestypes as a list of strings
function M.get_all_supported_filetypes()
  local status_ok, filetype_server_map = pcall(require, 'mason-lspconfig.mappings.filetype')
  if not status_ok then
    return {}
  end
  return vim.tbl_keys(filetype_server_map or {})
end

function M.setup_document_highlight(client, bufnr)
  -- 使用这个会影响到illuminate的Alt-N和Alt-P的功能
  -- local illuminate_ok, illuminate = pcall(require, "illuminate")
  -- if illuminate_ok then
  --     illuminate.on_attach(client)
  --     Log:debug "skipping setup for document_highlight, illuminate already active"
  --     return
  -- end
  -- local status_ok, highlight_supported = pcall(function()
  --     return client.supports_method "textDocument/documentHighlight"
  -- end)
  -- if not status_ok or not highlight_supported then
  --     return
  -- end
  --

  if not client.supports_method('textDocument/documentHighlight') then
    Log:debug(client.name .. " not support method 'textDocument/documentHighlight'")
    return
  end

  -- 触发条件为CursorHold, CursorHoldI
  -- 光标停留一段时间后
  local group = 'lsp_document_highlight'
  -- local hl_events = { "CursorHold", "CursorHoldI" }
  local hl_events = { 'CursorHold' }

  local ok, hl_autocmds = pcall(vim.api.nvim_get_autocmds, {
    group = group,
    buffer = bufnr,
    event = hl_events,
  })

  if ok and #hl_autocmds > 0 then
    return
  end

  vim.api.nvim_create_augroup(group, { clear = false })
  vim.api.nvim_create_autocmd(hl_events, {
    group = group,
    buffer = bufnr,
    callback = vim.lsp.buf.document_highlight,
  })
  vim.api.nvim_create_autocmd(
    { 'CursorMoved', 'InsertEnter' },
    -- { "CursorMoved" },
    {
      group = group,
      buffer = bufnr,
      callback = vim.lsp.buf.clear_references,
    }
  )
end

function M.setup_document_symbols(client, bufnr)
  vim.g.navic_silence = false -- can be set to true to supress error
  if not client.supports_method('textDocument/documentSymbol') then
    Log:debug(client.name .. " not support method 'textDocument/documentSymbol'")
    return
  end
  local status_ok, navic = pcall(require, 'nvim-navic')
  if status_ok then
    navic.attach(client, bufnr)
  end
end

function M.setup_codelens_refresh(client, bufnr)
  if not client.supports_method('textDocument/codeLens') then
    Log:debug(client.name .. " not support method 'textDocument/codeLens'")
    return
  end
  local group = 'lsp_code_lens_refresh'
  local cl_events = { 'BufEnter', 'InsertLeave' }
  local ok, cl_autocmds = pcall(vim.api.nvim_get_autocmds, {
    group = group,
    buffer = bufnr,
    event = cl_events,
  })

  if ok and #cl_autocmds > 0 then
    return
  end
  vim.api.nvim_create_augroup(group, { clear = false })
  vim.api.nvim_create_autocmd(cl_events, {
    group = group,
    buffer = bufnr,
    callback = function()
      vim.lsp.codelens.refresh { bufnr = bufnr }
    end,
  })
end

---filter passed to vim.lsp.buf.format
---always selects null-ls if it's available and caches the value per buffer
---@param client table client attached to a buffer
---@return boolean if client matches
function M.format_filter(client)
  local filetype = vim.bo.filetype
  local n = require('null-ls')
  local s = require('null-ls.sources')
  local method = n.methods.FORMATTING
  local avalable_formatters = s.get_available(filetype, method)
  if #avalable_formatters > 0 then
    return client.name == 'null-ls'
  elseif client.supports_method('textDocument/formatting') then
    return true
  else
    return false
  end
end

---@param opts table
function M.format(opts)
  opts = opts or {}
  opts.filter = opts.filter or M.format_filter
  opts.timeout_ms = opts.timeout_ms or 2000
  opts.async = false
  vim.b.format_changedtick = vim.b.changedtick
  -- bugs: diagnostic hidden, marks lose
  vim.lsp.buf.format(opts)
  local ok = pcall(vim.diagnostic.show, nil, nil)
  if not ok then
    print('pcall(vim.diagnostic.show) failed')
  end
end

function M.setup_format_on_save(client, bufnr, callback)
  if not client.supports_method('textDocument/formatting') then
    Log:debug(client.name .. " not support method 'textDocument/formatting'")
    return
  end
  local group = 'lsp_format_on_save'
  local events = { 'BufWritePre' }
  local ok, fos_autocmds = pcall(vim.api.nvim_get_autocmds, {
    group = group,
    buffer = bufnr,
    event = events,
  })

  if ok and #fos_autocmds > 0 then
    return
  end

  callback = callback or function()
    M.format {}
  end

  vim.api.nvim_create_augroup(group, { clear = false })
  vim.api.nvim_create_autocmd(events, {
    group = group,
    buffer = bufnr,
    callback = callback,
  })
end

function M.setup_fold()
  vim.wo.foldenable = false -- Disable folding at startup.
  vim.wo.foldlevel = 6
  vim.wo.foldmethod = 'expr'
  vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
end

return M
