local M = {}
local icons = require('xxx.core.icons')

local tbl = require('xxx.utils.table')

M.opts = {
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
    -- priority = 1,
  },
  scope = {
    show_start = false,
    show_end = false,
    show_exact_scope = true,
    highlight = {
      'IndentBlanklineContextChar1',
      'IndentBlanklineContextChar2',
      'IndentBlanklineContextChar3',
      'IndentBlanklineContextChar4',
      'IndentBlanklineContextChar5',
      'IndentBlanklineContextChar6',
      'IndentBlanklineContextChar7',
    },
    -- priority = 1,
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

  -- vim.cmd([[highlight IndentBlanklineContextChar guifg=#FFD700 gui=nocombine]])

  -- 要在listchars中添加 space:⋅, space相关的才会显示出来
  -- vim.cmd [[highlight IndentBlanklineSpaceChar guifg=#FFA500 gui=nocombine]]
  -- vim.cmd [[highlight IndentBlanklineContextSpaceChar guifg=#E3170D gui=nocombine ]]
end

function M.setup()
  -- vim.opt.list = true
  -- vim.opt.listchars:append "space:⋅"
  -- vim.opt.listchars:append "eol:↴"
  --   vim.print(M.opts)

  vim.g.rainbow_delimiters = { highlight = M.opts.scope.highlight }

  local hooks = require('ibl.hooks')
  hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    set_highlight()
  end)

  local indent_blankline = require('ibl')

  indent_blankline.setup(M.opts)
  hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
end

return M
