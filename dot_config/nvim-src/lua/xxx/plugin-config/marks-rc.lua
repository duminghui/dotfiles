local M = {}
M.opts = {
  -- whether to map keybinds or not. default true
  default_mappings = true,
  -- which builtin marks to show. default {}
  builtin_marks = { '.', '<', '>', '^' },
  -- whether movements cycle back to the beginning/end of buffer. default true
  cyclic = true,
  -- whether the shada file is updated after modifying uppercase marks. default false
  force_write_shada = false,
  -- how often (in ms) to redraw signs/recompute mark positions.
  -- higher values will have better performance but may cause visual lag,
  -- while lower values may cause performance penalties. default 150.
  refresh_interval = 250,
  -- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
  -- marks, and bookmarks.
  -- can be either a table with all/none of the keys, or a single number, in which case
  -- the priority applies to all marks.
  -- default 10.
  sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
  -- disables mark tracking for specific filetypes. default {}
  excluded_filetypes = require('xxx.config.exclude-filetypes').marks,
  -- excluded_filetypes = {
  --     'null-ls-info',
  --     'TelescopePrompt',
  --     'rnvimr',
  --     'toggleterm',
  --     'dap-repl',
  --     'dap-float',
  --     'Term',
  --     'lazygit',
  --     'lspinfo',
  --     'translator',
  --     'translatorborder',
  --     'translator_history',
  --     'glowpreview',
  --     'help',
  --     'zsh',
  --     'NvimTree',
  --     "sagacodeaction",
  --     "lspsagaoutline",
  --     "alpha",
  --     "dapui_scopes",
  --     "dapui_stacks",
  --     "dapui_breakpoints",
  --     "dapui_watches",
  --     "DressingInput",
  --     "DressingSelect",
  --     "floaterm",
  --     "minimap",
  --     "qfs",
  --     "tsplayground",
  --     "guihua",
  --     "OverseerForm",
  --     ''
  -- },
}

function M.setup()
  local marks = require 'marks'
  marks.setup(M.opts)
  vim.cmd [[highlight link MarkSignNumHL NONE]]
end

return M
