local Rule = require('nvim-autopairs.rule')
local cond = require('nvim-autopairs.conds')
local M = {}

local disable_filetype = require('xxx.config.exclude-filetypes')

M.opts = {
  active = true,
  on_config_done = nil,
  ---@usage  modifies the function or method delimiter by filetypes
  map_char = {
    all = '(',
    tex = '{',
  },
  ---@usage check bracket in same line
  enable_check_bracket_line = false,
  ---@usage check treesitter
  check_ts = true,
  ts_config = {
    lua = { 'string', 'source' },
    javascript = { 'string', 'template_string' },
    java = false,
  },
  -- disable_filetype = {
  --     "TelescopePrompt",
  --     "spectre_panel",
  -- },

  disable_filetype = disable_filetype.autopairs,
  ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]], '%s+', ''),
  enable_moveright = true,
  ---@usage disable when recording or executing a macro
  disable_in_macro = false,
  ---@usage add bracket pairs after quote
  enable_afterquote = true,
  ---@usage map the <BS> key
  map_bs = true,
  ---@usage map <c-w> to delete a pair if possible
  map_c_w = false,
  ---@usage disable when insert after visual block mode
  disable_in_visualblock = false,
  ---@usage  change default fast_wrap
  fast_wrap = {
    map = '<M-e>',
    chars = { '{', '[', '(', '"', "'" },
    pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], '%s+', ''),
    offset = 0, -- Offset from pattern match
    end_key = '$',
    keys = 'qwertyuiopzxcvbnmasdfghjkl',
    check_comma = true,
    highlight = 'Search',
    highlight_grey = 'Comment',
  },
}

local function quote_creator(opt)
  local quote = function(...)
    local move_func = opt.enable_moveright and cond.move_right or cond.none
    local rule = Rule(...):with_move(move_func()):with_pair(cond.not_add_quote_inside_quote())

    if #opt.ignored_next_char > 1 then
      rule:with_pair(cond.not_after_regex(opt.ignored_next_char))
    end
    rule:use_undo(opt.break_undo)
    return rule
  end
  return quote
end

function M.setup()
  local autopairs = require('nvim-autopairs')

  autopairs.setup(M.opts)

  -- local ts_conds = require "nvim-autopairs.ts-conds"

  -- TODO: can these rules be safely added from "config.lua" ?
  -- press % => %% is only inside comment or string
  -- autopairs.add_rules {
  --     Rule("%", "%", "lua"):with_pair(ts_conds.is_ts_node { "string", "comment" }),
  --     Rule("$", "$", "lua"):with_pair(ts_conds.is_not_ts_node { "function" }),
  -- }

  autopairs.remove_rule("'")
  local quote = quote_creator(M.opts)
  autopairs.add_rules {
    quote("'", "'", '-rust'):with_pair(cond.not_before_regex('%w')):with_pair(cond.not_filetypes { 'lisp' }),
    quote("'", "'", 'rust'):with_pair(cond.not_before_regex('[%w<&]')):with_pair(cond.not_after_text('>')),
  }

  pcall(function()
    local function on_confirm_done(...)
      require('nvim-autopairs.completion.cmp').on_confirm_done()(...)
    end
    require('nvim-autopairs.completion.cmp')
    require('cmp').event:off('confirm_done', on_confirm_done)
    require('cmp').event:on('confirm_done', on_confirm_done)
  end)
end

return M
