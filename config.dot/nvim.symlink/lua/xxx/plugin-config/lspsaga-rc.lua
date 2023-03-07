local M = {}

local icons = require "xxx.core.icons"

M.opts = {
  preview = {
    lines_above = 0,
    lines_below = 10,
  },
  scroll_preview = {
    scroll_down = "<C-f>",
    scroll_up = "<C-b>",
  },
  request_timeout = 2000,

  -- :Lspsaga lsp_finder
  finder = {
    --percentage
    max_height = 0.5,
    force_max_height = false, --force window height to max_height
    keys = {
      jump_to = "p", -- finder peek window
      edit = { "o", "<CR>" },
      vsplit = "s",
      split = "i",
      tabe = "t",
      tabnew = "r",
      quit = { "q", "<ESC>" },
      close_in_preview = "<ESC>",
    },
  },

  -- :Lspsaga peek_definition
  definition = {
    edit = "<C-c>o",
    vsplit = "<C-c>v",
    split = "<C-c>i",
    tabe = "<C-c>t",
    quit = "q",
  },

  -- :Lspsaga goto_definition

  -- :Lspsaga code_action
  code_action = {
    num_shortcut = true,
    show_server_name = true,
    extend_gitsigns = true,
    keys = {
      -- string | table type
      quit = "q",
      exec = "<CR>",
    },
  },

  -- :Lspsaga Lightbulb
  lightbulb = {
    enable = true,
    enable_in_insert = true,
    sign = false,
    sign_priority = 20,
    virtual_text = true,
  },
  -- :Lspsaga hover_doc
  -- Pressing K once to run :Lspsaga hover_doc
  -- Pressing K again to enter the hover window
  -- Pressing q to quit

  -- :Lspsaga diagnostic_jump_next
  -- <C-w>w to enter the floating window
  -- Press g to go to the action line and see the code action preview.
  -- Press o to execute the action
  diagnostic = {
    on_insert = true, -- true it works like the emacs helix show diagnostic in right but in line
    on_insert_follow = true, -- ture whill follow current line. false will on top right
    insert_winblend = 9, -- default is 0, whne it's to 100 whill completely transparent. the color whill changed a little light. 0 will use the NormalFloat group. it will link to Normal by Lspsaga
    show_virt_line = true, -- show a line when using diagnostic
    show_code_action = true,
    show_source = true,
    jump_num_shortcut = true,
    --1 is max
    max_width = 0.7, -- max width for diagnostic jump window. percentage
    custom_fix = nil,
    custom_msg = nil,
    text_hl_follow = false, -- true that can define DiagnosticText to custom the diagnotic text color
    border_follow = true, -- the border highlight will follow the diagnostic type, if false it will use the highlight DiagnosticBorder
    keys = {
      exec_action = "o",
      quit = "q",
      go_action = "g", -- quickly jump to line where actions need to be taken in the diagnostics floating
    },
  },

  -- :Lspsage show_diagnostics
  -- show_line_diagnostics, show_buf_diagnostics, show_cursor_diagnostics
  -- use <C-w>w jump into and use <CR> jump to diagnostic position

  -- :Lspsaga rename
  -- :Lspsaga rename ++project
  rename = {
    quit = "<C-c>",
    exec = "<CR>",
    mark = "x", -- is used for the ++project argument, It is used to mark the files which you want to rename the hovered word in.
    confirm = "<CR>", -- After you have marked the files, press this key to execute the rename
    in_select = true,
  },

  -- :Lspsgag outline

  outline = {
    win_position = "right",
    win_with = "",
    win_width = 30,
    show_detail = true,
    auto_preview = true,
    auto_refresh = true,
    auto_close = true,
    custom_sort = nil,
    keys = {
      jump = "o",
      expand_collapse = "u",
      quit = "q",
    },
  },

  -- :Lspsaga incoming_calls / outgoing_calls
  callhierarchy = {
    show_detail = false,
    keys = {
      edit = "e",
      vsplit = "s",
      split = "i",
      tabe = "t",
      jump = "o",
      quit = "q",
      expand_collapse = "u",
    },
  },

  -- :Lspsaga symbols in winbar
  symbol_in_winbar = {
    enable = true,
    separator = "  ",
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
    title = true,
    -- Border type can be single, double, rounded, solid, shadow.
    border = "single",
    winblend = 9,
    expand = "",
    collapse = "",
    code_action = "💡",
    incoming = " ",
    outgoing = " ",
    hover = " ",
    kind = {},
  },

  -- Options with default value
  -- "single" | "double" | "rounded" | "bold" | "plus"
  border_style = "bold",
  --the range of 0 for fully opaque window (disabled) to 100 for fully
  --transparent background. Values between 0-30 are typically most useful.
  saga_winblend = 9,
  -- when cursor in saga window you config these to move
  move_in_saga = { prev = "<C-p>", next = "<C-n>" },
  -- Error, Warn, Info, Hint
  -- use emoji like
  -- { "🙀", "😿", "😾", "😺" }
  -- or
  -- { "😡", "😥", "😤", "😐" }
  -- and diagnostic_header can be a function type
  -- must return a string and when diagnostic_header
  -- is function type it will have a param `entry`
  -- entry is a table type has these filed
  -- { bufnr, code, col, end_col, end_lnum, lnum, message, severity, source }
  -- diagnostic_header = { " ", " ", " ", "ﴞ " },
  diagnostic_header = {
    icons.diagnostics.BoldError .. " ",
    icons.diagnostics.BoldWarning .. " ",
    icons.diagnostics.BoldInformation .. " ",
    icons.diagnostics.BoldHint .. " ",
  },
  -- preview lines of lsp_finder and definition preview
  max_preview_lines = 10,
  -- use emoji lightbulb in default
  code_action_icon = "XXXXX",
  -- if true can press number to execute the codeaction in codeaction window
  code_action_num_shortcut = true,
  -- same as nvim-lightbulb but async
  -- finder icons
  finder_icons = {
    def = "  ",
    ref = "諭 ",
    link = "  ",
  },
  -- finder do lsp request timeout
  -- if your project big enough or your server very slow
  -- you may need to increase this value
  finder_request_timeout = 1500,
  finder_action_keys = {
    open = "o",
    vsplit = "s",
    split = "i",
    tabe = "t",
    quit = "q",
  },
  code_action_keys = {
    quit = "q",
    exec = "<CR>",
  },
  definition_action_keys = {
    edit = "<C-c>o",
    vsplit = "<C-c>v",
    split = "<C-c>i",
    tabe = "<C-c>t",
    quit = "q",
  },
  rename_action_quit = "<C-c>",
  rename_in_select = true,
  -- show symbols in winbar must nightly
  -- in_custom mean use lspsaga api to get symbols
  -- and set it to your custom winbar or some winbar plugins.
  -- if in_cusomt = true you must set in_enable to false
  -- show outline
  show_outline = {
    win_position = "right",
    --set special filetype win that outline window split.like NvimTree neotree
    -- defx, db_ui
    win_with = "",
    win_width = 30,
    auto_enter = true,
    auto_preview = true,
    virt_text = "┃",
    jump_key = "o",
    -- auto refresh when change buffer
    auto_refresh = true,
  },
  -- custom lsp kind
  -- usage { Field = 'color code'} or {Field = {your icon, your color code}}
  custom_kind = {},
  -- if you don't use nvim-lspconfig you must pass your server name and
  -- the related filetypes into this table
  -- like server_filetype_map = { metals = { "sbt", "scala" } }
  server_filetype_map = {},
}

