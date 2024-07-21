local icons = require("xxx.core.icons")

local M = {}

---@type ibl.config
M.opts = {
  indent = {
    char = icons.ui.LineLeft,
    highlight = {
      "IndentBlanklineIndent1",
      "IndentBlanklineIndent2",
      "IndentBlanklineIndent3",
      "IndentBlanklineIndent4",
      "IndentBlanklineIndent5",
      "IndentBlanklineIndent6",
      "IndentBlanklineIndent7",
    },
    -- priority = 1,
  },
  scope = {
    show_start = false,
    show_end = false,
    show_exact_scope = true,
    highlight = {
      "IndentBlanklineScopeChar1",
      "IndentBlanklineScopeChar2",
      "IndentBlanklineScopeChar3",
      "IndentBlanklineScopeChar4",
      "IndentBlanklineScopeChar5",
      "IndentBlanklineScopeChar6",
      "IndentBlanklineScopeChar7",
    },
    -- priority = 1,
  },
  exclude = {
    filetypes = require("xxx.core.exclude-filetype").indent_blankline,
    buftypes = {
      "terminal",
      "nofile",
      "quickfix",
      "prompt",
    },
  },
}

local function set_highlight()
  local tbl = require("xxx.core.table")
  local colors = require("xxx.core.colors")

  local rb_colors = colors.rainbow()

  local bg = colors.universal().bg

  for i = 1, tbl.len(rb_colors) do
    local c_key = string.format("c%s", i)
    local color_org = rb_colors[c_key]
    local color = colors.compositeColors(0x4D, color_org, bg)
    vim.cmd(string.format("highlight IndentBlanklineIndent%s guifg=%s gui=nocombine", i, color))
    vim.cmd(string.format("highlight IndentBlanklineScopeChar%s guifg=%s gui=nocombine", i, color_org))
    -- vim.schedule(function()
    -- vim.notify(string.format('%s %s %s', i, color_org, color))
    -- end)
  end

  -- vim.cmd([[highlight IndentBlanklineContextChar guifg=#FFD700 gui=nocombine]])

  -- 要在listchars中添加 space:⋅, space相关的才会显示出来
  -- vim.cmd [[highlight IndentBlanklineSpaceChar guifg=#FFA500 gui=nocombine]]
  -- vim.cmd [[highlight IndentBlanklineContextSpaceChar guifg=#E3170D gui=nocombine ]]
end

---@param opts ibl.config
M.config = function(_, opts)
  -- vim.opt.list = true
  -- vim.opt.listchars:append "space:⋅"
  -- vim.opt.listchars:append "eol:↴"
  --   vim.print(M.opts)

  vim.g.rainbow_delimiters = { highlight = opts.scope.highlight }

  local hooks = require("ibl.hooks")
  hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    set_highlight()
  end)

  local indent_blankline = require("ibl")

  indent_blankline.setup(opts)
  hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
end

return {
  "lukas-reineke/indent-blankline.nvim",
  opts = M.opts,
  config = M.config,
  event = function()
    return { "User FileOpened" }
  end,
}
