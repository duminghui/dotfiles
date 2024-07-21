local M = {}
local Log = require('xxx.core.log')
local autocmds = require('xxx.core.autocmds')

local lsp_opts = require('xxx.lsp.config')

function M.add_lsp_buffer_options(bufnr)
  for k, v in pairs(lsp_opts.buffer_options) do
    vim.api.nvim_set_option_value(k, v, { buf = bufnr })
  end
end

function M.common_capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  local status_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
  if status_ok then
    return cmp_nvim_lsp.default_capabilities(capabilities)
  end
  return capabilities
end

local fmt = string.format

function M.common_on_error(code, err)
  Log:error(fmt('code: %s, err: %s', code, err))
end

-- function M.common_on_init(client, initialize_result)
function M.common_on_init(_, _)
  -- print("common_on_init")
end

function M.common_on_attach(client, bufnr)
  local lu = require('xxx.lsp.utils')

  lu.setup_document_highlight(client, bufnr)

  lu.setup_codelens_refresh(client, bufnr)

  lu.setup_format_on_save(client, bufnr)

  require('xxx.lsp.keymappings').add_lsp_buffer_keybindings(client, bufnr)

  M.add_lsp_buffer_options(bufnr)

  lu.setup_document_symbols(client, bufnr)

  lu.setup_fold()
end

function M.common_on_exit(_, _)
  -- print("common_on_exit")
  autocmds.clear_augroup('lsp_document_highlight')
  autocmds.clear_augroup('lsp_code_lens_refresh')
end

function M.get_common_opts()
  return {
    on_error = M.common_on_error,
    on_init = M.common_on_init,
    on_attach = M.common_on_attach,
    on_exit = M.common_on_exit,
    capabilities = M.common_capabilities(),
  }
end

local icons = require('xxx.core.icons')

M.opts = {
  diagnostics = {
    signs = {
      priority = 30,
      values = {
        { name = 'DiagnosticSignError', text = icons.diagnostics.BoldError },
        { name = 'DiagnosticSignWarn', text = icons.diagnostics.BoldWarning },
        { name = 'DiagnosticSignHint', text = icons.diagnostics.Hint },
        { name = 'DiagnosticSignInfo', text = icons.diagnostics.BoldInformation },
      },
    },
    virtual_text = {
      -- prefix = icons.ui.Square,
      -- spacing = 12,
    },
    -- true: cmp's ghost_text show bug
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      -- style = 'minimal',
      border = 'single',
      -- border = 'none',
      source = 'always',
      header = '',
      prefix = ' ',
      suffix = ' ',
      -- title = ' Diagnostic ',
      format = function(d)
        local code = d.code or (d.user_data and d.user_data.lsp and d.user_data.lsp.code)
        if code then
          return string.format('%s [%s]', d.message, code):gsub('1. ', '')
        end
        return d.message
      end,
    },
  },
}

function M.setup()
  Log:info('Setting up LSP support')
  local lsp_status_ok, _ = pcall(require, 'lspconfig')
  if not lsp_status_ok then
    Log:debug('LSP: lspconfig not ok')
    return
  end

  vim.diagnostic.config(M.opts.diagnostics)

  -- command :LspInfo 's border
  -- require('lspconfig.ui.windows').default_options.border = 'single'
  -- local hl_name = "NormalFloat"
  -- require('lspconfig.ui.windows').default_options.border = {
  --     { "╭", hl_name },
  --     { "─", hl_name },
  --     { "╮", hl_name },
  --     { "│", hl_name },
  --     { "╯", hl_name },
  --     { "─", hl_name },
  --     { "╰", hl_name },
  --     { "│", hl_name },
  -- }
  --

  -- diagnostics signs
  -- for _, sign in ipairs(vim.tbl_get(vim.diagnostic.config(), "signs", "values") or {}) do
  for _, sign in ipairs(M.opts.diagnostics.signs.values) do
    vim.fn.sign_define(sign.name, { text = sign.text, texthl = sign.name, numhl = sign.name })
  end

  require('xxx.lsp.handlers').setup()

  local templates = require('xxx.lsp.templates')
  templates.generate_templates()

  -- require("nlspsettings").setup(lsp_opts.nlsp_settings.setup)

  require('mason-lspconfig').setup(lsp_opts.mason_lspconfig.setup)

  local util = require('lspconfig.util')
  -- automatic_installation is handled by lsp-manager
  util.on_setup = nil

  require('xxx.lsp.null_ls').setup()

  -- autocmds.configure_format_on_save(true)
end

return M
