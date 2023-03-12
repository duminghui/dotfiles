local to_load = not vim.g.vscode
local plugins = {
  { "folke/lazy.nvim", tag = "stable" },
  { "nvim-lua/plenary.nvim", cond = to_load, lazy = true },
  {
    -- Automatically detects which indents should be used in the current buffer
    "tpope/vim-sleuth",
    cond = to_load,
    event = "BufEnter",
  },
  -- Icons
  {
    "nvim-tree/nvim-web-devicons",
    cond = to_load,
    config = function()
      require("xxx.plugin-config.web-devicons-rc").setup()
    end,
    lazy = true,
  },
  {
    "olimorris/onedarkpro.nvim",
    cond = to_load,
    config = function()
      require("xxx.plugin-config.colorscheme.onedarkpro-rc").setup()
    end,
    priority = 1000,
  },

  {
    "Shatur/neovim-session-manager",
    cond = to_load,
    config = function()
      require("xxx.plugin-config.session.session-manager-rc").setup()
    end,
    event = "VimEnter",
  },
  {
    "goolord/alpha-nvim",
    cond = to_load,
    config = function()
      require("xxx.plugin-config.alpha-rc").setup()
    end,
    event = "VimEnter",
  },

  {
    -- bufferline color and show work: load order colorscheme->bufferline->alpha-nvim
    "akinsho/bufferline.nvim",
    cond = to_load,
    branch = "main",
    dependencies = { "nvim-web-devicons" },
    config = function()
      require("xxx.plugin-config.bufferline-rc").setup()
    end,
    event = "User FileOpened",
  },
  {
    "famiu/bufdelete.nvim", -- Easily close buffers whilst preserving your window layouts
    cond = to_load,
    cmd = { "Bdelete", "Bwipeout" },
  },
  {
    "nvim-lualine/lualine.nvim",
    cond = to_load,
    config = function()
      require("xxx.plugin-config.statusline.lualine-rc").setup()
    end,
    dependencies = { "nvim-web-devicons" },
    event = "VimEnter",
  },

  {
    -- NvimTree
    "kyazdani42/nvim-tree.lua",
    cond = to_load,
    config = function()
      require("xxx.plugin-config.nvim-tree-rc").setup()
    end,
    cmd = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeFocus", "NvimTreeFindFileToggle" },
    event = "User DirOpened",
  },

  {
    "phaazon/hop.nvim",
    branch = "v2", -- optional but strongly recommended
    config = function()
      require("xxx.plugin-config.hop-rc").setup()
    end,
    cmd = { "HopAnywhere", "HopChar1", "HopChar2", "HopWord", "HopLineStart", "HopLine", "HopVertical", "HopPattern" },
  },
  {
    "chentoast/marks.nvim",
    cond = to_load,
    config = function()
      require("xxx.plugin-config.marks-rc").setup()
    end,
    event = "BufEnter",
  },
  {
    -- Highlight hex and rgb colors within Neovim
    "NvChad/nvim-colorizer.lua",
    cond = to_load,
    config = function()
      require("colorizer").setup()
    end,
    event = "BufEnter",
  },

  {
    "petertriho/nvim-scrollbar", -- A scrollbar for the current window
    cond = to_load,
    config = function()
      require("xxx.plugin-config.scroll.nvim-scrollbar-rc").setup()
    end,
    event = "BufEnter",
    dependencies = { "nvim-hlslens", "cinnamon.nvim" },
  },
  {
    "declancm/cinnamon.nvim", -- Smooth scrolling
    cond = to_load,
    config = function()
      require("xxx.plugin-config.scroll.cinnamon-rc").setup()
    end,
    lazy = true,
  },
  {
    "kevinhwang91/nvim-hlslens", -- Highlight searches
    cond = to_load,
    config = function()
      require("xxx.plugin-config.scroll.nvim-hlslens-rc").setup()
    end,
    lazy = true,
  },

  --- lsp

  {
    "neovim/nvim-lspconfig",
    cond = to_load,
    dependencies = { "mason-lspconfig.nvim" },
    lazy = true,
  },
  {
    -- null-ls是一个将非LSP的包与nvim内置LSP客户端整合的插件
    "jose-elias-alvarez/null-ls.nvim",
    cond = to_load,
    lazy = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    cond = to_load,
    config = function()
      require("xxx.plugin-config.mason-lspconfig-rc").setup()
    end,
    cmd = { "LspInstall", "LspUninstall" },
    dependencies = "mason.nvim",
  },
  {
    "williamboman/mason.nvim",
    cond = to_load,
    config = function()
      require("xxx.plugin-config.mason-rc").setup()
    end,
    cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
  },

  -- Install nvim-cmp, and buffer source as a dependency

  {
    "hrsh7th/nvim-cmp",
    cond = to_load,
    config = function()
      require("xxx.plugin-config.nvim-cmp-rc").setup()
    end,
    cmd = { "CmpStatus" },
    dependencies = {
      -- cmp sources --
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lsp-signature-help" },
      { "hrsh7th/cmp-nvim-lua" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-cmdline" },
      { "saadparwaiz1/cmp_luasnip" },
    },
    event = { "InsertEnter", "CmdlineEnter" },
  },

  {
    -- Code snippets
    "L3MON4D3/LuaSnip",
    cond = to_load,
    config = function()
      require("xxx.plugin-config.luasnip-rc").setup()
    end,
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    event = "InsertEnter",
  },
  {
    -- vim functions for dev
    "folke/neodev.nvim",
    cond = to_load,
    lazy = true,
  },

  -- Autopairs
  {
    "windwp/nvim-autopairs",
    cond = to_load,
    config = function()
      require("xxx.plugin-config.nvim-autopairs-rc").setup()
    end,
    dependencies = { "nvim-treesitter/nvim-treesitter", "hrsh7th/nvim-cmp" },
    event = "InsertEnter",
  },

  -- Treesitter
  {
    -- highlight, linter, formater, indent framework
    "nvim-treesitter/nvim-treesitter",
    -- build = ":TSUpdate",
    cond = to_load,
    config = function()
      require("xxx.plugin-config.nvim-treesitter-rc").setup()
    end,
    cmd = {
      "TSInstall",
      "TSUninstall",
      "TSUpdate",
      "TSUpdateSync",
      "TSInstallInfo",
      "TSInstallSync",
      "TSInstallFromGrammar",
    },
    dependencies = { "nvim-treesitter-textobjects", "nvim-ts-rainbow" },
    event = "User FileOpened",
  },
  {
    -- 代码吸顶
    "nvim-treesitter/nvim-treesitter-context",
    cond = to_load,
    config = function()
      require("xxx.plugin-config.nvim-treesitter-context-rc").setup()
    end,
    event = "BufEnter",
  },
  {
    -- tsx 注释增强
    -- Lazy loaded by Comment.nvim pre_hook
    "JoosepAlviste/nvim-ts-context-commentstring",
    cond = to_load,
    lazy = true,
  },
  {
    -- 高亮显示相同的单词
    "RRethy/vim-illuminate",
    cond = to_load,
    config = function()
      require("xxx.plugin-config.vim-illuminate-rc").setup()
    end,
    event = "User FileOpened",
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    cond = to_load,
    config = function()
      require("xxx.plugin-config.indent-blankline-rc").setup()
    end,
    event = "User FileOpened",
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects", -- Syntax aware text-objects, select, move, swap, and peek support.
    cond = to_load,
    lazy = true,
  },
  {
    "p00f/nvim-ts-rainbow",
    cond = to_load,
    lazy = true,
  },

  {
    -- include breadcrumbs
    "glepnir/lspsaga.nvim",
    branch = "main",
    cond = to_load,
    config = function()
      require("xxx.plugin-config.lspsaga-rc").setup()
    end,
    event = "User FileOpened",
    cmd = "Lspsaga",
  },
  {
    -- Standalone UI for nvim-lsp progress.
    "j-hui/fidget.nvim",
    cond = to_load,
    config = function()
      require("xxx.plugin-config.fidget-rc").setup()
    end,
    event = "User FileOpened",
  },
  {
    "folke/trouble.nvim",
    cond = to_load,
    config = function()
      require("xxx.plugin-config.trouble-rc").setup()
    end,
    event = "User FileOpened",
  },
  {
    "stevearc/overseer.nvim", -- Task runner and job management
    -- INFO: Overseer lazy loads itself
    cond = to_load,
    config = function()
      require("xxx.plugin-config.overseer-rc").setup()
    end,
    event = "User FileOpened",
  },

  ---

  -- Telescope
  {
    -- 列表模糊搜索框架, 高扩展
    -- need install BurntSushi/ripgrep
    -- :Telescope find_files<cr>
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    cond = to_load,
    config = function()
      require("xxx.plugin-config.telescope-rc").setup()
    end,
    cmd = "Telescope",
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    cond = to_load,
    lazy = true,
  },
  { "tami5/sqlite.lua", lazy = true },
  {
    "nvim-telescope/telescope-frecency.nvim", -- Get frequently opened files
    cond = to_load,
    dependencies = "sqlite.lua",
    lazy = true,
  },
  {
    "nvim-telescope/telescope-smart-history.nvim", -- Show project dependant history
    cond = to_load,
    dependencies = "sqlite.lua",
    lazy = true,
  },
  {
    "ThePrimeagen/harpoon", -- Mark buffers for faster navigation
    cond = to_load,
    config = function()
      require("xxx.plugin-config.harpoon-rc").setup()
    end,
    lazy = true,
  },

  {
    "ahmedkhalf/project.nvim", -- Automatically set the cwd to the project root
    cond = to_load,
    config = function()
      require("xxx.plugin-config.project-rc").setup()
    end,
    event = "VimEnter",
    cmd = "Telescope projects",
  },

  --

  {
    -- vim.ui.select, vim.ui.input hooks
    "stevearc/dressing.nvim",
    cond = to_load,
    config = function()
      require("xxx.plugin-config.dressing-rc").setup()
    end,
    event = "VeryLazy",
  },

  -- Comments
  {
    "numToStr/Comment.nvim",
    cond = to_load,
    config = function()
      require("xxx.plugin-config.comment-rc").setup()
    end,
    keys = { { "gc", mode = { "n", "v" } }, { "gb", mode = { "n", "v" } } },
    event = "User FileOpened",
  },

  {
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup()
    end,
    event = { "BufEnter" },
  },

  {
    "lewis6991/gitsigns.nvim",
    cond = to_load,
    config = function()
      require("xxx.plugin-config.gitsigns-rc").setup()
    end,
    event = "User FileOpened",
    cmd = "Gitsigns",
  },

  {
    "akinsho/toggleterm.nvim",
    branch = "main",
    cond = to_load,
    config = function()
      require("xxx.plugin-config.toggleterm-rc").setup()
    end,
    cmd = {
      "ToggleTerm",
      "TermExec",
      "ToggleTermToggleAll",
      "ToggleTermSendCurrentLine",
      "ToggleTermSendVisualLines",
      "ToggleTermSendVisualSelection",
    },
  },

  {
    "folke/which-key.nvim",
    cond = to_load,
    config = function()
      require("xxx.plugin-config.which-key-rc").setup()
    end,
    cmd = "WhichKey",
    event = "VeryLazy",
  },

  --------------- languages --------------------
  {
    -- https://github.com/golang/tools/blob/master/gopls/doc/settings.md
    "ray-x/go.nvim",
    cond = to_load,
    dependencies = {
      "ray-x/guihua.lua", -- recommanded if need floating window support
    },
    config = function()
      require("xxx.plugin-config.lang.go-rc").setup()
    end,
    enabled = false,
    ft = { "go", "gomod", "gosum", "gotmpl", "gohtmltmpl", "gotexttmpl" },
  },

  {
    "simrat39/rust-tools.nvim",
    cond = to_load,
    config = function()
      require("xxx.plugin-config.lang.rs-rust-tools-rc").setup()
    end,
    enabled = true,
    ft = { "rust" },
  },

  {
    -- rust crates manager
    "saecki/crates.nvim",
    cond = to_load,
    version = "0.3.0",
    config = function()
      require("xxx.plugin-config.lang.rs-crates-rc").setup()
    end,
    enabled = true,
    event = { "BufRead Cargo.toml" },
  },
}
return plugins
