local icons = require('xxx.core.icons')

local M = {}

-- https://github.com/nvim-neo-tree/neo-tree.nvim/blob/v2.x/lua/neo-tree/defaults.lua
--
M.opts = {
  -- If a user has a sources list it will replace this one.
  -- Only sources listed here will be loaded.
  -- You can also add an external source by adding it's name to this list.
  -- The name used here must be the same name you would use in a require() call.
  -- sources = {
  --   'filesystem',
  --   'buffers',
  --   'git_status',
  -- },
  -- add_blank_line_at_top = false, -- Add a blank line at the top of the tree.
  -- auto_clean_after_session_restore = false, -- Automatically clean up broken neo-tree buffers saved in sessions
  -- close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
  -- close_floats_on_escape_key = true,
  -- default_source = 'filesystem',
  -- enable_diagnostics = true,
  -- enable_git_status = true,
  -- enable_modified_markers = true, -- Show markers for files with unsaved changes.
  -- enable_opened_markers = true, -- Enable tracking of opened files. Required for `components.name.highlight_opened_files`
  -- enable_refresh_on_write = true, -- Refresh the tree when a file is written. Only used if `use_libuv_file_watcher` is false.
  -- git_status_async = true,
  -- These options are for people with VERY large git repos
  -- git_status_async_options = {
  --   batch_size = 1000, -- how many lines of git status results to process at a time
  --   batch_delay = 10, -- delay in ms between batches. Spreads out the workload to let other processes run.
  --   max_lines = 10000, -- How many lines of git status results to process. Anything after this will be dropped.
  --   -- Anything before this will be used. The last items to be processed are the untracked files.
  -- },
  -- hide_root_node = false, -- Hide the root node.
  -- retain_hidden_root_indent = false, -- IF the root node is hidden, keep the indentation anyhow.
  -- This is needed if you use expanders because they render in the indent.
  -- log_level = 'info', -- "trace", "debug", "info", "warn", "error", "fatal"
  -- log_to_file = false, -- true, false, "/path/to/file.log", use :NeoTreeLogs to show the file
  -- open_files_in_last_window = true, -- false = open files in top left window
  -- open_files_do_not_replace_types = { 'terminal', 'trouble', 'qf' }, -- when opening files, do not use windows containing these filetypes or buftypes
  -- popup_border_style is for input and confirmation dialogs.
  -- Configurtaion of floating window is done in the individual source sections.
  -- "NC" is a special style that works well with NormalNC set
  -- popup_border_style = 'NC', -- "double", "none", "rounded", "shadow", "single" or "solid"
  -- resize_timer_interval = 500, -- in ms, needed for containers to redraw right aligned and faded content
  -- set to -1 to disable the resize timer entirely
  --                           -- NOTE: this will speed up to 50 ms for 1 second following a resize
  sort_case_insensitive = true, -- used when sorting files and directories in the tree
  -- sort_function = nil, -- uses a custom function for sorting files and directories in the tree
  sort_function = function(a, b)
    local a_path = string.lower(a.path)
    local b_path = string.lower(b.path)
    return a_path < b_path
  end, -- this sorts files and directories descendantly
  -- use_popups_for_input = true, -- If false, inputs will use vim.ui.input() instead of custom floats.
  -- use_default_mappings = true,
  -- source_selector provides clickable tabs to switch between sources.
  source_selector = {
    winbar = true, -- toggle to show selector on winbar
    -- statusline = false, -- toggle to show selector on statusline
    -- show_scrolled_off_parent_node = false, -- this will replace the tabs with the parent path
    -- of the top visible node when scrolled down.
    sources = {
      { source = 'filesystem', display_name = ' ' .. icons.ui.Files .. ' Files ' },
      { source = 'buffers', display_name = ' ' .. icons.ui.TextMultiple .. ' Buffers ' },
      { source = 'git_status', display_name = ' 󰊢 Git ' },
      { source = 'diagnostics', display_name = ' 󰒡 Diagnostics ' },
    },
    content_layout = 'center', -- only with `tabs_layout` = "equal", "focus"
    --                start  : |/ 󰓩 bufname     \/...
    --                end    : |/     󰓩 bufname \/...
    --                center : |/   󰓩 bufname   \/...
    -- tabs_layout = 'equal', -- start, end, center, equal, focus
    --             start  : |/  a  \/  b  \/  c  \            |
    --             end    : |            /  a  \/  b  \/  c  \|
    --             center : |      /  a  \/  b  \/  c  \      |
    --             equal  : |/    a    \/    b    \/    c    \|
    --             active : |/  focused tab    \/  b  \/  c  \|
    -- truncation_character = '…', -- character to use when truncating the tab label
    -- tabs_min_width = nil, -- nil | int: if int padding is added based on `content_layout`
    -- tabs_max_width = nil, -- this will truncate text even if `text_trunc_to_fit = false`
    -- padding = 0, -- can be int or table
    -- padding = { left = 2, right = 0 },
    -- separator = "▕", -- can be string or table, see below
    -- separator = { left = "▏", right = "▕" },
    separator = { left = '', right = '' },
    -- separator = { left = "/", right = "\\", override = nil },     -- |/  a  \/  b  \/  c  \...
    -- separator = { left = "/", right = "\\", override = "right" }, -- |/  a  \  b  \  c  \...
    -- separator = { left = "/", right = "\\", override = "left" },  -- |/  a  /  b  /  c  /...
    -- separator = { left = "/", right = "\\", override = "active" },-- |/  a  / b:active \  c  \...
    -- separator = "|",                                              -- ||  a  |  b  |  c  |...
    -- separator_active = nil, -- set separators around the active tab. nil falls back to `source_selector.separator`
    show_separator_on_edge = true,
    --                       true  : |/    a    \/    b    \/    c    \|
    --                       false : |     a    \/    b    \/    c     |
    highlight_tab = 'NeoTreeTabInactive',
    highlight_tab_active = 'NeoTreeTabActive',
    -- highlight_background = "NeoTreeTabInactive",
    highlight_background = 'BufferLineFill',
    highlight_separator = 'NeoTreeTabSeparatorInactive',
    highlight_separator_active = 'NeoTreeTabSeparatorActive',
  },
  --
  event_handlers = {
    {
      event = 'neo_tree_buffer_enter',
      handler = function()
        vim.cmd([[setlocal nocursorcolumn]])
      end,
    },
    {
      event = 'neo_tree_buffer_leave',
      handler = function()
        vim.cmd([[setlocal cursorcolumn]])
      end,
    },
  },
  default_component_configs = {
    -- container = {
    --   enable_character_fade = true,
    --   width = '100%',
    --   right_padding = 0,
    -- },
    --diagnostics = {
    --  symbols = {
    --    hint = "H",
    --    info = "I",
    --    warn = "!",
    --    error = "X",
    --  },
    --  highlights = {
    --    hint = "DiagnosticSignHint",
    --    info = "DiagnosticSignInfo",
    --    warn = "DiagnosticSignWarn",
    --    error = "DiagnosticSignError",
    --  },
    --},
    indent = {
      indent_size = 2,
      padding = 1,
      -- indent guides
      with_markers = true,
      indent_marker = '│',
      last_indent_marker = '└',
      -- highlight = 'NeoTreeIndentMarker',
      highlight = 'NeoTreeNormal',
      -- expander config, needed for nesting files
      -- with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
      expander_collapsed = icons.ui.ChevronShortRight, -- 
      expander_expanded = icons.ui.ChevronShortDown, -- 
      -- expander_highlight = 'NeoTreeExpander',
      expander_highlight = 'NeoTreeNormal',
    },
    icon = {
      folder_closed = icons.ui.Folder,
      folder_open = icons.ui.FolderOpen,
      folder_empty = icons.ui.EmptyFolder,
      folder_empty_open = icons.ui.EmptyFolderOpen,
      -- The next two settings are only a fallback, if you use nvim-web-devicons(default=true) and configure default icons there
      -- then these will never be used.
      default = icons.ui.File,
      highlight = 'NeoTreeFileIcon',
    },
    modified = {
      -- symbol = "[+] ",
      symbol = icons.ui.PrimitiveDot,
      highlight = 'NeoTreeModified',
    },
    name = {
      -- trailing_slash = false,
      -- highlight_opened_files = false, -- Requires `enable_opened_markers = true`.
      -- Take values in { false (no highlight), true (only loaded),
      -- "all" (both loaded and unloaded)}. For more information,
      -- see the `show_unloaded` config of the `buffers` source.
      -- use_git_status_colors = true,
      highlight = 'NeoTreeFileName',
    },
    git_status = {
      -- nerdfonts search 'diff'
      symbols = {
        -- Change type
        -- added = "✚", -- NOTE: you can set any of these to an empty string to not show them
        -- deleted = "✖",
        -- modified = "",
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
      align = 'right',
    },
    symlink_target = {
      enabled = false,
    },
  },
  renderers = {
    directory = {
      { 'indent' },
      { 'icon' },
      { 'current_filter' },
      {
        'container',
        content = {
          { 'name', zindex = 10 },
          {
            'symlink_target',
            zindex = 10,
            highlight = 'NeoTreeSymbolicLinkTarget',
          },
          { 'clipboard', zindex = 10 },
          { 'diagnostics', errors_only = true, zindex = 20, align = 'right', hide_when_expanded = false },
          { 'git_status', zindex = 20, align = 'right', hide_when_expanded = false },
          -- new add
          { 'file_size', zindex = 10, align = 'right' },
          { 'type', zindex = 10, align = 'right' },
          { 'last_modified', zindex = 10, align = 'right' },
          { 'created', zindex = 10, align = 'right' },
        },
      },
    },
    -- file = {
    --   { 'indent' },
    --   { 'icon' },
    --   {
    --     'container',
    --     content = {
    --       {
    --         'name',
    --         zindex = 10,
    --       },
    --       {
    --         'symlink_target',
    --         zindex = 10,
    --         highlight = 'NeoTreeSymbolicLinkTarget',
    --       },
    --       { 'clipboard', zindex = 10 },
    --       { 'bufnr', zindex = 10 },
    --       { 'modified', zindex = 20, align = 'right' },
    --       { 'diagnostics', zindex = 20, align = 'right' },
    --       { 'git_status', zindex = 20, align = 'right' },
    --       -- new add
    --       { 'file_size', zindex = 10, align = 'right' },
    --       { 'type', zindex = 10, align = 'right' },
    --       { 'last_modified', zindex = 10, align = 'right' },
    --       { 'created', zindex = 10, align = 'right' },
    --       -- new add
    --     },
    --   },
    -- },
    -- message = {
    --   { 'indent', with_markers = false },
    --   { 'name', highlight = 'NeoTreeMessage' },
    -- },
    -- terminal = {
    --   { 'indent' },
    --   { 'icon' },
    --   { 'name' },
    --   { 'bufnr' },
    -- },
  },
  -- nesting_rules = {},
  -- commands = {},
  window = { -- see https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/popup for
    -- possible options. These can also be functions that return these options.
    -- position = 'left', -- left, right, top, bottom, float, current
    width = 37, -- applies to left and right positions
    -- height = 15, -- applies to top and bottom positions
    -- auto_expand_width = false, -- expand the window when file exceeds the window width. does not work with position = "float"
    -- popup = { -- settings that apply to float position only
    --   size = {
    --     height = '80%',
    --     width = '50%',
    --   },
    --   position = '50%', -- 50% means center it
    --   -- you can also specify border here, if you want a different setting from
    --   -- the global popup_border_style.
    -- },
    -- same_level = false, -- Create and paste/move files/directories on the same level as the directory under cursor (as opposed to within the directory under cursor).
    -- insert_as = 'child', -- Affects how nodes get inserted into the tree during creation/pasting/moving of files if the node under the cursor is a directory:
    -- "child":   Insert nodes as children of the directory under cursor.
    -- "sibling": Insert nodes  as siblings of the directory under cursor.
    -- Mappings for tree window. See `:h neo-tree-mappings` for a list of built-in commands.
    -- You can also create your own commands by providing a function instead of a string.
    -- mapping_options = {
    --   noremap = true,
    --   nowait = true,
    -- },
    mappings = {
      ['l'] = 'open',
      ['h'] = 'close_node',
      ['<space>'] = 'none',
      ['Y'] = {
        function(state)
          local node = state.tree:get_node()
          local path = node:get_id()
          vim.fn.setreg('+', path, 'c')
        end,
        desc = 'Copy Path to Clipboard',
      },
    },
  },
  filesystem = {
    -- window = {
    --   fuzzy_finder_mappings = { -- define keymaps for filter popup window in fuzzy_finder_mode
    --     ['<down>'] = 'move_cursor_down',
    --     ['<C-n>'] = 'move_cursor_down',
    --     ['<up>'] = 'move_cursor_up',
    --     ['<C-p>'] = 'move_cursor_up',
    --   },
    -- },
    -- commands = {
    --   print_node_info = function(state)
    --     local node = state.tree:get_node()
    --     print(vim.inspect(node))
    --   end,
    -- },
    -- async_directory_scan = 'auto', -- "auto"   means refreshes are async, but it's synchronous when called from the Neotree commands.
    -- "always" means directory scans are always async.
    -- "never"  means directory scans are never async.
    -- scan_mode = 'shallow', -- "shallow": Don't scan into directories to detect possible empty directory a priori
    -- "deep": Scan into directories to detect empty or grouped empty directories a priori.
    bind_to_cwd = false, -- true creates a 2-way binding between vim's cwd and neo-tree's root
    -- cwd_target = {
    --   sidebar = 'tab', -- sidebar is when position = left or right
    --   current = 'window', -- current is when position = current
    -- },
    -- The renderer section provides the renderers that will be used to render the tree.
    --   The first level is the node type.
    --   For each node type, you can specify a list of components to render.
    --       Components are rendered in the order they are specified.
    --         The first field in each component is the name of the function to call.
    --         The rest of the fields are passed to the function as the "config" argument.
    filtered_items = {
      visible = true, -- when true, they will just be displayed differently than normal items
      force_visible_in_empty_folder = true, -- when true, hidden files will be shown if the root folder is otherwise empty
      -- show_hidden_count = true, -- when true, the number of hidden items in each folder will be shown as the last entry
      -- hide_dotfiles = true,
      -- hide_gitignored = true,
      -- hide_hidden = true, -- only works on Windows for hidden files/directories
      -- hide_by_name = {
      --   '.DS_Store',
      --   'thumbs.db',
      --   --"node_modules",
      -- },
      -- hide_by_pattern = { -- uses glob style patterns
      --   --"*.meta",
      --   --"*/src/*/tsconfig.json"
      -- },
      -- always_show = { -- remains visible even if other settings would normally hide it
      --   --".gitignored",
      -- },
      -- never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
      --   --".DS_Store",
      --   --"thumbs.db"
      -- },
      -- never_show_by_pattern = { -- uses glob style patterns
      --   --".null-ls_*",
      -- },
    },
    -- find_by_full_path_words = false, -- `false` means it only searches the tail of a path.
    -- `true` will change the filter into a full path
    -- search with space as an implicit ".*", so
    -- `fi init`
    -- will match: `./sources/filesystem/init.lua
    --find_command = "fd", -- this is determined automatically, you probably don't need to set it
    --find_args = {  -- you can specify extra args to pass to the find command.
    --  fd = {
    --  "--exclude", ".git",
    --  "--exclude",  "node_modules"
    --  }
    --},
    ---- or use a function instead of list of strings
    --find_args = function(cmd, path, search_term, args)
    --  if cmd ~= "fd" then
    --    return args
    --  end
    --  --maybe you want to force the filter to always include hidden files:
    --  table.insert(args, "--hidden")
    --  -- but no one ever wants to see .git files
    --  table.insert(args, "--exclude")
    --  table.insert(args, ".git")
    --  -- or node_modules
    --  table.insert(args, "--exclude")
    --  table.insert(args, "node_modules")
    --  --here is where it pays to use the function, you can exclude more for
    --  --short search terms, or vary based on the directory
    --  if string.len(search_term) < 4 and path == "/home/cseickel" then
    --    table.insert(args, "--exclude")
    --    table.insert(args, "Library")
    --  end
    --  return args
    --end,
    -- group_empty_dirs = false, -- when true, empty folders will be grouped together
    -- search_limit = 50, -- max number of search results when using filters
    -- follow_current_file = true, -- This will find and focus the file in the active buffer every time
    follow_current_file = {
      enabled = true,
      leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
    },
    -- the current file is changed while the tree is open.
    -- hijack_netrw_behavior = 'open_default', -- netrw disabled, opening a directory opens neo-tree
    -- in whatever position is specified in window.position
    -- "open_current",-- netrw disabled, opening a directory opens within the
    -- window like netrw would, regardless of window.position
    -- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
    use_libuv_file_watcher = true, -- This will use the OS level file watchers to detect changes
    -- instead of relying on nvim autocmd events.
    components = {
      symlink_target = function(config, node)
        if node.is_link then
          return {
            -- 󰜴
            text = string.format(' %s %s', icons.ui.ChevronTripleRight, node.link_to),
            highlight = config.highlight,
          }
        else
          return {}
        end
      end,
    },
  },
  buffers = {
    bind_to_cwd = false,
    -- follow_current_file = true, -- This will find and focus the file in the active buffer every time
    -- follow_current_file = {
    --   enabled = true,
    --   leave_dirs_open = false,
    -- },
    -- the current file is changed while the tree is open.
    -- group_empty_dirs = true, -- when true, empty directories will be grouped together
    -- show_unloaded = false, -- When working with sessions, for example, restored but unfocused buffers
    -- are mark as "unloaded". Turn this on to view these unloaded buffer.
    -- window = {},
  },
  -- git_status = {
  --   window = {},
  -- },
  -- example = {
  --   renderers = {
  --     custom = {
  --       { 'indent' },
  --       { 'icon', default = 'C' },
  --       { 'custom' },
  --       { 'name' },
  --     },
  --   },
  --   window = {},
  -- },
}

function M.setup()
  local neo_tree = require('neo-tree')
  neo_tree.setup(M.opts)
  -- 不起作用
  -- local autocmd = require('xxx.core.autocmds')
  -- autocmd.define_autocmd {
  --   'FileType',
  --   {
  --     group = '_filetype_settings',
  --     pattern = { 'neo-tree' },
  --     command = 'setlocal! nocursorcolumn',
  --   },
  -- }
  -- highlight_tab = "NeoTreeTabInactive",
  -- highlight_tab_active = "NeoTreeTabActive",
  -- highlight_background = "NeoTreeTabInactive",
  -- highlight_separator = "NeoTreeTabSeparatorInactive",
  -- highlight_separator_active = "NeoTreeTabSeparatorActive",

  local colorbuddy = require('colorbuddy')
  local colors = colorbuddy.colors
  local Group = colorbuddy.Group
  local groups = colorbuddy.groups
  local styles = colorbuddy.styles

  Group.new('NeoTreeRootName', colors.darkgold, nil, styles.bold)
  Group.new('NeoTreeDirectoryIcon', colors.yellow)
  Group.link('NeoTreeFileIcon', groups.Normal)
  Group.new('NeoTreeFileNameOpened', groups.Normal, nil, styles.bold)
  Group.new('NeoTreeSymbolicLinkTarget', colors.cyan)
  Group.new('NeoTreeModified', colors.darkgold)

  Group.new('NeoTreeTabInactive', colors.base00, colors.base03)
  Group.new('NeoTreeTabActive', colors.base1, nil, styles.bold + styles.italic)
  Group.new('NeoTreeTabSeparatorInactive', colors.base02, colors.base03)
  Group.new('NeoTreeTabSeparatorActive', colors.base02)

  vim.cmd([[
    " highlight! link NeoTreeTabInactive BufferLineBackground
    " highlight! link NeoTreeTabActive BufferLineBufferSelected
    " highlight! link NeoTreeTabSeparatorInactive BufferLineSeparator
    " highlight! link NeoTreeTabSeparatorActive BufferLineSeparatorSelected
    highlight! link NeoTreeDirectoryName Normal
    highlight! link NeoTreeFileName Normal
  ]])
end
return M
