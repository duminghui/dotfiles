local M = {}

local lsp_opts = require('xxx.lsp.config')
local default_opts = { buffer = 0, desc = '', noremap = true, silent = false }

function M.set_keymap(bufnr, mode, key, map, desc)
  local opts = vim.tbl_deep_extend('keep', { buffer = bufnr, desc = desc }, default_opts)
  vim.keymap.set(mode, key, map, opts)
end

local function show_documentation()
  local filetype = vim.bo.filetype
  if vim.tbl_contains({ 'vim', 'help' }, filetype) then
    vim.cmd('h ' .. vim.fn.expand('<cword>'))
  elseif vim.tbl_contains({ 'man' }, filetype) then
    vim.cmd('Man ' .. vim.fn.expand('<cword>'))
  elseif vim.fn.expand('%:t') == 'Cargo.toml' and require('crates').popup_available() then
    require('crates').show_popup()
  else
    vim.lsp.buf.hover()
  end
end

local function crates_function(type)
  return function()
    require('crates')[type]()
  end
end

function M.add_lsp_buffer_keybindings(client, bufnr)
  -- all provider name
  -- https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#serverCapabilities
  local not_null_ls = client.name ~= 'null-ls'
  local code_action_provide = false
  local format_provide = false
  local hover_provide = false
  local definition_provide = false
  local type_definition_provide = false
  local declaration_provide = false
  local references_provide = false
  local implementation_provide = false
  local signature_help_provide = false
  local rename_provide = false
  local code_lens_provide = false
  local crates_provide = false
  if not_null_ls then
    local capabilities = client.server_capabilities
    code_action_provide = capabilities.codeActionProvider
    format_provide = capabilities.documentFormattingProvider
    hover_provide = capabilities.hoverProvider
    definition_provide = capabilities.definitionProvider
    type_definition_provide = capabilities.typeDefinitionProvider
    declaration_provide = capabilities.declarationProvider
    references_provide = capabilities.referencesProvider
    implementation_provide = capabilities.implementationProvider
    signature_help_provide = capabilities.signatureHelpProvider
    rename_provide = capabilities.renameProvider
    code_lens_provide = capabilities.codeLensProvider
  else
    local filetype = vim.bo.filetype
    local n = require('null-ls')
    local s = require('null-ls.sources')
    local method = n.methods.FORMATTING
    local avalable_formatters = s.get_available(filetype, method)
    format_provide = #avalable_formatters > 0
    if vim.fn.expand('%:t') == 'Cargo.toml' then
      crates_provide = true
    end
  end
  local keymaps = {
    ['K'] = { show_documentation, '[LSP]Show hover', hover_provide },

    ['ga'] = { vim.lsp.buf.code_action, '[LSP]Code Action', code_action_provide },

    -- ["gd"] = { vim.lsp.buf.definition, "[LSP]Goto definition", definition_provide },
    -- ["gd"] = { "<cmd>Lspsaga goto_definition<CR>", "[LSP]Goto definition", definition_provide },
    ['gd'] = { '<cmd>Trouble lsp_definitions<CR>', 'Goto definition', definition_provide }, -- can't use <CTRL-O> or <CTRL-T> jump

    ['gD'] = { '<cmd>Lspsaga peek_definition<CR>', '[LSP]Peek definition', definition_provide },

    ['gt'] = { vim.lsp.buf.type_definition, '[LSP]Goto type definition', type_definition_provide },

    ['gf'] = { vim.lsp.buf.declaration, '[LSP]Goto declaration', declaration_provide },

    -- ["gr"] = { vim.lsp.buf.references, "[LSP]Goto references", references_provide },
    -- ["gr"] = { "<cmd>Lspsaga lsp_finder<CR>", "[LSP]Goto references", references_provide },
    ['gr'] = { '<cmd>Trouble lsp_references<CR>', '[LSP]Goto references', references_provide }, -- can't use <CTRL-O> or <CTRL-T> jump

    ['gI'] = { vim.lsp.buf.implementation, '[LSP]Goto implementation', implementation_provide },

    ['gs'] = { vim.lsp.buf.signature_help, '[LSP]Show signature help', signature_help_provide },

    ['gnr'] = { vim.lsp.buf.rename, '[LSP]Rename', rename_provide },

    ['gl'] = {
      function()
        local config = lsp_opts.diagnostics.float
        config.scope = 'line'
        config.bufnr = 0
        vim.diagnostic.open_float(config)
      end,
      '[LSP]Show line diagnostics',
      not_null_ls,
    },

    ['[d'] = { vim.diagnostic.goto_prev, '[LSP]Prev Diagnostic', not_null_ls },
    [']d'] = { vim.diagnostic.goto_next, '[LSP]Next Diagnostic', not_null_ls },

    ['gL'] = { vim.lsp.codelens.run, '[LSP]Code lens', code_lens_provide },

    ['<LocalLeader>lf'] = {
      function()
        require('xxx.lsp.utils').format {}
      end,
      '[LSP]Format',
      format_provide,
    },
    ['<LocalLeader>cp'] = { crates_function('show_crate_popup'), '[Crates]Crate Popup', crates_provide },
    ['<LocalLeader>cv'] = { crates_function('show_versions_popup'), '[Crates]Versions Popup', crates_provide },
    ['<LocalLeader>cf'] = { crates_function('show_features_popup'), '[Crates]Features Popup', crates_provide },
    ['<LocalLeader>cd'] = { crates_function('show_dependencies_popup'), '[Crates]Dependencies Popup', crates_provide },
    ['<LocalLeader>cu'] = { crates_function('update_crate'), '[Crates]Update Create', crates_provide },
    ['<LocalLeader>cU'] = { crates_function('upgrade_crate'), '[Crates]Upgrade Create', crates_provide },
    ['<LocalLeader>cA'] = { crates_function('upgrade_all_crates'), '[Crates]Upgrade All Creates', crates_provide },
  }

  for key, remap in pairs(keymaps) do
    if remap[3] then
      M.set_keymap(bufnr, 'n', key, remap[1], remap[2])
    end
  end
end

return M
