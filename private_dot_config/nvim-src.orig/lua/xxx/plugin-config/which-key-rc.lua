local M = {}

M.opts = {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = true, -- adds help for operators like d, y, ...
      motions = false, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = false, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = false, -- bindings for prefixed with g
    },
    spelling = { enabled = true, suggestions = 20 }, -- use which-key for spelling hints
  },
  icons = {
    breadcrumb = '»', -- symbol used in the command line area that shows your active key combo
    -- separator = "➜", -- symbol used between a key and it's label
    separator = '󰁔 ', -- symbol used between a key and it's label
    group = '+', -- symbol prepended to a group
  },
  win = {
    wo = {
      winblend = Xvim.which_key_winblend,
    },
  },
  -- popup_mappings = {
  --   scroll_down = '<c-d>', -- binding to scroll down inside the popup
  --   scroll_up = '<c-u>', -- binding to scroll up inside the popup
  -- },
  -- window = {
  --   -- border = "single", -- none, single, double, shadow
  --   border = 'none', -- none, single, double, shadow
  --   position = 'bottom', -- bottom, top
  --   margin = { 1, 1, 1, 1 }, -- extra window margin [top, right, bottom, left]
  --   padding = { 3, 3, 3, 3 }, -- extra window padding [top, right, bottom, left]
  --   winblend = Xvim.which_key_winblend,
  -- },
  layout = {
    height = { min = 3, max = 26 }, -- min and max height of the columns
    width = { min = 36, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = 'left', -- align columns left, center or right
  },
  -- hidden = { '<silent>', '<cmd>', '<Cmd>', '<CR>', 'call', 'lua', '^:', '^ ' }, -- hide mapping boilerplate
  -- ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  show_help = true, -- show help message on the command line when the popup is visible
  show_keys = true, -- show the currently pressed key and its label as a message in the command line
  triggers = 'auto', -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  -- triggers_blacklist = {
  --   -- list of mode / prefixes that should never be hooked by WhichKey
  --   -- this is mostly relevant for key maps that start with a native binding
  --   -- most people should not need to change this
  --   i = { 'j', 'k' },
  --   v = { 'j', 'k' },
  -- },
}

