-- local Log = require("xxx.core.log")
local M = {}

local icons = require "xxx.core.icons"
local Log = require "xxx.core.log"

local function get_pickers(actions)
  return {
    find_files = {
      theme = "dropdown",
      hidden = true,
      previewer = false,
    },
    live_grep = {
      --@usage don't include the filename in the search results
      only_sort_text = true,
      -- theme = "dropdown",
    },
    grep_string = {
      only_sort_text = true,
      -- theme = "dropdown",
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
    planets = {
      show_pluto = true,
      show_moon = true,
    },
    git_files = {
      theme = "dropdown",
      hidden = true,
      previewer = false,
      show_untracked = true,
    },
    lsp_references = {
      -- theme = "dropdown",
      initial_mode = "normal",
    },
    lsp_definitions = {
      -- theme = "dropdown",
      initial_mode = "normal",
    },
    lsp_declarations = {
      -- theme = "dropdown",
      initial_mode = "normal",
    },
    lsp_implementations = {
      -- theme = "dropdown",
      initial_mode = "normal",
    },
  }
end

-- Define this minimal config so that it's available if telescope is not yet available.
function M.opts()
  local actions = require "telescope.actions"
  local previewers = require "telescope.previewers"
  local sorters = require "telescope.sorters"
  return {
    defaults = {
      -- prompt_prefix = " ",
      prompt_prefix = icons.ui.Search .. " ",
      -- selection_caret = " ",
      selection_caret = icons.ui.ArrowRight .. " ",
      entry_prefix = "  ",
      initial_mode = "insert",
      selection_strategy = "reset",
      sorting_strategy = "descending",
      layout_strategy = "horizontal",
      layout_config = {
        width = 0.75,
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
        vertical = { mirror = false },
      },
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--hidden",
        "--glob=!.git/",
      },
      mappings = {
        i = {
          -- ["<C-n>"] = actions.move_selection_next,
          -- ["<C-p>"] = actions.move_selection_previous,
          -- ["<C-c>"] = actions.close,
          ["<C-j>"] = actions.cycle_history_next,
          ["<C-k>"] = actions.cycle_history_prev,
          -- ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
          -- ["<CR>"] = actions.select_default,
        },
        n = {
          -- ["<C-n>"] = actions.move_selection_next,
          -- ["<C-p>"] = actions.move_selection_previous,
          -- ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        },
      },
      pickers = get_pickers(actions),
      file_previewer = previewers.vim_buffer_cat.new,
      grep_previewer = previewers.vim_buffer_vimgrep.new,
      qflist_previewer = previewers.vim_buffer_qflist.new,
      file_sorter = sorters.get_fuzzy_file,
      generic_sorter = sorters.get_generic_fuzzy_sorter,
      file_ignore_patterns = {
        ".git/",
        "%.csv",
        "%.jpg",
        "%.jpeg",
        "%.png",
        "%.svg",
        "%.otf",
        "%.ttf",
        "%.lock",
        "__pycache__",
        "%.sqlite3",
        "%.ipynb",
        "vendor",
        "node_modules",
        "dotbot",
      },
      path_display = { "smart" },
      winblend = 9,
      border = {},
      borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
      color_devicons = true,
      set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
      -- nvim-telescope/telescope-smart-history.nvim (No UI), use in dialog input history
      history = {
        path = join_paths(vim.fn.stdpath "data", "telescope_history.sqlite3"),
        limit = 133,
      },
    },
    pickers = get_pickers(actions),
    extensions = {
      fzf = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      },
      ["ui-select"] = {
        -- no use
        require("telescope.themes").get_dropdown {
          -- even more opts
        },

        -- pseudo code / specification for writing custom displays, like the one
        -- for "codeactions"
        -- specific_opts = {
        --   [kind] = {
        --     make_indexed = function(items) -> indexed_items, width,
        --     make_displayer = function(widths) -> displayer
        --     make_display = function(displayer) -> function(e)
        --     make_ordinal = function(e) -> string
        --   },
        --   -- for example to disable the custom builtin "codeactions" display
        --      do the following
        --   codeactions = false,
        -- }
      },
      frecency = {
        -- default: nvim-data/file_frecency.sqlite3
        db_root = vim.fn.stdpath "data",
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
  }
end

local function load_extension(name)
  local ok = pcall(function()
    require("telescope").load_extension(name)
  end)

  if not ok then
    Log:error("telescope load extension '" .. name .. "' failed.", { title = "Telescope" })
  end
end

function M.setup()
  local telescope = require "telescope"

  -- vim.cmd [[autocmd User TelescopePreviewerLoaded setlocal wrap]]

  vim.api.nvim_create_autocmd("User", {
    pattern = "TelescopePreviewerLoaded",
    command = "setlocal wrap",
  })

  telescope.setup(M.opts())

  load_extension "fzf"
  load_extension "frecency"
  load_extension "smart_history"
  load_extension "harpoon"
  load_extension "projects"
end

return M
