local plugins = {
  { 'folke/lazy.nvim', tag = 'stable' },

  {
    'folke/which-key.nvim',
    config = function()
      require('xxx.plugin-config.which-key-rc').setup()
    end,
    cmd = 'WhichKey',
    keys = '<leader>',
  },
  -- {
  --   'christoomey/vim-tmux-navigator',
  --   cond = function()
  --     return os.getenv('TERM') == 'screen-256color'
  --   end,
  --   event = 'VeryLazy',
  -- },
  {
    'aserowy/tmux.nvim',
    cond = function()
      return os.getenv('TERM') == 'screen-256color'
    end,
    config = function()
      require('xxx.plugin-config.tmux-rc').setup()
    end,
    event = 'VeryLazy',
  },
  { 'Tastyep/structlog.nvim', lazy = true },
  { 'nvim-lua/plenary.nvim', lazy = true },
  {
    -- Automatically detects which indents should be used in the current buffer
    'tpope/vim-sleuth',
    event = 'BufEnter',
  },
  -- Icons
  {
    'nvim-tree/nvim-web-devicons',
    config = function()
      require('xxx.plugin-config.web-devicons-rc').setup()
    end,
    lazy = true,
  },

  {
    'olimorris/onedarkpro.nvim',
    config = function()
      require('xxx.plugin-config.colorscheme.onedarkpro-rc').setup()
    end,
    enabled = Xvim.colorscheme == 'one',
    priority = 1000,
  },

  { 'tjdevries/colorbuddy.nvim', lazy = true },

  {
    'svrana/neosolarized.nvim',
    config = function()
      require('xxx.plugin-config.colorscheme.neosolarized-rc').setup()
    end,
    enabled = Xvim.colorscheme == 'neo',
    priority = 1000,
  },

  {
    'Shatur/neovim-session-manager',
    config = function()
      require('xxx.plugin-config.session.session-manager-rc').setup()
    end,
    cmd = 'SessionManager',
  },
  {
    'ahmedkhalf/project.nvim', -- Automatically set the cwd to the project root
    config = function()
      require('xxx.plugin-config.project-rc').setup()
    end,
    event = 'VeryLazy',
    cmd = 'Telescope projects',
  },
  {
    'goolord/alpha-nvim',
    config = function()
      require('xxx.plugin-config.alpha-rc').setup()
    end,
    event = 'VimEnter',
  },

  {
    -- bufferline color and show work: load order colorscheme->bufferline->alpha-nvim
    'akinsho/bufferline.nvim',
    branch = 'main',
    dependencies = { 'nvim-web-devicons' },
    config = function()
      require('xxx.plugin-config.bufferline-rc').setup()
    end,
    event = 'User FileOpened',
  },
  {
    'famiu/bufdelete.nvim', -- Easily close buffers whilst preserving your window layouts
    cmd = { 'Bdelete', 'Bwipeout' },
  },
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('xxx.plugin-config.statusline.lualine-rc').setup()
    end,
    dependencies = { 'nvim-web-devicons' },
    event = 'VeryLazy',
  },

  {
    -- NvimTree
    'kyazdani42/nvim-tree.lua',
    config = function()
      require('xxx.plugin-config.nvim-tree-rc').setup()
    end,
    cmd = { 'NvimTreeToggle', 'NvimTreeOpen', 'NvimTreeFocus', 'NvimTreeFindFileToggle' },
    event = 'User DirOpened',
    enabled = false,
  },
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
    config = function()
      require('xxx.plugin-config.neo-tree-rc').setup()
    end,
    dependencies = { 'nvim-web-devicons', 'MunifTanjim/nui.nvim' },
    cmd = { 'NeoTreeShowToggle', 'Neotree' },
    event = 'User DirOpened',
    enabled = true,
  },

  {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config = function()
      require('xxx.plugin-config.hop-rc').setup()
    end,
    cmd = { 'HopAnywhere', 'HopChar1', 'HopChar2', 'HopWord', 'HopLineStart', 'HopLine', 'HopVertical', 'HopPattern' },
  },
  {
    'chentoast/marks.nvim',
    config = function()
      require('xxx.plugin-config.marks-rc').setup()
    end,
    event = 'BufEnter',
  },
  {
    -- Highlight hex and rgb colors within Neovim
    'NvChad/nvim-colorizer.lua',
    config = function()
      require('xxx.plugin-config.nvim-colorizer-rc').setup()
    end,
    event = 'BufEnter',
  },

  {
    'petertriho/nvim-scrollbar', -- A scrollbar for the current window
    config = function()
      require('xxx.plugin-config.scroll.nvim-scrollbar-rc').setup()
    end,
    event = 'BufEnter',
    dependencies = { 'nvim-hlslens', 'cinnamon.nvim' },
  },
  {
    'declancm/cinnamon.nvim', -- Smooth scrolling
    config = function()
      require('xxx.plugin-config.scroll.cinnamon-rc').setup()
    end,
    lazy = true,
  },
  {
    'kevinhwang91/nvim-hlslens', -- Highlight searches
    config = function()
      require('xxx.plugin-config.scroll.nvim-hlslens-rc').setup()
    end,
    lazy = true,
  },

  --- lsp

  {
    'neovim/nvim-lspconfig',
    dependencies = { 'mason-lspconfig.nvim' },
    lazy = true,
  },
  {
    -- null-ls是一个将非LSP的包与nvim内置LSP客户端整合的插件
    'jose-elias-alvarez/null-ls.nvim',
    lazy = true,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require('xxx.plugin-config.mason-lspconfig-rc').setup()
    end,
    cmd = { 'LspInstall', 'LspUninstall' },
    dependencies = 'mason.nvim',
  },
  {
    'williamboman/mason.nvim',
    config = function()
      require('xxx.plugin-config.mason-rc').setup()
    end,
    cmd = { 'Mason', 'MasonInstall', 'MasonUninstall', 'MasonUninstallAll', 'MasonLog' },
  },
  -- SchemaStore use in lsp/providers
  {
    'b0o/schemastore.nvim',
    lazy = true,
  },
  {
    -- include breadcrumbs
    'glepnir/lspsaga.nvim',
    branch = 'main',
    config = function()
      require('xxx.plugin-config.lspsaga-rc').setup()
    end,
    event = 'User FileOpened',
    cmd = 'Lspsaga',
  },
  {
    -- Standalone UI for nvim-lsp progress.
    'j-hui/fidget.nvim',
    config = function()
      require('xxx.plugin-config.fidget-rc').setup()
    end,
    event = 'User FileOpened',
  },
  {
    'folke/trouble.nvim',
    config = function()
      require('xxx.plugin-config.trouble-rc').setup()
    end,
    cmd = { 'Trouble', 'TroubleToggle' },
  },

  -- Install nvim-cmp, and buffer source as a dependency

  {
    'hrsh7th/nvim-cmp',
    config = function()
      require('xxx.plugin-config.nvim-cmp-rc').setup()
    end,
    cmd = { 'CmpStatus' },
    dependencies = {
      -- cmp sources --
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lsp-signature-help' },
      { 'hrsh7th/cmp-nvim-lua' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-cmdline' },
      { 'saadparwaiz1/cmp_luasnip' },
    },
    event = { 'InsertEnter', 'CmdlineEnter' },
    enabled = Xvim.use_lsp,
  },

  {
    -- Code snippets
    'L3MON4D3/LuaSnip',
    config = function()
      require('xxx.plugin-config.luasnip-rc').setup()
    end,
    dependencies = {
      'rafamadriz/friendly-snippets',
    },
    event = 'InsertEnter',
    enabled = Xvim.use_lsp,
  },
  {
    -- vim functions for dev
    'folke/neodev.nvim',
    lazy = true,
  },

  -- Autopairs
  {
    'windwp/nvim-autopairs',
    config = function()
      require('xxx.plugin-config.nvim-autopairs-rc').setup()
    end,
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'hrsh7th/nvim-cmp' },
    lazy = true,
    event = 'InsertEnter',
  },
  {
    'windwp/nvim-ts-autotag',
    config = function()
      require('xxx.plugin-config.nvim-autotag-rc').setup()
    end,
    lazy = true,
    ft = {
      'html',
      'javascript',
      'typescript',
      'javascriptreact',
      'typescriptreact',
      'svelte',
      'vue',
      'tsx',
      'jsx',
      'rescript',
      'xml',
      'php',
      'markdown',
      'glimmer',
      'handlebars',
      'hbs',
    },
  },

  -- Treesitter
  {
    -- highlight, linter, formater, indent framework
    'nvim-treesitter/nvim-treesitter',
    -- build = ":TSUpdate",
    config = function()
      require('xxx.plugin-config.nvim-treesitter-rc').setup()
    end,
    cmd = {
      'TSInstall',
      'TSUninstall',
      'TSUpdate',
      'TSUpdateSync',
      'TSInstallInfo',
      'TSInstallSync',
      'TSInstallFromGrammar',
    },
    dependencies = { 'nvim-treesitter-textobjects', 'nvim-ts-rainbow', 'nvim-ts-autotag' },
    event = 'User FileOpened',
  },
  {
    -- 代码吸顶
    'nvim-treesitter/nvim-treesitter-context',
    config = function()
      require('xxx.plugin-config.nvim-treesitter-context-rc').setup()
    end,
    event = 'BufEnter',
  },
  {
    -- tsx 注释增强
    -- Lazy loaded by Comment.nvim pre_hook
    'JoosepAlviste/nvim-ts-context-commentstring',
    lazy = true,
  },
  {
    -- 高亮显示相同的单词
    'RRethy/vim-illuminate',
    config = function()
      require('xxx.plugin-config.vim-illuminate-rc').setup()
    end,
    event = 'User FileOpened',
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('xxx.plugin-config.indent-blankline-rc').setup()
    end,
    event = 'User FileOpened',
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects', -- Syntax aware text-objects, select, move, swap, and peek support.
    lazy = true,
  },
  {
    'p00f/nvim-ts-rainbow',
    lazy = true,
  },

  {
    'stevearc/overseer.nvim', -- Task runner and job management
    -- INFO: Overseer lazy loads itself
    config = function()
      require('xxx.plugin-config.overseer-rc').setup()
    end,
    cmd = { 'OverseerOpen', 'OverseerRun', 'OverseerToggle' },
  },

  ---
  -- Telescope
  {
    -- 列表模糊搜索框架, 高扩展
    -- need install BurntSushi/ripgrep
    -- :Telescope find_files<cr>
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    config = function()
      require('xxx.plugin-config.telescope-rc').setup()
    end,
    cmd = 'Telescope',
    event = 'VeryLazy',
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    lazy = true,
  },
  { 'tami5/sqlite.lua', lazy = true },
  {
    'nvim-telescope/telescope-frecency.nvim', -- Get frequently opened files
    dependencies = 'sqlite.lua',
    lazy = true,
  },
  {
    'nvim-telescope/telescope-smart-history.nvim', -- Show project dependant history
    dependencies = 'sqlite.lua',
    lazy = true,
  },
  {
    'ThePrimeagen/harpoon', -- Mark buffers for faster navigation
    config = function()
      require('xxx.plugin-config.harpoon-rc').setup()
    end,
    lazy = true,
  },

  --

  {
    -- vim.ui.select, vim.ui.input hooks
    'stevearc/dressing.nvim',
    config = function()
      require('xxx.plugin-config.dressing-rc').setup()
    end,
    event = 'VeryLazy',
  },

  -- Comments
  {
    'numToStr/Comment.nvim',
    config = function()
      require('xxx.plugin-config.comment-rc').setup()
    end,
    keys = { { 'gc', mode = { 'n', 'v' } }, { 'gb', mode = { 'n', 'v' } } },
    event = 'User FileOpened',
  },

  {
    'kylechui/nvim-surround',
    config = function()
      require('nvim-surround').setup()
    end,
    keys = { 'ys', 'cs', 'ds' },
  },

  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('xxx.plugin-config.gitsigns-rc').setup()
    end,
    event = 'User FileOpened',
    cmd = 'Gitsigns',
  },

  {
    'akinsho/toggleterm.nvim',
    branch = 'main',
    config = function()
      require('xxx.plugin-config.toggleterm-rc').setup()
    end,
    cmd = {
      'ToggleTerm',
      'TermExec',
      'ToggleTermToggleAll',
      'ToggleTermSendCurrentLine',
      'ToggleTermSendVisualLines',
      'ToggleTermSendVisualSelection',
    },
  },

  {
    -- kitty syntax
    'fladson/vim-kitty',
    lazy = true,
    ft = 'kitty',
  },

  --------------- languages --------------------
  {
    -- https://github.com/golang/tools/blob/master/gopls/doc/settings.md
    'ray-x/go.nvim',
    dependencies = {
      'ray-x/guihua.lua', -- recommanded if need floating window support
    },
    config = function()
      require('xxx.plugin-config.lang.go-rc').setup()
    end,
    enabled = false,
    ft = { 'go', 'gomod', 'gosum', 'gotmpl', 'gohtmltmpl', 'gotexttmpl' },
  },

  {
    'simrat39/rust-tools.nvim',
    config = function()
      require('xxx.plugin-config.lang.rs-rust-tools-rc').setup()
    end,
    enabled = true,
    ft = { 'rust' },
  },

  {
    -- rust crates manager
    'saecki/crates.nvim',
    version = '0.3.0',
    config = function()
      require('xxx.plugin-config.lang.rs-crates-rc').setup()
    end,
    enabled = true,
    event = { 'BufRead Cargo.toml' },
  },

  -- {
  --   -- for yarn
  --   'lbrayner/vim-rzip',
  --   ft = { 'typescript', 'vue' },
  -- },

  {
    'neoclide/coc.nvim',
    branch = 'release',
    config = function()
      require('xxx.plugin-config.coc-rc').setup()
    end,
    event = { 'InsertEnter', 'CmdlineEnter' },
    enabled = not Xvim.use_lsp,
  },
}
return plugins