M.v_opts = {
  mode = 'v', -- VISUAL mode
  prefix = '<leader>',
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

M.v_mappings = {
  -- ["/"] = { "<Plug>(comment_toggle_linewise_visual)", "Comment toggle linewise (visual)" },
}

M.n_opts = {
  mode = 'n', -- NORMAL mode
  prefix = '<leader>',
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

M.n_mappings = {
  -- [";"] = { "<cmd>Alpha<CR>", "Dashboard" },
  ['/'] = { ':nohlsearch<CR>', 'Clean Search Highlight' },
  w = { '<cmd>w!<CR>', 'Save' },
  q = { require('xxx.utils.functions').smart_quit, 'Quit current window' },
  -- e = { "<cmd>NvimTreeToggle<CR>", "Explorer" },
  e = { '<cmd>Neotree toggle<CR>', 'Explorer' },
  -- f = { require("xxx.plugin-config.telescope-rc.custom-finders").find_project_files, "Find File" },
  G = { '1<c-g>', 'Buffer path info' },
  N = { '<cmd>Notifications<CR>', 'Notifications' },
  R = { '<cmd>PrintRtp<CR>', 'Print runtimepath' },
  z = { '<cmd>Lazy<CR>', 'Lazy' },
  -- ["/"] = { "<Plug>(comment_toggle_linewise_current)", "Comment toggle current line" },
  -- ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
  ['<leader>'] = {
    a = { '<cmd>HopAnywhere<CR>', 'HopAnywhere' },
    s = { '<cmd>HopChar1<CR>', 'HopChar1' },
    t = { '<cmd>HopChar2<CR>', 'HopChar2' },
    w = { '<cmd>HopWord<CR>', 'HopWord' },
    l = { '<cmd>HopLineStart<CR>', 'HopLineStart' },
    L = { '<cmd>HopLine<CR>', 'HopLine' },
    v = { '<cmd>HopVertical<CR>', 'HopVertical' },
    p = { '<cmd>HopPattern<CR>', 'HopPattern' },
  },
  a = {
    name = 'Lspsaga',
    r = { '<cmd>Lspsaga rename<CR>', 'Rename' },
    R = { '<cmd>Lspsaga rename ++project<CR>', 'Rename(Project)' },
    o = { '<cmd>Lspsaga outline<CR>', 'Outline' },
    k = { '<cmd>Lspsaga hover_doc<CR>', 'Hover Doc' },
    K = { '<cmd>Lspsaga hover_doc ++keep<CR>', 'Hover Doc(Keep)' },
    f = { '<cmd>Lspsaga lsp_finder<CR>', 'Lsp Finder' },
    a = { '<cmd>Lspsaga code_action<CR>', 'Code Action' },
    T = { '<cmd>Lspsaga term_toggle<CR>', 'Term Toggle' },
    c = {
      name = 'Calls',
      o = { '<cmd>Lspsaga outgoing_calls<CR>', 'Outgoing Calls' },
      i = { '<cmd>Lspsaga incoming_calls<CR>', 'Incoming Calls' },
    },
    D = { '<cmd>Lspsaga peek_definition<CR>', 'Peek Definition' },
    d = { '<cmd>Lspsaga goto_definition<CR>', 'Goto Definition' },
    p = { '<cmd>Lspsaga diagnostic_jump_prev<CR>', 'Prev Diagnostic' },
    n = { '<cmd>Lspsaga diagnostic_jump_next<CR>', 'Next Diagnostic' },
    t = {
      name = 'Type Definition',
      D = { '<cmd>Lspsaga peek_type_definition<CR>', 'Peek Type Definition' },
      d = { '<cmd>Lspsaga goto_type_definition<CR>', 'Goto Type Definition' },
    },
    s = {
      name = 'Show Diagnostics',
      l = { '<cmd>Lspsaga show_line_diagnostics<CR>', 'Diagnostics(Line)' },
      b = { '<cmd>Lspsaga show_buf_diagnostics<CR>', 'Diagnostics(Buffer)' },
      c = { '<cmd>Lspsaga show_cursor_diagnostics<CR>', 'Diagnostics(Cursor)' },
    },
  },
  b = {
    name = 'Buffers',
    j = { '<cmd>BufferLinePick<cr>', 'Jump' },
    f = { '<cmd>Telescope buffers<cr>', 'Find' },
    p = { '<cmd>BufferLineCyclePrev<cr>', 'Previous' },
    n = { '<cmd>BufferLineCycleNext<cr>', 'Next' },
    -- w = { "<cmd>BufferWipeout<cr>", "Wipeout" }, -- TODO: implement this for bufferline
    c = { '<cmd>BufferLinePickClose<cr>', 'Pick which buffer to close' },
    h = { '<cmd>BufferLineCloseLeft<cr>', 'Close all to the left' },
    l = { '<cmd>BufferLineCloseRight<cr>', 'Close all to the right' },
    D = { '<cmd>BufferLineSortByDirectory<cr>', 'Sort by directory' },
    L = { '<cmd>BufferLineSortByExtension<cr>', 'Sort by language' },
  },
  -- c = {
  c = { '<cmd>BufferKill<CR>', 'Close Buffer(Keep window)' },
  -- },
  P = {},
  g = {
    name = 'Git',
    g = { require('xxx.plugin-config.toggleterm-rc').lazygit_toggle, 'Lazygit' },
    j = { "<cmd>lua require 'gitsigns'.next_hunk({navigation_message=false})<CR>", 'Next Hunk' },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message=false})<CR>", 'Prev Hunk' },
    l = { "<cmd>lua require 'gitsigns'.blame_line()<CR>", 'Blame' },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<CR>", 'Preview Hunk' },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<CR>", 'Reset Hunk' },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<CR>", 'Reset Buffer' },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<CR>", 'Stage Hunk' },
    u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<CR>", 'Undo Stage Hunk' },
    o = { '<cmd>Telescope git_status<CR>', 'Open changed file' },
    b = { '<cmd>Telescope git_branches<CR>', 'Checkout branch' },
    c = { '<cmd>Telescope git_commits<CR>', 'Checkout commit' },
    C = { '<cmd>Telescope git_bcommits<CR>', 'Checkout commit(for current file)' },
    d = { '<cmd>Gitsigns diffthis HEAD<CR>', 'Git Diff' },
  },
  m = {
    name = 'Marks',
    -- a = { "<cmd>lua require 'harpoon.mark'.add_file()<CR>", 'Add file(Harpoon)' },
    -- l = { '<cmd>Telescope harpoon marks<CR>', 'List file(Harpoon)' },
    -- n = { "<cmd>lua require 'harpoon.ui'.nav_next()<CR>", 'Next mark(Harpoon)' },
    -- p = { "<cmd>lua require 'harpoon.ui'.nav_prev()<CR>", 'Previous mark(Harpoon)' },
    -- d = { '<Plug>(Marks-deleteline)', 'Delete mark at current line' },
    -- ["2"] = { "<cmd>lua require 'harpoon.ui'.nav_file(2)<CR>", "Goto 2" },
  },
  l = {
    name = 'LSP',
    a = { vim.lsp.buf.code_action, 'Code Action' },
    -- d = { "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "Buffer Diagnostics" },
    -- w = { "<cmd>Telescope diagnostics<CR>", "Diagnostics" },
    -- config in lsp/config.lua
    r = { '<cmd>Trouble lsp_references<CR>', 'References' },
    -- f = { require("xxx.lsp.utils").format, "Format" }, -- set in lsp/keymapping.lua
    n = { vim.diagnostic.goto_next, 'Next Diagnostic' },
    p = { vim.diagnostic.goto_prev, 'Prev Diagnostic' },
    L = { vim.lsp.codelens.run, 'CodeLens Action' },
    q = { vim.diagnostic.setloclist, 'Quickfix' },
    -- r = { vim.lsp.buf.rename, "Rename" },
    s = { '<cmd>Telescope lsp_document_symbols<CR>', 'Document Symbols' },
    S = { '<cmd>Telescope lsp_dynamic_workspace_symbols<CR>', 'Workspace Symbols' },
    e = { '<cmd>Telescope quickfix<CR>', 'Telescope Quickfix' },
    D = { '<cmd>Lspsaga peek_definition<CR>', 'Peek Definition' },
    i = { '<cmd>LspInfo<CR>', 'Lsp Info' },
    m = { '<cmd>Mason<CR>', 'Mason' },
    c = { '<cmd>CmpStatus<CR>', 'Cmp Status' },
    C = { require('xxx.lsp.info').print_clients_server_capabilities, 'Clients Server Capabilities' },
    P = { require('xxx.lsp.info').print_clients_config, 'Clients Config' },
    t = { '<cmd>LspStop<CR>', 'LspStop' },
  },
  s = {
    name = 'Search',
    a = { '<cmd>Telescope autocommands<CR>', 'Autocommands' },
    b = { '<cmd>Telescope builtin<CR>', 'Builtin' },
    -- b = { "<cmd>Telescope git_branches<CR>", "Checkout branch" },
    c = { '<cmd>Telescope colorscheme<CR>', 'Colorscheme' },
    f = { '<cmd>Telescope find_files<CR>', 'Find File' },
    h = { '<cmd>Telescope help_tags<CR>', 'Find Help' },
    H = { '<cmd>Telescope highlights<CR>', 'Find highlight groups' },
    M = { '<cmd>Telescope man_pages<CR>', 'Man Pages' },
    -- r = { "<cmd>Telescope oldfiles<CR>", "Open Recent File" },
    r = { '<cmd>Telescope frecency workspace=CWD<CR>', 'Frecency' },
    s = { '<cmd>Telescope smart_history<CR>', 'Smart History(No UI)' },
    R = { '<cmd>Telescope registers<CR>', 'Registers' },
    t = { '<cmd>Telescope live_grep<CR>', 'Text' },
    k = { '<cmd>Telescope keymaps<CR>', 'Keymaps' },
    C = { '<cmd>Telescope commands<CR>', 'Commands' },
    P = {
      "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<CR>",
      'Colorscheme with Preview',
    },
    o = { '<cmd>Telescope vim_options<CR>', 'Vim Options' },
    p = { '<cmd>Telescope projects<CR>', 'Projects' },
  },
  S = {
    name = 'SessionManager',
    l = { '<cmd>SessionManager load_session<CR>', 'Load Session' },
    L = { '<cmd>SessionManager load_last_session<CR>', 'Load Last Session' },
    c = { '<cmd>SessionManager load_current_dir_session<CR>', 'Load Current Dir Session' },
    s = { '<cmd>SessionManager save_current_session<CR>', 'Save Current Session' },
    d = { '<cmd>SessionManager delete_session<CR>', 'Delete Session' },
  },
  t = {
    name = 'Trouble & Tab page',
    -- +lsp
    x = { '<cmd>Trouble diagnostics toggle focus=false filter.buf=0<CR>', 'Diagnostics(Buffer)' },
    X = { '<cmd>Trouble diagnostics toggle focus=true<CR>', 'Diagnostics(Workspace)' },
    --  lsp/config.lua: gr
    -- r = { '<cmd>Trouble lsp_references<CR>', 'References' },
    -- use lsp's gd, not use this
    d = { '<cmd>Trouble lsp_definitions<CR>', 'Definitions' },
    D = { '<cmd>Trouble lsp_type_definitions<CR>', 'Type Definitions' },
    i = { '<cmd>Trouble lsp_implementations<CR>', 'Implementations' },
    s = { '<cmd>Trouble lsp_document_symbols results.win={type=split,position=right}<CR>', 'Lsp Symbols' },
    S = { '<cmd>Trouble symbols<CR>', 'Symbols' },
    l = { '<cmd>Trouble loclist<CR>', 'Loclist' },
    q = { '<cmd>Trouble quickfix<CR>', 'Quickfix' },
    t = { '<cmd>Trouble telescope<CR>', 'Telescope Results' },

    c = { ':tabclose<CR>', 'Close current tab page' },
    f = {
      function()
        require('xxx.plugin-config.bufferline-rc').tab_filter_buf_toggle()
      end,
      'Tag filter buffer toggle',
    },
    a = {
      function()
        require('xxx.plugin-config.bufferline-rc').tab_filter_buf_add()
      end,
      'show current buffer in current tab page',
    },
    r = {
      function()
        require('xxx.plugin-config.bufferline-rc').tab_filter_buf_remove()
      end,
      'hidden current buffer in current tab page',
    },
  },
  T = {
    name = 'Treesitter',
    i = { ':TSConfigInfo<CR>', 'Info' },
    m = { ':TSModuleInfo<CR>', 'Module Info' },
  },
  X = {
    name = 'XVim',
    [';'] = { '<cmd>Alpha<CR>', 'Dashboard' },
    f = {
      require('xxx.plugin-config.telescope-rc.custom-finders').find_xvim_files,
      'Find XVim files',
    },
    g = {
      require('xxx.plugin-config.telescope-rc.custom-finders').grep_xvim_files,
      'Grep XVim files',
    },
    k = { '<cmd>Telescope keymaps<CR>', 'Keymapings' },
    i = {
      function()
        require('xxx.core.info').toggle_popup(vim.bo.filetype)
      end,
      'Toggle XVim Info',
    },
    l = {
      name = '+logs',
      l = {
        function()
          require('xxx.plugin-config.toggleterm-rc').toggle_log_view(vim.lsp.get_log_path())
        end,
        'View LSP log',
      },
      L = {
        function()
          vim.fn.execute('edit ' .. vim.lsp.get_log_path())
        end,
        'Open the LSP logfile',
      },
      n = {
        function()
          require('xxx.plugin-config.toggleterm-rc').toggle_log_view(os.getenv('NVIM_LOG_FILE'))
        end,
        'View Neovim log',
      },
      N = { '<cmd>edit $NVIM_LOG_FILE<CR>', 'Open the Neovim logfile' },
    },
    n = { '<cmd>Telescope notify<cr>', 'View Notifications' },
    r = { require('xxx.lsp.templates').remove_template_files, 'Remove lsp ftplugin files' },
  },
}

