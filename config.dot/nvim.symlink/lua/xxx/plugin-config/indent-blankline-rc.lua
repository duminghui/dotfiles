local M = {}
local icons = require("xxx.core.icons")

M.opts = {
  char = icons.ui.LineLeft,
  context_char = icons.ui.LineLeft,
  char_highlight_list = {
    "IndentBlanklineIndent1",
    "IndentBlanklineIndent2",
    "IndentBlanklineIndent3",
    "IndentBlanklineIndent4",
    "IndentBlanklineIndent5",
    "IndentBlanklineIndent6",
  },
  show_trailing_blankline_indent = false,
  show_first_indent_level = false,
  use_treesitter = true,
  use_treesitter_scope = true,
  show_current_context = true,
  show_current_context_start = false,
  filetype_exclude = require("xxx.config.exclude-filetypes").indent_blankline,
  -- filetype_exclude = {
  --     "lspinfo",
  --     "packer",
  --     "checkhealth",
  --     "help",
  --     "man",
  --     "",
  --     "alpha",
  --     "dashboard",
  --     "gitcommit",
  --     "mason",
  --     "neo-tree",
  --     "NvimTree",
  --     "Startify",
  --     "TelescopePrompt",
  --     "TelescopeResults",
  --     "terminal",
  --     "Trouble",
  --     "undotree",
  --     "OverseerForm",
  -- },
  buftype_exclude = {
    "terminal",
    "nofile",
    "quickfix",
    "prompt",
  },
}

local function set_highlight()
  -- vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
  -- vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
  -- vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
  -- vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
  -- vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
  -- vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]
  local colors = require("xxx.core.colors")

  for i = 1, 6 do
    local c_key = string.format("c%s", i)
    vim.cmd(string.format("highlight IndentBlanklineIndent%s guifg=%s gui=nocombine", i, colors[c_key]))

  end


  vim.cmd [[highlight IndentBlanklineContextChar guifg=#FFD700 gui=nocombine]]

  -- 要在listchars中添加 space:⋅, space相关的才会显示出来
  -- vim.cmd [[highlight IndentBlanklineSpaceChar guifg=#FFA500 gui=nocombine]]
  -- vim.cmd [[highlight IndentBlanklineContextSpaceChar guifg=#E3170D gui=nocombine ]]
end

function M.setup()
  -- vim.opt.list = true
  -- vim.opt.listchars:append "space:⋅"
  -- vim.opt.listchars:append "eol:↴"
  --   vim.pretty_print(M.opts)
  local status_ok, indent_blankline = safe_require("indent_blankline")
  if not status_ok then
    return
  end

  indent_blankline.setup(M.opts)

  set_highlight()
end

return M
