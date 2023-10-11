local M = {}
local icons = require('xxx.core.icons')

local tbl = require('xxx.utils.table')

M.opts = {
  -- char = icons.ui.LineLeft,
  -- context_char = icons.ui.LineLeft,
  -- char_highlight_list = {
  --   'IndentBlanklineIndent1',
  --   'IndentBlanklineIndent2',
  --   'IndentBlanklineIndent3',
  --   'IndentBlanklineIndent4',
  --   'IndentBlanklineIndent5',
  --   'IndentBlanklineIndent6',
  --   'IndentBlanklineIndent7',
  -- },
  -- context_highlight_list = {
  --   'IndentBlanklineContextChar1',
  --   'IndentBlanklineContextChar2',
  --   'IndentBlanklineContextChar3',
  --   'IndentBlanklineContextChar4',
  --   'IndentBlanklineContextChar5',
  --   'IndentBlanklineContextChar6',
  --   'IndentBlanklineContextChar7',
  -- },
  -- show_trailing_blankline_indent = false,
  -- show_first_indent_level = true,
  -- use_treesitter = true,
  -- use_treesitter_scope = false,
  -- show_current_context = true,
  -- show_current_context_start = false,
  indent = {
    char = icons.ui.LineLeft,
    highlight = {
      'IndentBlanklineIndent1',
      'IndentBlanklineIndent2',
      'IndentBlanklineIndent3',
      'IndentBlanklineIndent4',
      'IndentBlanklineIndent5',
      'IndentBlanklineIndent6',
      'IndentBlanklineIndent7',
    },
  },
  scope = {
    char = icons.ui.LineLeft,
    show_start = false,
    highlight = {
      'IndentBlanklineContextChar1',
      'IndentBlanklineContextChar2',
      'IndentBlanklineContextChar3',
      'IndentBlanklineContextChar4',
      'IndentBlanklineContextChar5',
      'IndentBlanklineContextChar6',
      'IndentBlanklineContextChar7',
    },
  },
  exclude = {
    filetypes = require('xxx.config.exclude-filetypes').indent_blankline,
    buftypes = {
      'terminal',
      'nofile',
      'quickfix',
      'prompt',
    },
  },
}

local function set_highlight()
  -- vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
  -- vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
  -- vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
  -- vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
  -- vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
  -- vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]
  local colors = require('xxx.core.colors')

  local rb_colors = colors.rainbow()

  local bg = colors.universal().bg

  for i = 1, tbl.len(rb_colors) do
    local c_key = string.format('c%s', i)
    local color_org = rb_colors[c_key]
    local color = colors.compositeColors(0x4D, color_org, bg)
    vim.cmd(string.format('highlight IndentBlanklineIndent%s guifg=%s gui=nocombine', i, color))
    vim.cmd(string.format('highlight IndentBlanklineContextChar%s guifg=%s gui=nocombine', i, color_org))
    -- vim.schedule(function()
    -- vim.notify(string.format('%s %s %s', i, color_org, color))
    -- end)
  end

  vim.cmd([[highlight IndentBlanklineContextChar guifg=#FFD700 gui=nocombine]])

  -- 要在listchars中添加 space:⋅, space相关的才会显示出来
  -- vim.cmd [[highlight IndentBlanklineSpaceChar guifg=#FFA500 gui=nocombine]]
  -- vim.cmd [[highlight IndentBlanklineContextSpaceChar guifg=#E3170D gui=nocombine ]]
end

function M.setup()
  -- vim.opt.list = true
  -- vim.opt.listchars:append "space:⋅"
  -- vim.opt.listchars:append "eol:↴"
  --   vim.pretty_print(M.opts)

  local hooks = require('ibl.hooks')
  hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    set_highlight()
  end)

  local indent_blankline = require('ibl')

  indent_blankline.setup(M.opts)
  -- indent_blankline.setup()
end

return M
