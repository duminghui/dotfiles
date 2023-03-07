local Log = require "xxx.core.log"
local icons = require "xxx.core.icons"
local M = {}

local function telescope_find_files(_)
  require("xxx.plugin-config.nvim-tree-rc").start_telescope "find_files"
end

local function telescope_live_grep(_)
  require("xxx.plugin-config.nvim-tree-rc").start_telescope "live_grep"
end

M.opts = {
  sort_by = function(nodes)
    table.sort(nodes, function(a, b)
      return a.name < b.name
    end)
  end,
  -- https://github.com/nvim-tree/nvim-tree.lua/wiki/Open-At-Startup
  -- ignore_ft_on_setup = {
  --   "startify",
  --   "dashboard",
  --   "alpha",
  --  },
  auto_reload_on_write = true,
  hijack_directories = {
    enable = false,
  },
  update_cwd = true,
  diagnostics = {
    enable = false,
    show_on_dirs = false,
    icons = {
      hint = icons.diagnostics.BoldHint,
      info = icons.diagnostics.BoldInformation,
      warning = icons.diagnostics.BoldWarning,
      error = icons.diagnostics.BoldError,
    },
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {},
  },
  system_open = {
    cmd = nil,
    args = {},
  },
  git = {
    enable = true,
    ignore = false,
    show_on_dirs = true,
    show_on_open_dirs = true,
    timeout = 200,
  },
  modified = {
    enable = false,
    show_on_dirs = true,
    show_on_open_dirs = true,
  },
  view = {
    width = 33,
    hide_root_folder = false,
    side = "left",
    mappings = {
      custom_only = false,
      list = {
        { key = { "l", "<CR>", "o" }, action = "edit", mode = "n" },
        { key = "h", action = "close_node" },
        { key = "v", action = "vsplit" },
        { key = "C", action = "cd" },
        { key = "gtf", action = "telescope_find_files", action_cb = telescope_find_files },
        { key = "gtg", action = "telescope_live_grep", action_cb = telescope_live_grep },
      },
    },
    number = false,
    relativenumber = false,
    signcolumn = "yes",
  },
  renderer = {
    indent_markers = {
      enable = true,
      icons = {
        -- corner = "└",
        corner = "│",
        edge = "│",
        item = "│",
        none = " ",
      },
    },
    icons = {
      webdev_colors = true,
      git_placement = "before",
      modified_placement = "after",
      show = {
        git = true,
        folder = true,
        file = true,
        folder_arrow = true,
      },
      glyphs = {
        default = icons.ui.Text,
        symlink = icons.ui.FileSymlink,
        git = {
          unstaged = icons.git.FileUnstaged,
          staged = icons.git.FileStaged,
          unmerged = icons.git.FileUnmerged,
          renamed = icons.git.FileRenamed,
          deleted = icons.git.FileDeleted,
          untracked = icons.git.FileUntracked,
          -- ignored = icons.git.FileIgnored,
          ignored = "",
        },
        folder = {
          default = icons.ui.Folder,
          open = icons.ui.FolderOpen2,
          empty = icons.ui.EmptyFolder,
          empty_open = icons.ui.EmptyFolderOpen,
          symlink = icons.ui.FolderSymlink,
        },
      },
    },
    add_trailing = false,
    group_empty = false,
    highlight_git = true,
    highlight_opened_files = "none",
    highlight_modified = "none",
    root_folder_label = ":t",
  },
  filters = {
    dotfiles = false,
    custom = { "node_modules", "\\.cache" },
    exclude = {},
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
  log = {
    enable = false,
    truncate = false,
    types = {
      all = false,
      config = false,
      copy_paste = false,
      diagnostics = false,
      git = false,
      profile = false,
    },
  },
  actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = false,
      restrict_above_cwd = false,
    },
    open_file = {
      quit_on_open = false,
      resize_window = false,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
  },
}

M.nvimtree_setup_called = false

function M.setup()
  if M.nvimtree_setup_called then
    Log:debug "[XXX] ignoring repeated setup call for nvim-tree, see kyazdani42/nvim-tree.lua#1308"
    return
  end

  M.nvimtree_setup_called = true

  local nvim_tree = require "nvim-tree"

  local _ = require "nvim-tree.notify"

  -- for 'project' module
  M.opts.sync_root_with_cwd = true
  M.opts.respect_buf_cwd = true
  M.opts.update_cwd = true
  M.opts.update_focused_file = {
    enable = true,
    update_cwd = true,
    update_root = true,
  }

  nvim_tree.setup(M.opts)
end

function M.start_telescope(telescope_mode)
  local node = require("nvim-tree.lib").get_node_at_cursor()
  local abspath = node.link_to or node.absolute_path
  local is_folder = node.open ~= nil
  local basedir = is_folder and abspath or vim.fn.fnamemodify(abspath, ":h")
  require("telescope.builtin")[telescope_mode] {
    cwd = basedir,
    theme = "cursor",
  }
end

return M
