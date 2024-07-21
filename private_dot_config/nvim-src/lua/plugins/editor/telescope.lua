local icons = require("xxx.core.icons")
local actions = require("telescope.actions")
local M = {}
M.opts = {
  defaults = {
    prompt_prefix = " " .. icons.misc.Shell .. " ",
    selection_caret = icons.ui.TriangleShortArrowRight .. " ",
    winblend = 7,
    -- 下面两个sorter会被extensions中的fzf替换掉
    -- file_sorter = sorters.get_fuzzy_file,
    -- generic_sorter = sorters.get_generic_fuzzy_sorter,
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

return {
  "nvim-telescope/telescope.nvim",
  -- change some options
  opts = M.opts,
  keys = {
    { "<leader>,", false },
  },
}
