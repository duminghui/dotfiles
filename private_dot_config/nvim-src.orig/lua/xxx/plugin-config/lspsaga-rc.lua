local colors = require('xxx.core.colors').universal()
local icons = require('xxx.core.icons')
local M = {}

-- https://github.com/nvimdev/lspsaga.nvim/blob/main/lua/lspsaga/lspkind.lua
-- local kind = {
--   ['File'] = { '󰈔 ', 'Tag' },
--   ['Module'] = { ' ', 'Exception' },
--   ['Namespace'] = { '󰅩 ', 'Include' },
--   ['Package'] = { '󰏓 ', 'Label' },
--   ['Class'] = { '󰙅 ', 'Include' },
--   ['Method'] = { '󰡱 ', 'Function' },
--   ['Property'] = { '󰖷 ', '@property' },
--   ['Field'] = { ' ', '@field' },
--   ['Constructor'] = { '󰆦 ', '@constructor' },
--   ['Enum'] = { ' ', '@number' },
--   ['Interface'] = { ' ', 'Type' },
--   ['Function'] = { '󰡱 ', 'Function' },
--   ['Variable'] = { '󰀫 ', '@variable' },
--   ['Constant'] = { '󰏿 ', 'Constant' },
--   ['String'] = { '󰀬 ', 'String' },
--   ['Number'] = { '󰎠 ', 'Number' },
--   ['Boolean'] = { '󰔡 ', 'Boolean' },
--   ['Array'] = { '󰅨 ', 'Type' },
--   ['Object'] = { '󰅩 ', 'Type' },
--   ['Key'] = { '󱀍 ', '' },
--   ['Null'] = { '󰟢 ', 'Constant' },
--   ['EnumMember'] = { ' ', 'Number' },
--   ['Struct'] = { '󰠱 ', 'Type' },
--   ['Event'] = { '󰉁 ', 'Constant' },
--   ['Operator'] = { ' ', 'Operator' },
--   ['TypeParameter'] = { ' ', 'Type' },
--   -- -- ccls
--   ['TypeAlias'] = { ' ', 'Type' },
--   ['Parameter'] = { ' ', '@parameter' },
--   ['StaticMethod'] = { ' ', 'Function' },
--   ['Macro'] = { '󰬔 ', 'Macro' },
--   -- -- for completion sb microsoft!!!
--   ['Text'] = { '󰊄', 'String' },
--   ['Snippet'] = { '󰗀 ', '@variable' },
--   ['Folder'] = { '󰝰 ', 'SagaWinbarFolder' },
--   ['Unit'] = { '󰉺 ', 'Number' },
--   ['Value'] = { '󰀫 ', '@variable' },
-- }
M.opts = function()
  -- name: highlight
  local kind_hl = {
    File = 'Tag',
    Module = 'Exception',
    Namespace = 'Include',
    Package = 'Label',
    Class = 'Include',
    Method = 'Function',
    Property = '@property',
    Field = '@field',
    Constructor = '@constructor',
    Enum = '@number',
    Interface = 'Type',
    Function = 'Function',
    Variable = '@variable',
    Constant = 'Constant',
    String = 'String',
    Number = 'Number',
    Boolean = 'Boolean',
    Array = 'Type',
    Object = 'Type',
    Key = 'Constant',
    Null = 'Constant',
    EnumMember = 'Number',
    Struct = 'Type',
    Event = 'Constant',
    Operator = 'Operator',
    TypeParameter = 'Type',
    -- -- ccls
    TypeAlias = 'Type',
    Parameter = '@parameter',
    StaticMethod = 'Function',
    Macro = 'Macro',
    -- -- for completion sb microsoft!!!
    Text = 'String',
    Snippet = '@variable',
    Folder = 'SagaWinbarFolder',
    Unit = 'Number',
    Value = '@variable',
  }

  local kind = {}

  for k, hl in pairs(kind_hl) do
    local icon = icons.findKind(k, ' ')
    kind[k] = { icon, hl }
  end

  return {
    -- :Lspsaga symbols in winbar
    symbol_in_winbar = {
      enable = true,
      separator = '  ',
      hide_keyword = true, -- will hide some keywords and temporary variables to make the symbols look cleaner
      show_file = true,
      folder_level = 2, -- only works when show_file is ture.
      color_mode = true, -- false: only icons will have color.
      delay = 300,
    },

    -- :Lspsaga incoming_calls / outgoing_calls
    callhierarchy = {
      layout = 'float',
      keys = {
        edit = 'e',
        vsplit = 's',
        split = 'i',
        tabe = 't',
        quit = 'q',
        shuttle = '[w',
        toggle_or_req = 'u',
        close = '<C-c>k',
      },
    },

    -- :Lspsaga code_action
    code_action = {
      num_shortcut = true,
      show_server_name = true,
      extend_gitsigns = false,
      keys = {
        -- string | table type
        quit = 'q',
        exec = '<CR>',
      },
    },

    -- :Lspsaga peek_definition :Lspsaga peek_type_definition
    definition = {
      widht = 0.6,
      height = 0.5,
      keys = {
        edit = '<C-c>o',
        vsplit = '<C-c>v',
        split = '<C-c>i',
        tabe = '<C-c>t',
        quit = 'q',
        close = '<C-c>k',
      },
    },

    -- :Lspsaga diagnostic_jump_next and :Lspsaga diagnostic_jump_prev
    -- <C-w>w to enter the floating window
    -- Press g to go to the action line and see the code action preview.
    -- Press o to execute the action
    diagnostic = {
      show_code_action = true,
      jump_num_shortcut = true,
      max_width = 0.7,
      max_height = 0.6,
      text_hl_follow = true,
      border_follow = true,
      extend_relatedInformation = false,
      show_layout = 'float',
      show_normal_height = 10,
      max_show_width = 0.9,
      max_show_height = 0.6,
      diagnostic_only_current = false,
      keys = {
        exec_action = 'o',
        quit = 'q',
        expand_or_jump = '<CR>',
        quit_in_show = { 'q', '<ESC>' },
      },
    },

    -- :Lspsaga finder
    finder = {
      max_height = 0.5,
      left_width = 0.3,
      right_width = 0.3,
      default = 'ref+imp',
      methods = {},
      layout = 'float',
      filter = {},
      silent = false,
      keys = {
        shuttle = '[w',
        toggle_or_open = 'o',
        vsplit = 's',
        split = 'i',
        tabe = 't',
        tabnew = 'r',
        quit = 'q',
        close = '<C-c>k',
      },
    },

    -- :Lspsaga term_toggle

    -- :Lspsaga hover_doc
    -- Pressing K once to run :Lspsaga hover_doc
    -- Pressing K again to enter the hover window
    -- Pressing q to quit
    -- HoverNormal hover window normal highlight
    -- HoverBorder hover window border highlight
    hover = {
      max_width = 0.7,
      max_height = 0.6,
      open_link = 'gx',
      open_browser = '!chrome',
    },

    -- :Lspsaga finder imp
    implement = {
      enable = true,
      sign = true,
      virtual_text = true,
      priority = 100,
    },

    lightbulb = {
      enable = true,
      sign = false,
      virtual_text = true,
      debounce = 10,
      sign_priority = 40,
    },

    -- :Lspsgag outline

    outline = {
      win_position = 'right',
      win_width = 30,
      auto_preview = true,
      detail = true,
      auto_close = true,
      close_after_jump = false,
      layout = 'normal',
      max_height = 0.5,
      left_width = 0.3,

      keys = {
        toggle_or_jump = 'o',
        quit = 'q',
        jump = 'e',
      },
    },

    -- :Lspsaga rename
    -- :Lspsaga rename ++project
    rename = {
      in_select = true,
      auto_save = false,
      project_max_width = 0.5,
      project_max_height = 0.5,
      keys = {
        quit = '<C-k>',
        exec = '<CR>',
        mark = 'x', -- select or cancel select item in project_replace float window
      },
    },

    ui = {
      -- Border type can be single, double, rounded, solid, shadow.
      border = 'single',
      devicon = true,
      title = true,
      -- expand = '⊞',
      -- collapse = '⊟',
      expand = icons.ui.ChevronShortRight, --'',
      collapse = icons.ui.ChevronShortDown, --'',
      code_action = '💡',
      actionfix = ' ',
      lines = { '┗', '┣', '┃', '━', '┏' },
      imp_sign = '󰳛 ',
      -- incoming = '󰏷 ',
      -- outgoing = '󰏻 ',
      -- hover = '󰒊 ', --
      kind = kind,
    },

    beacon = {
      enable = true,
      frequency = 7,
    },

    scroll_preview = {
      scroll_down = '<C-f>',
      scroll_up = '<C-b>',
    },
  }
end

function M.setup()
  local lspsaga = require('lspsaga')

  lspsaga.setup(M.opts())

  vim.api.nvim_set_hl(0, 'SagaWinbarFolder', { fg = colors.darkgold })
end

return M
