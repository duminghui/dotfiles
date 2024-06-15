local skipped_servers = {
  'angularls',
  'ansiblels',
  'antlersls',
  'ast_grep',
  'azure_pipelines_ls',
  'basedpyright',
  'biome',
  'blz',
  'ccls',
  'css_variables',
  'cssmodules_ls',
  'custom_elements_ls',
  'denols',
  'docker_compose_language_service',
  'dprint',
  'ember',
  'emment_language_server',
  'emmet_ls',
  -- 'eslint',
  -- 'eslintls',
  'fennel_language_server',
  'gitlab_ci_ls',
  'glint',
  'glslls',
  -- 'gopls',
  'golangci_lint_ls',
  'gradle_ls',
  'graphql',
  'harper_ls',
  'hdl_checker',
  'hydra_lsp',
  'htmx',
  'java_language_server',
  'jedi_language_server',
  'lexical',
  'ltex',
  'lwc_ls',
  'mdx_analyer',
  'neocmake',
  'nim_langserver',
  'ocamlls',
  'omnisharp',
  'phpactor',
  'psalm',
  'pylsp',
  'pylyzer',
  'pyre',
  'quick_lint_js',
  'reason_ls',
  'rnix',
  'rome',
  'rubocop',
  'ruby_ls',
  'ruby_lsp',
  'rust_analyzer', -- this launch by mrcjkb/rustaceanvim
  'scry',
  'snyk_ls',
  'solang',
  'solc',
  'solidity_ls',
  'solidity_ls_nomicfoundation',
  'sorbet',
  'sourcekit',
  'somesass_ls',
  'sourcery',
  'spectral',
  'sqlls',
  'sqls',
  'standardrb',
  'stimulus_ls',
  'stylelint_lsp',
  'svlangserver',
  'swift_mesonls',
  'templ',
  'tflint',
  'tinymist',
  'unocss',
  'vale_ls',
  'vacuum',
  'varible',
  'v_analyzer',
  'vtsls',
  'vuels',
  ---
  'tailwindcss',
  'tflint',
  'tsserver',
}

local skipped_filetypes = { 'markdown', 'rst', 'plaintext' }

local builtins = require('null-ls').builtins

local options = {
  templates_dir = join_paths(vim.fn.stdpath('data'), 'site', 'after', 'ftplugin'),
  automatic_configuration = {
    ---@usage list of servers that the automatic installer will skip
    skipped_servers = skipped_servers,
    ---@usage list of filetypes that the automatic installer will skip
    skipped_filetypes = skipped_filetypes,
  },
  buffer_options = {
    --- enable completion triggered by <c-x><c-o>
    omnifunc = 'v:lua.vim.lsp.omnifunc',
    --- use gq for formatting
    formatexpr = 'v:lua.vim.lsp.formatexpr(#{timeout_ms:500})',
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
      config_home = join_paths(vim.fn.stdpath('config'), 'lsp-settings'),
      -- set to false to overwrite schemastore.nvim
      ignored_servers = {},
      append_default_schemas = true,
      loader = 'json',
    },
  },
  null_ls = {
    setup = {
      sources = {
        builtins.formatting.stylua,
        builtins.formatting.prettier,
        -- builtins.code_actions.eslint_d,
        -- builtins.diagnostics.eslint_d,
        -- builtins.formatting.eslint_d,

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
