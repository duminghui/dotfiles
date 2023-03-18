local skipped_servers = {
  "angularls",
  "ansiblels",
  "ccls",
  "csharp_ls",
  "cssmodules_ls",
  "denols",
  "ember",
  "emmet_ls",
  "eslint",
  "eslintls",
  "gopls",
  "golangci_lint_ls",
  "gradle_ls",
  "graphql",
  "jedi_language_server",
  "ltex",
  "ocamlls",
  "phpactor",
  "psalm",
  "pylsp",
  "quick_lint_js",
  "reason_ls",
  "rome",
  "ruby_ls",
  "rust_analyzer",
  "scry",
  "solang",
  "solc",
  "solidity_ls",
  "sorbet",
  "sourcekit",
  "sourcery",
  "spectral",
  "sqlls",
  "sqls",
  "stylelint_lsp",
  "svlangserver",
  "tflint",
  "verible",
  "vuels",
}

local skipped_filetypes = { "markdown", "rst", "plaintext" }

local diagnostic_float = {
  focusable = false,
  style = "minimal",
  border = "single",
  source = "always",
  header = "",
  prefix = "",
  format = function(d)
    local code = d.code or (d.user_data and d.user_data.lsp.code)
    if code then
      return string.format("%s [%s]", d.message, code):gsub("1. ", "")
    end
    return d.message
  end,
}

local icons = require "xxx.core.icons"

local options = {
  templates_dir = join_paths(vim.fn.stdpath "data", "site", "after", "ftplugin"),
  diagnostics = {
    signs = {
      priority = 30,
      values = {
        { name = "DiagnosticSignError", text = icons.diagnostics.BoldError },
        { name = "DiagnosticSignWarn", text = icons.diagnostics.BoldWarning },
        { name = "DiagnosticSignHint", text = icons.diagnostics.Hint },
        { name = "DiagnosticSignInfo", text = icons.diagnostics.BoldInformation },
      },
    },
    virtual_text = {
      prefix = "",
      -- spacing = 12,
    },
    -- true: cmp's ghost_text show bug
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = diagnostic_float,
  },
  float = {
    focusable = true,
    style = "minimal",
    border = "single",
  },
  automatic_configuration = {
    ---@usage list of servers that the automatic installer will skip
    skipped_servers = skipped_servers,
    ---@usage list of filetypes that the automatic installer will skip
    skipped_filetypes = skipped_filetypes,
  },
  buffer_options = {
    --- enable completion triggered by <c-x><c-o>
    omnifunc = "v:lua.vim.lsp.omnifunc",
    --- use gq for formatting
    formatexpr = "v:lua.vim.lsp.formatexpr(#{timeout_ms:500})",
  },
  ---@usage list of settings of mason_lspconfig
  mason_lspconfig = {
    setup = {
      ensure_installed = {},
      automatic_installation = {
        -- exclude = {},
        exclude = skipped_servers,
      },
    },
  },
  nlsp_settings = {
    setup = {
      config_home = join_paths(vim.fn.stdpath "config", "lsp-settings"),
      -- set to false to overwrite schemastore.nvim
      ignored_servers = {},
      append_default_schemas = true,
      loader = "json",
    },
  },
  null_ls = {
    setup = {
      sources = {
        require("null-ls").builtins.formatting.stylua,
        -- require("null-ls").builtins.formatting.rustfmt.with {
        -- 不起作用
        --   generator_opts = {
        --     args = { "+nightly", "--emit=stdout" },
        --   },
        -- },
      },
    },
    config = {},
  },
}
return options