-- Example:
local function get_file_name(include_path)
  local file_name = require("lspsaga.symbolwinbar").get_file_name()
  if vim.fn.bufname "%" == "" then
    return ""
  end
  if include_path == false then
    return file_name
  end
  -- Else if include path: ./lsp/saga.lua -> lsp > saga.lua
  local sep = vim.loop.os_uname().sysname == "Windows" and "\\" or "/"
  local path_list = vim.split(string.gsub(vim.fn.expand "%:~:.:h", "%%", ""), sep)
  local file_path = ""
  for _, cur in ipairs(path_list) do
    file_path = (cur == "." or cur == "~") and "" or file_path .. cur .. " " .. "%#LspSagaWinbarSep#>%*" .. " %*"
  end
  return file_path .. file_name
end

local filetype_exclude = require("xxx.config.exclude-filetypes").lspsaga

local function config_winbar_or_statusline()
  if vim.api.nvim_win_get_config(0).zindex or vim.tbl_contains(filetype_exclude, vim.bo.filetype) then
    vim.wo.winbar = ""
  else
    local ok, lspsaga = pcall(require, "lspsaga.symbolwinbar")
    local sym
    -- if ok then sym = lspsaga.get_symbol_node() end
    if ok then
      sym = lspsaga:get_winbar()
    end
    local win_val = ""
    win_val = get_file_name(true) -- set to true to include path
    if sym ~= nil then
      win_val = win_val .. sym
    end
    vim.wo.winbar = win_val
    -- if work in statusline
    -- vim.wo.stl = win_val
  end
end

local function set_breadcrumbs_autocmd()
  local events = { "BufEnter", "BufWinEnter", "CursorMoved" }

  vim.api.nvim_create_autocmd(events, {
    pattern = "*",
    callback = function()
      config_winbar_or_statusline()
    end,
  })

  vim.api.nvim_create_autocmd("User", {
    pattern = "LspsagaUpdateSymbol",
    callback = function()
      config_winbar_or_statusline()
    end,
  })
end

function M.setup()
  local lspsaga = require "lspsaga"

  -- if vim.fn.has "nvim-0.8" ~= 1 then
  --   M.opts.symbol_in_winbar.in_custom = false
  --   M.opts.symbol_in_winbar.enable = false
  -- end

  lspsaga.setup(M.opts)
  -- if M.opts.symbol_in_winbar.in_custom then
  --   set_breadcrumbs_autocmd()
  -- end
end

return M