M.spec = {
  mode = { 'n', 'v' },
  { '<leader>/', ':nohlsearch<CR>', desc = 'Clean Search Highlight', nowait = true, remap = false },
  { '<leader><leader>L', '<cmd>HopLine<CR>', desc = 'HopLine', nowait = true, remap = false },
  { '<leader><leader>a', '<cmd>HopAnywhere<CR>', desc = 'HopAnywhere', nowait = true, remap = false },
  { '<leader><leader>l', '<cmd>HopLineStart<CR>', desc = 'HopLineStart', nowait = true, remap = false },
  { '<leader><leader>p', '<cmd>HopPattern<CR>', desc = 'HopPattern', nowait = true, remap = false },
  { '<leader><leader>s', '<cmd>HopChar1<CR>', desc = 'HopChar1', nowait = true, remap = false },
  { '<leader><leader>t', '<cmd>HopChar2<CR>', desc = 'HopChar2', nowait = true, remap = false },
  { '<leader><leader>v', '<cmd>HopVertical<CR>', desc = 'HopVertical', nowait = true, remap = false },
  { '<leader><leader>w', '<cmd>HopWord<CR>', desc = 'HopWord', nowait = true, remap = false },

  { '<leader>G', '1<c-g>', desc = 'Buffer path info', nowait = true, remap = false },
  { '<leader>N', '<cmd>Notifications<CR>', desc = 'Notifications', nowait = true, remap = false },
  { '<leader>R', '<cmd>PrintRtp<CR>', desc = 'Print runtimepath', nowait = true, remap = false },
  { '<leader>S', group = 'SessionManager', nowait = true, remap = false },
  {
    '<leader>SL',
    '<cmd>SessionManager load_last_session<CR>',
    desc = 'Load Last Session',
    nowait = true,
    remap = false,
  },
  {
    '<leader>Sc',
    '<cmd>SessionManager load_current_dir_session<CR>',
    desc = 'Load Current Dir Session',
    nowait = true,
    remap = false,
  },
  { '<leader>Sd', '<cmd>SessionManager delete_session<CR>', desc = 'Delete Session', nowait = true, remap = false },
  { '<leader>Sl', '<cmd>SessionManager load_session<CR>', desc = 'Load Session', nowait = true, remap = false },
  {
    '<leader>Ss',
    '<cmd>SessionManager save_current_session<CR>',
    desc = 'Save Current Session',
    nowait = true,
    remap = false,
  },
  { '<leader>T', group = 'Treesitter', nowait = true, remap = false },
  { '<leader>Ti', ':TSConfigInfo<CR>', desc = 'Info', nowait = true, remap = false },
  { '<leader>Tm', ':TSModuleInfo<CR>', desc = 'Module Info', nowait = true, remap = false },
  { '<leader>X', group = 'XVim', nowait = true, remap = false },
  { '<leader>X;', '<cmd>Alpha<CR>', desc = 'Dashboard', nowait = true, remap = false },
  {
    '<leader>Xf',
    require('xxx.plugin-config.telescope-rc.custom-finders').find_xvim_files,
    desc = 'Find XVim files',
    nowait = true,
    remap = false,
  },
  {
    '<leader>Xg',
    require('xxx.plugin-config.telescope-rc.custom-finders').grep_xvim_files,
    desc = 'Grep XVim files',
    nowait = true,
    remap = false,
  },
  {
    '<leader>Xi',
    function()
      require('xxx.core.info').toggle_popup(vim.bo.filetype)
    end,
    desc = 'Toggle XVim Info',
    nowait = true,
    remap = false,
  },
  { '<leader>Xk', '<cmd>Telescope keymaps<CR>', desc = 'Keymapings', nowait = true, remap = false },
  { '<leader>Xl', group = 'logs', nowait = true, remap = false },
  { '<leader>Xn', '<cmd>Telescope notify<cr>', desc = 'View Notifications', nowait = true, remap = false },
  {
    '<leader>Xr',
    require('xxx.lsp.templates').remove_template_files,
    desc = 'Remove lsp ftplugin files',
    nowait = true,
    remap = false,
  },
  { '<leader>a', group = 'Lspsaga', nowait = true, remap = false },
  { '<leader>aD', '<cmd>Lspsaga peek_definition<CR>', desc = 'Peek Definition', nowait = true, remap = false },
  { '<leader>aK', '<cmd>Lspsaga hover_doc ++keep<CR>', desc = 'Hover Doc(Keep)', nowait = true, remap = false },
  { '<leader>aR', '<cmd>Lspsaga rename ++project<CR>', desc = 'Rename(Project)', nowait = true, remap = false },
  { '<leader>aT', '<cmd>Lspsaga term_toggle<CR>', desc = 'Term Toggle', nowait = true, remap = false },
  { '<leader>aa', '<cmd>Lspsaga code_action<CR>', desc = 'Code Action', nowait = true, remap = false },
  { '<leader>ac', group = 'Calls', nowait = true, remap = false },
  { '<leader>aci', '<cmd>Lspsaga incoming_calls<CR>', desc = 'Incoming Calls', nowait = true, remap = false },
  { '<leader>aco', '<cmd>Lspsaga outgoing_calls<CR>', desc = 'Outgoing Calls', nowait = true, remap = false },
  { '<leader>ad', '<cmd>Lspsaga goto_definition<CR>', desc = 'Goto Definition', nowait = true, remap = false },
  { '<leader>af', '<cmd>Lspsaga lsp_finder<CR>', desc = 'Lsp Finder', nowait = true, remap = false },
  { '<leader>ak', '<cmd>Lspsaga hover_doc<CR>', desc = 'Hover Doc', nowait = true, remap = false },
  { '<leader>an', '<cmd>Lspsaga diagnostic_jump_next<CR>', desc = 'Next Diagnostic', nowait = true, remap = false },
  { '<leader>ao', '<cmd>Lspsaga outline<CR>', desc = 'Outline', nowait = true, remap = false },
  { '<leader>ap', '<cmd>Lspsaga diagnostic_jump_prev<CR>', desc = 'Prev Diagnostic', nowait = true, remap = false },
  { '<leader>ar', '<cmd>Lspsaga rename<CR>', desc = 'Rename', nowait = true, remap = false },
  { '<leader>as', group = 'Show Diagnostics', nowait = true, remap = false },
  {
    '<leader>asb',
    '<cmd>Lspsaga show_buf_diagnostics<CR>',
    desc = 'Diagnostics(Buffer)',
    nowait = true,
    remap = false,
  },
  {
    '<leader>asc',
    '<cmd>Lspsaga show_cursor_diagnostics<CR>',
    desc = 'Diagnostics(Cursor)',
    nowait = true,
    remap = false,
  },
  { '<leader>asl', '<cmd>Lspsaga show_line_diagnostics<CR>', desc = 'Diagnostics(Line)', nowait = true, remap = false },
  { '<leader>at', group = 'Type Definition', nowait = true, remap = false },
  {
    '<leader>atD',
    '<cmd>Lspsaga peek_type_definition<CR>',
    desc = 'Peek Type Definition',
    nowait = true,
    remap = false,
  },
  {
    '<leader>atd',
    '<cmd>Lspsaga goto_type_definition<CR>',
    desc = 'Goto Type Definition',
    nowait = true,
    remap = false,
  },
  { '<leader>b', group = 'Buffers', nowait = true, remap = false },
  { '<leader>bD', '<cmd>BufferLineSortByDirectory<cr>', desc = 'Sort by directory', nowait = true, remap = false },
  { '<leader>bL', '<cmd>BufferLineSortByExtension<cr>', desc = 'Sort by language', nowait = true, remap = false },
  { '<leader>bc', '<cmd>BufferLinePickClose<cr>', desc = 'Pick which buffer to close', nowait = true, remap = false },
  { '<leader>bf', '<cmd>Telescope buffers<cr>', desc = 'Find', nowait = true, remap = false },
  { '<leader>bh', '<cmd>BufferLineCloseLeft<cr>', desc = 'Close all to the left', nowait = true, remap = false },
  { '<leader>bj', '<cmd>BufferLinePick<cr>', desc = 'Jump', nowait = true, remap = false },
  { '<leader>bl', '<cmd>BufferLineCloseRight<cr>', desc = 'Close all to the right', nowait = true, remap = false },
  { '<leader>bn', '<cmd>BufferLineCycleNext<cr>', desc = 'Next', nowait = true, remap = false },
  { '<leader>bp', '<cmd>BufferLineCyclePrev<cr>', desc = 'Previous', nowait = true, remap = false },
  { '<leader>c', '<cmd>BufferKill<CR>', desc = 'Close Buffer(Keep window)', nowait = true, remap = false },
  { '<leader>e', '<cmd>Neotree toggle<CR>', desc = 'Explorer', nowait = true, remap = false },
  { '<leader>g', group = 'Git', nowait = true, remap = false },
  {
    '<leader>gC',
    '<cmd>Telescope git_bcommits<CR>',
    desc = 'Checkout commit(for current file)',
    nowait = true,
    remap = false,
  },
  {
    '<leader>gR',
    "<cmd>lua require 'gitsigns'.reset_buffer()<CR>",
    desc = 'Reset Buffer',
    nowait = true,
    remap = false,
  },
  { '<leader>gb', '<cmd>Telescope git_branches<CR>', desc = 'Checkout branch', nowait = true, remap = false },
  { '<leader>gc', '<cmd>Telescope git_commits<CR>', desc = 'Checkout commit', nowait = true, remap = false },
  { '<leader>gd', '<cmd>Gitsigns diffthis HEAD<CR>', desc = 'Git Diff', nowait = true, remap = false },
  {
    '<leader>gg',
    require('xxx.plugin-config.toggleterm-rc').lazygit_toggle,
    desc = 'Lazygit',
    nowait = true,
    remap = false,
  },
  {
    '<leader>gj',
    "<cmd>lua require 'gitsigns'.next_hunk({navigation_message=false})<CR>",
    desc = 'Next Hunk',
    nowait = true,
    remap = false,
  },
  {
    '<leader>gk',
    "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message=false})<CR>",
    desc = 'Prev Hunk',
    nowait = true,
    remap = false,
  },
  { '<leader>gl', "<cmd>lua require 'gitsigns'.blame_line()<CR>", desc = 'Blame', nowait = true, remap = false },
  { '<leader>go', '<cmd>Telescope git_status<CR>', desc = 'Open changed file', nowait = true, remap = false },
  {
    '<leader>gp',
    "<cmd>lua require 'gitsigns'.preview_hunk()<CR>",
    desc = 'Preview Hunk',
    nowait = true,
    remap = false,
  },
  { '<leader>gr', "<cmd>lua require 'gitsigns'.reset_hunk()<CR>", desc = 'Reset Hunk', nowait = true, remap = false },
  { '<leader>gs', "<cmd>lua require 'gitsigns'.stage_hunk()<CR>", desc = 'Stage Hunk', nowait = true, remap = false },
  {
    '<leader>gu',
    "<cmd>lua require 'gitsigns'.undo_stage_hunk()<CR>",
    desc = 'Undo Stage Hunk',
    nowait = true,
    remap = false,
  },
  { '<leader>l', group = 'LSP', nowait = true, remap = false },
  {
    '<leader>lC',
    require('xxx.lsp.info').print_clients_server_capabilities,
    desc = 'Clients Server Capabilities',
    nowait = true,
    remap = false,
  },
  { '<leader>lD', '<cmd>Lspsaga peek_definition<CR>', desc = 'Peek Definition', nowait = true, remap = false },
  { '<leader>lL', vim.lsp.codelens.run, desc = 'CodeLens Action', nowait = true, remap = false },
  { '<leader>lP', require('xxx.lsp.info').print_clients_config, desc = 'Clients Config', nowait = true, remap = false },
  {
    '<leader>lS',
    '<cmd>Telescope lsp_dynamic_workspace_symbols<CR>',
    desc = 'Workspace Symbols',
    nowait = true,
    remap = false,
  },
  { '<leader>la', vim.lsp.buf.code_action, desc = 'Code Action', nowait = true, remap = false },
  { '<leader>lc', '<cmd>CmpStatus<CR>', desc = 'Cmp Status', nowait = true, remap = false },
  { '<leader>le', '<cmd>Telescope quickfix<CR>', desc = 'Telescope Quickfix', nowait = true, remap = false },
  { '<leader>li', '<cmd>LspInfo<CR>', desc = 'Lsp Info', nowait = true, remap = false },
  { '<leader>lm', '<cmd>Mason<CR>', desc = 'Mason', nowait = true, remap = false },
  { '<leader>ln', vim.diagnostic.goto_next, desc = 'Next Diagnostic', nowait = true, remap = false },
  { '<leader>lp', vim.diagnostic.goto_prev, desc = 'Prev Diagnostic', nowait = true, remap = false },
  { '<leader>lq', vim.diagnostic.setloclist, desc = 'Quickfix', nowait = true, remap = false },
  { '<leader>lr', '<cmd>Trouble lsp_references<CR>', desc = 'References', nowait = true, remap = false },
  { '<leader>ls', '<cmd>Telescope lsp_document_symbols<CR>', desc = 'Document Symbols', nowait = true, remap = false },
  { '<leader>lt', '<cmd>LspStop<CR>', desc = 'LspStop', nowait = true, remap = false },
  { '<leader>m', group = 'Marks', nowait = true, remap = false },
  { '<leader>md', '<Plug>(Marks-deleteline)', nowait = true, remap = false },
  {
    '<leader>q',
    require('xxx.utils.functions').smart_quit,
    desc = 'Quit current window',
    nowait = true,
    remap = false,
  },
  { '<leader>s', group = 'Search', nowait = true, remap = false },
  { '<leader>sC', '<cmd>Telescope commands<CR>', desc = 'Commands', nowait = true, remap = false },
  { '<leader>sH', '<cmd>Telescope highlights<CR>', desc = 'Find highlight groups', nowait = true, remap = false },
  { '<leader>sM', '<cmd>Telescope man_pages<CR>', desc = 'Man Pages', nowait = true, remap = false },
  {
    '<leader>sP',
    "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<CR>",
    desc = 'Colorscheme with Preview',
    nowait = true,
    remap = false,
  },
  { '<leader>sR', '<cmd>Telescope registers<CR>', desc = 'Registers', nowait = true, remap = false },
  { '<leader>sa', '<cmd>Telescope autocommands<CR>', desc = 'Autocommands', nowait = true, remap = false },
  { '<leader>sb', '<cmd>Telescope builtin<CR>', desc = 'Builtin', nowait = true, remap = false },
  { '<leader>sc', '<cmd>Telescope colorscheme<CR>', desc = 'Colorscheme', nowait = true, remap = false },
  { '<leader>sf', '<cmd>Telescope find_files<CR>', desc = 'Find File', nowait = true, remap = false },
  { '<leader>sh', '<cmd>Telescope help_tags<CR>', desc = 'Find Help', nowait = true, remap = false },
  { '<leader>sk', '<cmd>Telescope keymaps<CR>', desc = 'Keymaps', nowait = true, remap = false },
  { '<leader>so', '<cmd>Telescope vim_options<CR>', desc = 'Vim Options', nowait = true, remap = false },
  { '<leader>sp', '<cmd>Telescope projects<CR>', desc = 'Projects', nowait = true, remap = false },
  { '<leader>sr', '<cmd>Telescope frecency workspace=CWD<CR>', desc = 'Frecency', nowait = true, remap = false },
  { '<leader>ss', '<cmd>Telescope smart_history<CR>', desc = 'Smart History(No UI)', nowait = true, remap = false },
  { '<leader>st', '<cmd>Telescope live_grep<CR>', desc = 'Text', nowait = true, remap = false },
  { '<leader>t', group = 'Trouble & Tab page', nowait = true, remap = false },
  { '<leader>tD', '<cmd>Trouble lsp_type_definitions<CR>', desc = 'Type Definitions', nowait = true, remap = false },
  { '<leader>tS', '<cmd>Trouble symbols<CR>', desc = 'Symbols', nowait = true, remap = false },
  {
    '<leader>tX',
    '<cmd>Trouble diagnostics toggle focus=true<CR>',
    desc = 'Diagnostics(Workspace)',
    nowait = true,
    remap = false,
  },
  {
    '<leader>ta',

    function()
      require('xxx.plugin-config.bufferline-rc').tab_filter_buf_add()
    end,
    desc = 'show current buffer in current tab page',
    nowait = true,
    remap = false,
  },
  { '<leader>tc', ':tabclose<CR>', desc = 'Close current tab page', nowait = true, remap = false },
  { '<leader>td', '<cmd>Trouble lsp_definitions<CR>', desc = 'Definitions', nowait = true, remap = false },
  {
    '<leader>tf',

    function()
      require('xxx.plugin-config.bufferline-rc').tab_filter_buf_toggle()
    end,
    desc = 'Tag filter buffer toggle',
    nowait = true,
    remap = false,
  },
  { '<leader>ti', '<cmd>Trouble lsp_implementations<CR>', desc = 'Implementations', nowait = true, remap = false },
  { '<leader>tl', '<cmd>Trouble loclist<CR>', desc = 'Loclist', nowait = true, remap = false },
  { '<leader>tq', '<cmd>Trouble quickfix<CR>', desc = 'Quickfix', nowait = true, remap = false },
  {
    '<leader>tr',
    function()
      require('xxx.plugin-config.bufferline-rc').tab_filter_buf_remove()
    end,
    desc = 'hidden current buffer in current tab page',
    nowait = true,
    remap = false,
  },
  {
    '<leader>ts',
    '<cmd>Trouble lsp_document_symbols results.win={type=split,position=right}<CR>',
    desc = 'Lsp Symbols',
    nowait = true,
    remap = false,
  },
  { '<leader>tt', '<cmd>Trouble telescope<CR>', desc = 'Telescope Results', nowait = true, remap = false },
  {
    '<leader>tx',
    '<cmd>Trouble diagnostics toggle focus=false filter.buf=0<CR>',
    desc = 'Diagnostics(Buffer)',
    nowait = true,
    remap = false,
  },
  { '<leader>w', '<cmd>w!<CR>', desc = 'Save', nowait = true, remap = false },
  { '<leader>z', '<cmd>Lazy<CR>', desc = 'Lazy', nowait = true, remap = false },
}

function M.setup()
  local which_key = require('which-key')
  M.opts.spec = M.spec
  which_key.setup(M.opts)
  -- which_key.register(M.n_mappings, M.n_opts)
end

return M
