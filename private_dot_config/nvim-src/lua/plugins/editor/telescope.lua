local icons = xxx.icons
local actions = require("telescope.actions")
local M = {}
M.opts = {
  defaults = {
    layout_config = {
      -- width = 0.8,
      preview_cutoff = 120,
      horizontal = {
        preview_width = function(_, cols, _)
          if cols < 120 then
            return math.floor(cols * 0.5)
          end
          return math.floor(cols * 0.6)
        end,
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    prompt_prefix = " " .. icons.misc.Shell .. " ",
    selection_caret = icons.ui.MenuRight .. " ",
    winblend = 7,
    wrap_results = true,
    -- 下面两个sorter会被extensions中的fzf替换掉
    -- file_sorter = sorters.get_fuzzy_file,
    -- generic_sorter = sorters.get_generic_fuzzy_sorter,
    mappings = {
      i = {
        ["<C-j>"] = actions.cycle_history_next,
        ["<C-k>"] = actions.cycle_history_prev,
      },
      n = {
        ["<C-j>"] = actions.cycle_history_next,
        ["<C-k>"] = actions.cycle_history_prev,
        ["<C-f>"] = actions.preview_scrolling_down,
        ["<C-b>"] = actions.preview_scrolling_up,
      },
    },
  },
  pickers = {
    find_files = {
      theme = "dropdown",
      hidden = true,
      previewer = false,
      -- find_command = {
      --   "fd",
      --   "--color=never",
      --   "--type=file",
      --   "--exclude=.git",
      --   "--hidden",
      --   "--strip-cwd-prefix",
      -- },
      layout_config = {},
      -- sorter = sorters.get_fuzzy_file(), -- 会把extensions中fzf的file_sorter替换掉
    },
    live_grep = {
      --@usage don't include the filename in the search results
      only_sort_text = true,
    },
    grep_string = {
      only_sort_text = true,
    },
    buffers = {
      theme = "dropdown",
      previewer = false,
      initial_mode = "normal",
      mappings = {
        i = {
          ["<C-d>"] = actions.delete_buffer,
        },
        n = {
          ["dd"] = actions.delete_buffer,
        },
      },
    },
    git_files = {
      theme = "dropdown",
      previewer = false,
      hidden = true,
      show_untracked = true,
    },
    planets = {
      show_pluto = true,
      show_moon = true,
    },
    colorscheme = {
      enable_preview = true,
    },
  },
}

---@type LazySpec
return {
  {
    "nvim-telescope/telescope.nvim",
    -- change some options
    opts = M.opts,
    keys = {
      { "<leader>,", false },
    },
  },
  {
    {
      "nvim-telescope/telescope.nvim",
      dependencies = { "nvim-telescope/telescope-smart-history.nvim" },
      opts = {
        defaults = {
          history = {
            path = join_paths(vim.fn.stdpath("state"), "telescope_history.sqlite3"),
            limit = 166,
          },
        },
      },
    },
    {
      -- nvim-telescope/telescope-smart-history.nvim (No UI), use in dialog input history
      "nvim-telescope/telescope-smart-history.nvim", -- Show project dependant history
      dependencies = { "tami5/sqlite.lua" },
      lazy = true,
      config = function(_, _)
        local ok, err = pcall(require("telescope").load_extension, "smart_history")
        if not ok then
          LazyVim.error("Failed to load `telescope-smart-history.nvim`:\n" .. err)
        end
      end,
    },
  },
  {
    {
      "nvim-telescope/telescope.nvim",
      dependencies = { "nvim-telescope/telescope-frecency.nvim" },
      opts = {
        extensions = {
          frecency = {
            -- default: $XDG_STATE_HOME/nvim/file_frecency.bin
            db_root = vim.fn.stdpath("state"),
            show_scores = true,
            show_unindexed = true,
            ignore_patterns = {
              "*.git/*",
              "*/tmp/*",
              "*/node_modules/*",
              "*/vendor/*",
            },
            workspaces = {
              -- ["nvim"] = os.getenv("HOME_DIR") .. ".config/nvim",
              -- ["dots"] = os.getenv("HOME_DIR") .. ".dotfiles",
              -- ["project"] = os.getenv("PROJECT_DIR"),
              -- ["project2"] = os.getenv("OTHER_PROJECT_DIR"),
            },
          },
        },
      },
    },
    {
      "nvim-telescope/telescope-frecency.nvim", -- Get frequently opened files
      lazy = true,
      config = function(_, _)
        local ok, err = pcall(require("telescope").load_extension, "frecency")
        if not ok then
          LazyVim.error("Failed to load `telescope-frecency.nvim`:\n" .. err)
        end
      end,
    },
  },
}
