local M = {}

local icons = require('xxx.core.icons')
local Log = require('xxx.core.log')

function M.opts()
  local actions = require('telescope.actions')
  local previewers = require('telescope.previewers')
  local sorters = require('telescope.sorters')

  return {
    defaults = {
      -- prompt_prefix = " ",
      prompt_prefix = ' ' .. icons.ui.Search .. ' ',
      -- selection_caret = " ",
      selection_caret = icons.ui.ArrowRight .. ' ',
      entry_prefix = '  ',
      initial_mode = 'insert',
      selection_strategy = 'reset',
      -- sorting_strategy = 'ascending',
      sorting_strategy = 'descending',
      layout_strategy = 'horizontal',
      layout_config = {
        width = 0.7,
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
        'rg',
        '--color=never',
        '--no-heading',
        '--with-filename',
        '--line-number',
        '--column',
        '--smart-case',
        '--trim',
        '--hidden',
        '--glob=!.git/',
      },
      ---@usage Mappings are fully customizable. Many familiar mapping patterns are setup as defaults.
      mappings = {
        i = {
          ['<C-n>'] = actions.move_selection_next,
          ['<C-p>'] = actions.move_selection_previous,
          ['<C-c>'] = actions.close,
          ['<C-j>'] = actions.cycle_history_next,
          ['<C-k>'] = actions.cycle_history_prev,
          ['<C-q>'] = function(...)
            actions.smart_send_to_qflist(...)
            actions.open_qflist(...)
          end,
          ['<CR>'] = actions.select_default,
        },
        n = {
          ['<C-n>'] = actions.move_selection_next,
          ['<C-p>'] = actions.move_selection_previous,
          ['<C-q>'] = function(...)
            actions.smart_send_to_qflist(...)
            actions.open_qflist(...)
          end,
        },
      },
      file_ignore_patterns = {},
      path_display = { 'smart' },
      winblend = Xvim.winblend, -- 透明模式下设为0
      border = {},
      borderchars = nil,
      color_devicons = true,
      set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
      file_previewer = previewers.vim_buffer_cat.new,
      grep_previewer = previewers.vim_buffer_vimgrep.new,
      qflist_previewer = previewers.vim_buffer_qflist.new,
      file_sorter = sorters.get_fuzzy_file,
      generic_sorter = sorters.get_generic_fuzzy_sorter,
      -- nvim-telescope/telescope-smart-history.nvim (No UI), use in dialog input history
      history = {
        path = join_paths(vim.fn.stdpath('data'), 'telescope_history.sqlite3'),
        limit = 133,
      },
    },
    pickers = {
      find_files = {
        theme = 'dropdown',
        hidden = true,
        previewer = false,
        find_command = {
          'fd',
          '--type',
          'file',
          '--hidden',
          '--strip-cwd-prefix',
          '--exclude',
          '.git',
        },
        sorter = sorters.get_fuzzy_file(),
      },
      live_grep = {
        --@usage don't include the filename in the search results
        only_sort_text = true,
      },
      grep_string = {
        only_sort_text = true,
      },
      buffers = {
        theme = 'dropdown',
        previewer = false,
        initial_mode = 'normal',
        mappings = {
          i = {
            ['<C-d>'] = actions.delete_buffer,
          },
          n = {
            ['dd'] = actions.delete_buffer,
          },
        },
      },
      git_files = {
        theme = 'dropdown',
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
    extensions = {
      fzf = {
        fuzzy = true, -- false will only do exact matching
        -- this whill change defaults.generic_sorter
        override_generic_sorter = true, -- override the generic sorter
        -- this whill change defaults.file_sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
      },
      frecency = {
        -- default: $XDG_DATA_HOME/nvim/file_frecency.sqlite3
        db_root = vim.fn.stdpath('data'),
        show_scores = true,
        show_unindexed = true,
        ignore_patterns = {
          '*.git/*',
          '*/tmp/*',
          '*/node_modules/*',
          '*/vendor/*',
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
    require('telescope').load_extension(name)
  end)

  if not ok then
    Log:error("telescope load extension '" .. name .. "' failed.", { title = 'Telescope' })
  end
end

function M.setup()
  local telescope = require('telescope')
  local opts = M.opts()
  telescope.setup(opts)

  load_extension('fzf')
  load_extension('frecency')
  load_extension('smart_history')
  load_extension('harpoon')
  load_extension('projects')
end

return M