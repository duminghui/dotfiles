local Log = require("xxx.core.log")
local icons = require("xxx.core.icons")
local M = {}

local function telescope_find_files(_)
  require("xxx.plugin-config.nvimtree-rc").start_telescope "find_files"
end

local function telescope_live_grep(_)
  require("xxx.plugin-config.nvimtree-rc").start_telescope "live_grep"
end

M.opts = {
  sort_by = function(nodes)
    table.sort(nodes, function(a, b)
      return a.name < b.name
    end)
  end,
  ignore_ft_on_setup = {
    "startify",
    "dashboard",
    "alpha",
  },
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
    timeout = 200,
  },
  view = {
    width = 30,
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
      enable = false,
      icons = {
        corner = "└",
        edge = "│",
        item = "│",
        none = " ",
      },
    },
    icons = {
      webdev_colors = true,
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
          ignored = icons.git.FileIgnored,
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
    highlight_git = true,
    group_empty = false,
    root_folder_modifier = ":t",
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
  local status_ok, nvim_tree = safe_require("nvim-tree")
  if not status_ok then
    return
  end

  local nt_notify = require("nvim-tree.notify")


  local function notify_level(log_level)
    local msg_hl = ""
    if log_level == vim.log.levels.DEBUG then
      msg_hl = "MoreMsg"
    elseif log_level == vim.log.levels.INFO then
      msg_hl = "ModeMsg"
    elseif log_level == vim.log.levels.WARN then
      msg_hl = "WarningMsg"
    elseif log_level == vim.log.levels.ERROR then
      msg_hl = "ErrorMsg"
    end
    return function(msg)
      vim.schedule(function()
        vim.api.nvim_echo({ { msg, msg_hl } }, false, {})
      end)
    end
  end

  nt_notify.warn = notify_level(vim.log.levels.WARN)
  nt_notify.error = notify_level(vim.log.levels.ERROR)
  nt_notify.info = notify_level(vim.log.levels.INFO)
  nt_notify.debug = notify_level(vim.log.levels.DEBUG)

  if M.nvimtree_setup_called then
    Log:debug "ignoring repeated setup call for nvim-tree, see kyazdani42/nvim-tree.lua#1308"
    return
  end

  M.nvimtree_setup_called = true

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
    theme = "cursor"
  }
end

return M
