local icons = require("xxx.core.icons")

local M = {}

-- https://github.com/nvim-neo-tree/neo-tree.nvim/blob/main/lua/neo-tree/defaults.lua
M.opts = {
  sources = {
    "filesystem",
    "buffers",
    "git_status",
  },
  sort_case_insensitive = true, -- used when sorting files and directories in the tree
  sort_function = function(a, b)
    local a_path = string.lower(a.path)
    local b_path = string.lower(b.path)
    return a_path < b_path
  end,
  source_selector = {
    winbar = true,
    sources = {
      { source = "filesystem", display_name = " " .. icons.ui.Files .. " Files " },
      { source = "buffers", display_name = " " .. icons.ui.TextMultiple .. " Buffers " },
      { source = "git_status", display_name = " 󰊢 Git " },
      { source = "diagnostics", display_name = " 󰒡 Diagnostics " },
    },
    content_layout = "center", -- only with `tabs_layout` = "equal", "focus"
    --                start  : |/ 󰓩 bufname     \/...
    --                end    : |/     󰓩 bufname \/...
    --                center : |/   󰓩 bufname   \/...
    separator = { left = " ", right = " " },
    -- separator = { left = "/", right = "\\", override = nil },     -- |/  a  \/  b  \/  c  \...
    -- separator = { left = "/", right = "\\", override = "right" }, -- |/  a  \  b  \  c  \...
    -- separator = { left = "/", right = "\\", override = "left" },  -- |/  a  /  b  /  c  /...
    -- separator = { left = "/", right = "\\", override = "active" },-- |/  a  / b:active \  c  \...
    -- separator = "|",                                              -- ||  a  |  b  |  c  |...
    -- separator_active = nil, -- set separators around the active tab. nil falls back to `source_selector.separator`
    show_separator_on_edge = true,
    --                       true  : |/    a    \/    b    \/    c    \|
    --                       false : |     a    \/    b    \/    c     |
    highlight_tab = "NeoTreeTabInactive",
    highlight_tab_active = "NeoTreeTabActive",
    -- highlight_background = "NeoTreeTabInactive",
    highlight_background = "BufferLineFill",
    highlight_separator = "NeoTreeTabSeparatorInactive",
    highlight_separator_active = "NeoTreeTabSeparatorActive",
  },
  event_handlers = {
    {
      event = "neo_tree_buffer_enter",
      handler = function()
        vim.cmd([[setlocal nocursorcolumn]])
      end,
    },
    {
      event = "neo_tree_buffer_leave",
      handler = function()
        vim.cmd([[setlocal cursorcolumn]])
      end,
    },
  },
  default_component_configs = {
    container = {
      enable_character_fade = true,
      width = "100%",
      right_padding = 0,
    },
    indent = {
      indent_size = 2,
      padding = 1,
      -- indent guides
      with_markers = true,
      indent_marker = "│",
      last_indent_marker = "└",
      -- highlight = 'NeoTreeIndentMarker',
      highlight = "NeoTreeNormal",
      -- expander config, needed for nesting files
      with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
      expander_collapsed = icons.ui.ChevronRight, -- 
      expander_expanded = icons.ui.ChevronDown, -- 
      -- expander_highlight = 'NeoTreeExpander',
      expander_highlight = "NeoTreeNormal",
    },
    icon = {
      folder_closed = icons.ui.Folder,
      folder_open = icons.ui.FolderOpen,
      folder_empty = icons.ui.EmptyFolder,
      folder_empty_open = icons.ui.EmptyFolderOpen,
      -- The next two settings are only a fallback, if you use nvim-web-devicons(default=true) and configure default icons there
      -- then these will never be used.
      default = icons.ui.File,
      highlight = "NeoTreeFileIcon",
    },
    modified = {
      -- symbol = "[+] ",
      symbol = icons.ui.PrimitiveDot,
      highlight = "NeoTreeModified",
    },
    name = {
      highlight = "NeoTreeFileName",
    },
    git_status = {
      -- nerdfonts search 'diff'
      symbols = {
        -- Change type
        added = icons.git.LineAdded, -- 
        deleted = icons.git.LineRemoved, -- 
        modified = icons.git.LineModified, -- 
        renamed = icons.git.FileRenamed, -- 
        -- Status type
        untracked = icons.git.FileUntracked,
        ignored = icons.git.FileIgnored,
        unstaged = icons.git.FileUnstaged,
        staged = icons.git.FileStaged, -- 
        conflict = icons.git.FileUnmerged, -- 
      },
      align = "right",
    },
    -- If you don't want to use these columns, you can set `enabled = false` for each of them individually
    file_size = {
      enabled = true,
      required_width = 64, -- min width of window required to show this column
    },
    type = {
      enabled = true,
      required_width = 110, -- min width of window required to show this column
    },
    last_modified = {
      enabled = true,
      required_width = 88, -- min width of window required to show this column
    },
    created = {
      enabled = false,
      required_width = 120, -- min width of window required to show this column
    },
    symlink_target = {
      enabled = true,
    },
  },
  renderers = {
    directory = {
      { "indent" },
      { "icon" },
      { "current_filter" },
      {
        "container",
        content = {
          { "name", zindex = 10 },
          {
            "symlink_target",
            zindex = 10,
            highlight = "NeoTreeSymbolicLinkTarget",
          },
          { "clipboard", zindex = 10 },
          { "diagnostics", errors_only = true, zindex = 20, align = "right", hide_when_expanded = false },
          { "git_status", zindex = 20, align = "right", hide_when_expanded = false },
          -- new add
          { "file_size", zindex = 10, align = "right" },
          { "type", zindex = 10, align = "right" },
          { "last_modified", zindex = 10, align = "right" },
          { "created", zindex = 10, align = "right" },
        },
      },
    },
  },
  -- Global custom commands that will be available in all sources (if not overridden in `opts[source_name].commands`)
  --
  -- You can then reference the custom command by adding a mapping to it:
  --    globally    -> `opts.window.mappings`
  --    locally     -> `opt[source_name].window.mappings` to make it source specific.
  --
  -- see `:h neo-tree-custom-commands-global`
  commands = {
    print_node_info = function(state)
      local node = state.tree:get_node()
      print(vim.inspect(node))
    end,
  },
  window = {
    width = 37, -- applies to left and right positions
    mappings = {
      ["of"] = "print_node_info",
    },
  },
  filesystem = {
    window = {
      mappings = {},
    },
    bind_to_cwd = false, -- true creates a 2-way binding between vim's cwd and neo-tree's root
    filtered_items = {
      visible = true, -- when true, they will just be displayed differently than normal items
      force_visible_in_empty_folder = true, -- when true, hidden files will be shown if the root folder is otherwise empty
    },
    follow_current_file = {
      enabled = true,
      leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
    },
    use_libuv_file_watcher = true, -- This will use the OS level file watchers to detect changes
    components = {
      symlink_target = function(config, node)
        if node.is_link then
          return {
            -- 󰜴
            text = string.format(" %s %s", icons.ui.ChevronTripleRight, node.link_to),
            highlight = config.highlight,
          }
        else
          return {}
        end
      end,
    },
  },
  buffers = {
    window = {
      mappings = {},
    },
    bind_to_cwd = false,
  },
}

return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = M.opts,
}
