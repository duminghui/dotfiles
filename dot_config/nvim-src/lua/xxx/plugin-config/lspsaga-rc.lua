local colors = require('xxx.core.colors').universal()
local icons = require('xxx.core.icons')
local M = {}

M.opts = {
  preview = {
    lines_above = 0,
    lines_below = 10,
  },
  scroll_preview = {
    scroll_down = '<C-f>',
    scroll_up = '<C-b>',
  },
  request_timeout = 2000,

  -- :Lspsaga lsp_finder
  finder = {
    --percentage
    max_height = 0.5,
    min_width = 30,
    force_max_height = false, --force window height to max_height
    keys = {
      jump_to = 'p', -- finder peek window
      expand_or_jump = 'o',
      vsplit = 's',
      split = 'i',
      tabe = 't',
      tabnew = 'r',
      quit = { 'q', '<ESC>' },
      close_in_preview = '<ESC>',
    },
  },

  -- :Lspsaga peek_definition
  definition = {
    edit = '<C-c>o',
    vsplit = '<C-c>v',
    split = '<C-c>i',
    tabe = '<C-c>t',
    quit = 'q',
  },

  -- :Lspsaga goto_definition

  -- :Lspsaga code_action
  code_action = {
    num_shortcut = true,
    show_server_name = true,
    extend_gitsigns = true,
    keys = {
      -- string | table type
      quit = 'q',
      exec = '<CR>',
    },
  },

  -- :Lspsaga Lightbulb
  lightbulb = {
    enable = true,
    enable_in_insert = false,
    sign = false,
    sign_priority = 20,
    virtual_text = true,
  },
  -- :Lspsaga hover_doc
  -- Pressing K once to run :Lspsaga hover_doc
  -- Pressing K again to enter the hover window
  -- Pressing q to quit
  hover = {
    max_width = 0.6,
    open_link = 'gx',
    open_browser = '!chrome',
  },

  -- :Lspsaga diagnostic_jump_next
  -- <C-w>w to enter the floating window
  -- Press g to go to the action line and see the code action preview.
  -- Press o to execute the action
  diagnostic = {
    on_insert = false, -- true it works like the emacs helix show diagnostic in right but in line
    on_insert_follow = true, -- ture whill follow current line. false will on top right
    insert_winblend = Xvim.winblend, -- default is 0, whne it's to 100 whill completely transparent. the color whill changed a little light. 0 will use the NormalFloat group. it will link to Normal by Lspsaga
    show_code_action = true,
    show_source = true,
    jump_num_shortcut = true,
    --1 is max
    max_width = 0.7, -- max width for diagnostic jump window. percentage
    max_height = 0.6,
    max_show_width = 0.9,
    max_show_height = 0.6,
    text_hl_follow = true, -- true that can define DiagnosticText to custom the diagnotic text color
    border_follow = true, -- the border highlight will follow the diagnostic type, if false it will use the highlight DiagnosticBorder
    extend_relatedInformation = false,
    keys = {
      exec_action = 'o',
      quit = 'q',
      expand_or_jump = '<CR>',
      quit_in_show = { 'q', '<ESC>' },
    },
  },

  -- :Lspsage show_diagnostics
  -- show_line_diagnostics, show_buf_diagnostics, show_cursor_diagnostics
  -- use <C-w>w jump into and use <CR> jump to diagnostic position

  -- :Lspsaga rename
  -- :Lspsaga rename ++project
  rename = {
    quit = '<C-c>',
    exec = '<CR>',
    mark = 'x', -- is used for the ++project argument, It is used to mark the files which you want to rename the hovered word in.
    confirm = '<CR>', -- After you have marked the files, press this key to execute the rename
    in_select = true,
  },

  -- :Lspsgag outline

  outline = {
    win_position = 'right',
    win_with = '',
    win_width = 30,
    preview_width = 0.4,
    show_detail = true,
    auto_preview = true,
    auto_refresh = true,
    auto_close = true,
    custom_sort = nil,
    keys = {
      expand_or_jump = 'o',
      quit = 'q',
    },
  },

  -- :Lspsaga incoming_calls / outgoing_calls
  callhierarchy = {
    show_detail = false,
    keys = {
      edit = 'e',
      vsplit = 's',
      split = 'i',
      tabe = 't',
      jump = 'o',
      quit = 'q',
      expand_collapse = 'u',
    },
  },

  -- :Lspsaga symbols in winbar
  symbol_in_winbar = {
    enable = true,
    separator = '  ',
    ignore_patterns = {}, -- table type when filename matched the pattern will ignore render symbols. if show_file is ture. the file name will still set
    hide_keyword = true, -- will hide some keywords and temporary variables to make the symbols look cleaner
    show_file = true,
    folder_level = 2, -- only works when show_file is ture.
    respect_root = false, -- will respect the LSP's root, If this is ture, Lspsaga will ignore the folder_level option. If no LSP client is being used, Lspsaga will fall back to using folder level.
    color_mode = true, -- false: only icons will have color.
  },

  -- :Lspsaga term_toggle

  -- :Lspsaga beacon
  -- after jump from float window there will show beacon to remind you where the cursor is.
  beacon = {
    enable = true,
    frequency = 7,
  },

  -- :Lspsage UI
  ui = {
    -- This option only works in Neovim 0.9
    title = false,
    -- Border type can be single, double, rounded, solid, shadow.
    border = 'single',
    winblend = Xvim.winblend,
    expand = icons.ui.ChevronShortRight, --'',
    collapse = icons.ui.ChevronShortDown, --'',
    code_action = '💡',
    incoming = '󰏷 ',
    outgoing = '󰏻 ',
    hover = '󰒊 ', --
    kind = {
      -- [1] = { 'File', ' ', 'Tag' },
      ['File'] = { '󰈔 ', 'Tag' },
      -- [2] = { 'Module', ' ','Exception' },
      -- [3] = { 'Namespace', ' ', 'Include' },
      ['Namespace'] = { '󰅩 ', 'Include' },
      -- [4] = { 'Package', ' ', 'Label' },
      ['Package'] = { '󰏓 ', 'Label' },
      -- [5] = { 'Class', ' ', 'Include' },
      ['Class'] = { '󰙅 ', 'Include' },
      -- [6] = { 'Method', ' ', 'Function' },
      ['Method'] = { '󰡱 ', 'Function' },
      -- [7] = { 'Property', ' ', '@property' },
      ['Property'] = { '󰖷 ', '@property' },
      -- [8] = { 'Field', ' ', '@field' },
      -- [9] = { 'Constructor', ' ', '@constructor' },
      ['Constructor'] = { '󰆦 ', '@constructor' },
      -- [10] = { 'Enum', ' ', '@number' },
      -- [11] = { 'Interface', ' ', 'Type' },
      -- [12] = { 'Function', ' ', 'Function' },
      -- ['Function'] = { 'ƒ ', 'Function' },
      ['Function'] = { '󰡱 ', 'Function' },
      -- [13] = { 'Variable', ' ', '@variable' },
      ['Variable'] = { '󰫧 ', '@variable' },
      -- [14] = { 'Constant', ' ', 'Constant' },
      -- [15] = { 'String', '󰅳 ', 'String' },
      ['String'] = { '󰀬 ', 'String' },
      -- [16] = { 'Number', ' ', 'Number' },
      -- [17] = { 'Boolean', ' ', 'Boolean' },
      -- [18] = { 'Array', '󰅨 ', 'Type' },
      -- [19] = { 'Object', ' ', 'Type' },
      ['Object'] = { '󰅩 ', 'Type' },
      -- [20] = { 'Key', ' ', '' },
      ['Key'] = { '󱀍 ', '' },
      -- [21] = { 'Null', '󰟢 ', 'Constant' },
      -- [22] = { 'EnumMember', ' ', 'Number' },
      -- [23] = { 'Struct', ' ', 'Type' },
      ['Struct'] = { '󰠱 ', 'Type' },
      -- [24] = { 'Event', ' ', 'Constant' },
      ['Event'] = { '󰉁 ', 'Constant' },
      -- [25] = { 'Operator', ' ', 'Operator' },
      -- [26] = { 'TypeParameter', ' ', 'Type' },
      ['TypeParameter'] = { ' ', 'Type' },
      -- -- ccls
      -- [252] = { 'TypeAlias', ' ', 'Type' },
      -- [253] = { 'Parameter', ' ', '@parameter' },
      -- [254] = { 'StaticMethod', ' ', 'Function' },
      ['StaticMethod'] = { ' ', 'Function' },
      -- [255] = { 'Macro', ' ', 'Macro' },
      ['Macro'] = { '󰬔 ', 'Macro' },
      -- -- for completion sb microsoft!!!
      -- [300] = { 'Text', '', 'String' },
      ['Text'] = { '󰊄', 'String' },
      -- [301] = { 'Snippet', ' ', '@variable' },
      ['Snippet'] = { '󰗀 ', '@variable' },
      -- [302] = { 'Folder', ' ', 'Title' },
      ['Folder'] = { '󰝰 ', 'Title' },
      -- [303] = { 'Unit', ' ', 'Number' },
      ['Unit'] = { '󰉺 ', 'Number' },
      -- [304] = { 'Value', ' ', '@variable' },
    },
  },
}

function M.setup()
  local lspsaga = require('lspsaga')

  lspsaga.setup(M.opts)

  vim.api.nvim_set_hl(0, 'SagaWinbarFolder', { fg = colors.darkgold })
end

return M
