local plugins = {

  {
    -- Speeds up load times
    "lewis6991/impatient.nvim",
  },

  { 'wbthomason/packer.nvim' },
  -- Log --
  -- {
  --   "rcarriga/nvim-notify",
  --   config = function()
  --     require("xxx.plugin-config.nvim-notify-rc").setup()
  --   end,
  -- },
  {
    -- nvim/ftdetect will not work
    "nathom/filetype.nvim", -- Replace default filetype.vim which is slower
    config = function()
      require("xxx.plugin-config.filetype-rc").setup()
    end
  },
  {
    "tpope/vim-sleuth", -- Automatically detects which indents should be used in the current buffer
  },

  {
    -- theme
    -- {
    --     'svrana/neosolarized.nvim',
    --     as = "colorscheme",
    --     requires = {
    --         'tjdevries/colorbuddy.nvim',
    --     }
    -- },
    {
      "olimorris/onedarkpro.nvim",
      as = "colorscheme",
      config = function()
        require('xxx.plugin-config.colorscheme.onedarkpro-rc').setup()
      end,
    },
    {
      'navarasu/onedark.nvim',
      disable = true,
      -- as = "colorscheme",
      -- config = function()
      --     require('xxx.plugin-config.colorscheme.onedark-rc').setup()
      -- end,
    },
    {
      -- SchemaStore
      "b0o/schemastore.nvim",
    },
  },

  {
    "folke/which-key.nvim",
    config = function()
      require("xxx.plugin-config.which-key-rc").setup()
    end,
    event = "BufWinEnter",
  },
  {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config = function()
      require("xxx.plugin-config.hop-rc").setup()
    end
  },
  {
    'chentoast/marks.nvim',
    config = function()
      require("xxx.plugin-config.marks-rc").setup()
    end
  },
  {
    -- Highlight hex and rgb colors within Neovim
    'NvChad/nvim-colorizer.lua',
    config = function()
      require('xxx.plugin-config.nvim-colorizer-rc').setup()
    end,
  },

  {
    "petertriho/nvim-scrollbar", -- A scrollbar for the current window
    -- disable = true,
    -- after = "colorscheme",
    config = function()
      require("xxx.plugin-config.scroll.nvim-scrollbar-rc").setup()
    end,
    requires = {
      {
        "kevinhwang91/nvim-hlslens", -- Highlight searches
        config = function()
          require("xxx.plugin-config.scroll.nvim-hlslens-rc").setup()
        end,
      },
      {
        "declancm/cinnamon.nvim", -- Smooth scrolling
        config = function()
          require("xxx.plugin-config.scroll.cinnamon-rc").setup()
        end,
      },
    },
  },


  {
    "kylechui/nvim-surround",
    config = function()
      require("xxx.plugin-config.nvim-surround-rc").setup()
    end,
  },

  -- { "nvim-lua/popup.nvim", opt = true },
  { "nvim-lua/plenary.nvim", module = "plenary" },
  {
    -- 列表模糊搜索框架, 高扩展
    -- need install BurntSushi/ripgrep
    -- :Telescope find_files<cr>
    "nvim-telescope/telescope.nvim",
    after = "colorscheme",
    branch = "0.1.x",
    config = function()
      require("xxx.plugin-config.telescope-rc").setup()
    end,
    requires = {
      'nvim-lua/plenary.nvim',
      -- {
      --     "nvim-telescope/telescope-project.nvim", -- Switch between projects
      --     after = "telescope.nvim",
      --     config = function()
      --         require("telescope").load_extension("project")
      --     end,
      -- },
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        disable = true,
        after = "telescope.nvim",
        requires = { "nvim-telescope/telescope.nvim" },
        config = function()
          require("telescope").load_extension("fzf")
        end,
        run = "make",
      },
      {
        "nvim-telescope/telescope-frecency.nvim", -- Get frequently opened files
        after = "telescope.nvim",
        requires = {
          { "tami5/sqlite.lua" },
        },
        config = function()
          require("telescope").load_extension("frecency")
        end,
      },
      {
        "nvim-telescope/telescope-smart-history.nvim", -- Show project dependant history
        after = "telescope.nvim",
        requires = {
          { "tami5/sqlite.lua" },
        },
        config = function()
          require("telescope").load_extension("smart_history")
        end,
      },
      {
        "ThePrimeagen/harpoon", -- Mark buffers for faster navigation
        disable = true,
        after = "telescope.nvim",
        config = function()
          require("xxx.plugin-config.harpoon-rc").setup()
          require("telescope").load_extension("harpoon")
        end,
      },
    },
  },
  -- { 'nvim-telescope/telescope-ui-select.nvim' },
  {
    -- vim.ui.select, vim.ui.input hooks
    'stevearc/dressing.nvim',
    after = "telescope.nvim",
    config = function()
      require("xxx.plugin-config.dressing-rc").setup()
    end,
  },

  {
    'kyazdani42/nvim-web-devicons',
    config = function()
      require("xxx.plugin-config.web-devicons-rc").setup()
    end,
  },
  {
    -- bufferline color and show work: load order colorscheme->bufferline->alpha-nvim
    'akinsho/bufferline.nvim',
    -- tag = "v2.*",
    branch = "main",
    after = "colorscheme",
    -- event = "BufWinEnter",
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require('xxx.plugin-config.bufferline-rc').setup()
    end,
  },

  {
    "famiu/bufdelete.nvim", -- Easily close buffers whilst preserving your window layouts
    cmd = { "Bdelete", "Bwipeout" },
  },

  {
    'nvim-lualine/lualine.nvim',
    after = "colorscheme",
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require("xxx.plugin-config.statusline.lualine-rc").setup()
    end,
  },
  {
    "feline-nvim/feline.nvim", -- Statusline
    -- disable = true,
    after = "colorscheme",
    requires = {
      { "kyazdani42/nvim-web-devicons" }, -- Web icons for various plugins
    },
    -- config = function()
    --   require("xxx.plugin-config.statusline.feline-rc").setup()
    -- end,
  },

  {
    -- NvimTree
    "kyazdani42/nvim-tree.lua",
    -- event = "BufWinOpen",
    -- cmd = "NvimTreeToggle",
    after = "colorscheme",
    requires = {
      'nvim-telescope/telescope.nvim',
      { 'kyazdani42/nvim-web-devicons', opt = true, }
    },
    config = function()
      require("xxx.plugin-config.nvim-tree-rc").setup()
    end,
  },

  -- alpha
  {

    "goolord/alpha-nvim",
    after = "bufferline.nvim",
    config = function()
      require("xxx.plugin-config.alpha-rc").setup()
    end,
  },
  {
    "Shatur/neovim-session-manager",
    requires = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("xxx.plugin-config.session.session-manager-rc").setup()
    end,
  },
  -- {
  -- session-manager has bugs in windows
  -- "olimorris/persisted.nvim",
  -- config = function()
  --     require("xxx.plugin-config.session.persisted-rc").setup()
  -- end,
  -- },
  {
    "ahmedkhalf/project.nvim", -- Automatically set the cwd to the project root
    after = "telescope.nvim",
    config = function()
      require("xxx.plugin-config.project-rc").setup()
    end,
  },


  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("xxx.plugin-config.gitsigns-rc").setup()
    end,
    event = "BufRead",
  },

  {
    -- install and manager LSP, DAP, linters, formatters
    {
      "williamboman/mason.nvim",
      config = function()
        require("xxx.plugin-config.mason-rc").setup()
      end,
    },
    {
      "williamboman/mason-lspconfig.nvim",
      requires = {
        { "neovim/nvim-lspconfig" },

      },
    },
    {
      -- null-ls是一个将非LSP的包与nvim内置LSP客户端整合的插件
      "jose-elias-alvarez/null-ls.nvim",
    },
    -- {
    --     -- A plugin to configure Neovim LSP using json/yaml
    --     "tamago324/nlsp-settings.nvim",
    --     -- disable = true,
    -- },
    {
      -- Standalone UI for nvim-lsp progress.
      "j-hui/fidget.nvim",
      config = function()
        require("xxx.plugin-config.fidget-rc").setup()
      end,
    },
    -- {
    --   -- parent is from coc.nvim
    --   'folke/lsp-colors.nvim',
    --   config = function()
    --     require("xxx.plugin-config.lsp-colors-rc").setup()
    --   end,
    -- },
    {
      -- breadcrumbs
      -- 不提供显示功能, 需要其他插件显示
      'SmiteshP/nvim-navic',
      requires = { "neovim/nvim-lspconfig" },
      config = function()
        require("xxx.plugin-config.nvim-navic-rc").setup()
      end,
      disable = true,
    },
    {
      "folke/trouble.nvim",
      requires = { "kyazdani42/nvim-web-devicons", opt = true },
      config = function()
        require("xxx.plugin-config.trouble-rc").setup()
      end,
    },
    {
      -- include breadcrumbs
      "glepnir/lspsaga.nvim",
      after = "colorscheme",
      branch = "main",
      config = function()
        require("xxx.plugin-config.lspsaga-rc").setup()
      end,
    },
  },

  {
    -- Install nvim-cmp, and buffer source as a dependency
    {
      "hrsh7th/nvim-cmp",
      config = function()
        require("xxx.plugin-config.nvim-cmp-rc").setup()
      end,
      requires = {
        {
          -- Code snippets
          "L3MON4D3/LuaSnip",
          requires = {
            "rafamadriz/friendly-snippets",
          },
          config = function()
            require("xxx.plugin-config.friendly-snippets-rc").setup()
          end,
        },
        -- cmp sources --
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-nvim-lsp-signature-help" },
        { "hrsh7th/cmp-nvim-lua" },
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-path" },
        { "hrsh7th/cmp-cmdline" },
        { "saadparwaiz1/cmp_luasnip" },

      },
    },
    {
      -- vim functions for dev
      "folke/neodev.nvim",
      module = "neodev",
    },
  },

  -- Comments
  {
    "numToStr/Comment.nvim",
    event = "BufRead",
    config = function()
      require("xxx.plugin-config.comment-rc").setup()
    end,
  },

  -- Treesitter
  {
    -- highlight, linter, formater, indent framework
    "nvim-treesitter/nvim-treesitter",
    after = "colorscheme",
    -- commit = "58f61e563fadd1788052586f4d6869a99022df3c",
    -- commit = "e7bdcee167ae41295a3e99ad460ae80d2bb961d7", -- lua highlighter error start
    commit = "5f85a0a2b5c8e385c1232333e50c55ebdd0e0791", -- can work
    run = ":TSUpdate",
    config = function()
      require("xxx.plugin-config.nvim-treesitter-rc").setup()
    end,
    requires = {
      {
        "nvim-treesitter/nvim-treesitter-textobjects", -- Syntax aware text-objects, select, move, swap, and peek support.
      },
      {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
          require("xxx.plugin-config.nvim-autopairs-rc").setup()
        end,
      },
      {
        "p00f/nvim-ts-rainbow",
      },
      {
        "lukas-reineke/indent-blankline.nvim",
        after = "colorscheme",
        config = function()
          require("xxx.plugin-config.indent-blankline-rc").setup()
        end,
      },
      {
        -- 高亮显示相同的单词
        "RRethy/vim-illuminate",
        config = function()
          require("xxx.plugin-config.vim-illuminate-rc").setup()
        end,
      },
      {
        -- tsx 注释增强
        "JoosepAlviste/nvim-ts-context-commentstring",
        event = "BufReadPost",
      },
    },
  },
  {
    -- 代码吸顶
    "nvim-treesitter/nvim-treesitter-context",
    after = "nvim-treesitter",
    config = function()
      require('xxx.plugin-config.nvim-treesitter-context-rc').setup()
    end,
  },

  {
    "akinsho/toggleterm.nvim",
    event = "BufWinEnter",
    branch = "main",
    config = function()
      require("xxx.plugin-config.toggleterm-rc").setup()
    end,
  },

  {
    "stevearc/overseer.nvim", -- Task runner and job management
    -- INFO: Overseer lazy loads itself
    config = function()
      require("xxx.plugin-config.overseer-rc").setup()
    end,
  },

  --------------- languages --------------------
  {
    -- https://github.com/golang/tools/blob/master/gopls/doc/settings.md
    'ray-x/go.nvim',
    -- disable = true,
    ft = { 'go', 'gomod', 'gosum', 'gotmpl', 'gohtmltmpl', 'gotexttmpl' },
    requires = {
      'ray-x/guihua.lua', -- recommanded if need floating window support
    },
    config = function()
      require("xxx.plugin-config.go-rc").setup()
    end
  },

  {
    'simrat39/rust-tools.nvim',
    ft = { "rust" },
    requires = {
      "neovim/nvim-lspconfig",
      -- Debugging
      "nvim-lua/plenary.nvim",
      -- "mfussenegger/nvim-dap",
    },
    config = function()
      require("xxx.plugin-config.rs-rust-tools-rc").setup()
    end
  },

  {
    -- rust crates manager
    'saecki/crates.nvim',
    tag = 'v0.3.0',
    event = { "BufRead Cargo.toml" },
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('xxx.plugin-config.rs-crates-rc').setup()
    end,
  },
}
return plugins
