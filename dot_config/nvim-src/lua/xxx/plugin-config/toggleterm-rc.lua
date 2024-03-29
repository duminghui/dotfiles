local Log = require('xxx.core.log')
local M = {}

M.opts = {
  -- size can be a number or function which is passed the current terminal
  size = 20,
  open_mapping = [[<c-\>]],
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 2, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  persist_size = false,
  -- direction = 'vertical' | 'horizontal' | 'window' | 'float',
  direction = 'float',
  close_on_exit = true, -- close the terminal window when the process exits
  shell = vim.o.shell, -- change the default shell
  -- This field is only relevant if direction is set to 'float'
  float_opts = {
    -- The border key is *almost* the same as 'nvim_win_open'
    -- see :h nvim_win_open for details on borders however
    -- the 'curved' border is a custom border type
    -- not natively supported but implemented in this plugin.
    -- border = 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
    border = 'curved',
    -- width = <value>,
    -- height = <value>,
    winblend = 0,
    highlights = {
      border = 'Normal',
      background = 'Normal',
    },
  },
  -- Add executables on the config.lua
  -- { exec, keymap, name}
  -- lvim.builtin.terminal.execs = {{}} to overwrite
  -- lvim.builtin.terminal.execs[#lvim.builtin.terminal.execs+1] = {"gdb", "tg", "GNU Debugger"}
  -- TODO: pls add mappings in which key and refactor this
  execs = {
    { vim.o.shell, '<M-1>', 'Horizontal Terminal', 'horizontal', 10 },
    { vim.o.shell, '<M-2>', 'Vertical Terminal', 'vertical', 60 },
    { vim.o.shell, '<M-3>', 'Float Terminal', 'float', nil },
  },
}

function M.setup()
  local toggleterm = require('toggleterm')
  toggleterm.setup(M.opts)
  for i, exec in pairs(M.opts.execs) do
    local opts = {
      cmd = exec[1],
      keymap = exec[2],
      label = exec[3],
      -- NOTE: unable to consistently bind id/count <= 9, see #2146
      count = i + 100,
      direction = exec[4] or M.opts.direction,
      size = exec[5] or M.opts.size,
    }
    M.add_exec(opts)
  end
end

function M.add_exec(opts)
  local binary = opts.cmd:match('(%S+)')
  if vim.fn.executable(binary) ~= 1 then
    Log:debug('Skipping configuring executable ' .. binary .. '. Please make sure it is installed properly.')
  end
  vim.keymap.set({ 'n', 't' }, opts.keymap, function()
    M._exec_toggle { cmd = opts.cmd, count = opts.count, direction = opts.direction, size = opts.size }
  end, { desc = opts.label, noremap = true, silent = true })
end

function M._exec_toggle(opts)
  local Terminal = require('toggleterm.terminal').Terminal
  local term = Terminal:new { cmd = opts.cmd, count = opts.count, direction = opts.direction, size = opts.size }
  term:toggle(opts.size, opts.direction)
end

function M.toggle_log_view(logfile)
  local log_viewer = Xvim.log.viewer.cmd
  if vim.fn.executable(log_viewer) ~= 1 then
    log_viewer = 'less +F'
  end
  Log:debug('attempting to open: ' .. logfile)
  log_viewer = log_viewer .. ' ' .. logfile
  local term_opts = vim.tbl_deep_extend('force', M.opts, {
    cmd = log_viewer,
    open_mapping = Xvim.log.viewer.layout_config.open_mapping,
    direction = Xvim.log.viewer.layout_config.direction,
    -- TODO: this might not be working as expected
    size = Xvim.log.viewer.layout_config.size,
    float_opts = Xvim.log.viewer.layout_config.float_opts,
  })
  local Terminal = require('toggleterm.terminal').Terminal
  local log_view = Terminal:new(term_opts)
  log_view:toggle()
end

function M.lazygit_toggle()
  local Terminal = require('toggleterm.terminal').Terminal
  local lazygit = Terminal:new {
    cmd = 'lazygit',
    hidden = true,
    direction = 'float',
    float_opts = {
      border = 'none',
      width = 100000,
      height = 100000,
    },
    on_open = function(_)
      vim.cmd('startinsert!')
    end,
    on_close = function(_) end,
    count = 99,
  }
  lazygit:toggle()
end

return M
