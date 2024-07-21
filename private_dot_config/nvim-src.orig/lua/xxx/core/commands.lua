local M = {}

vim.cmd([[
  function! QuickFixToggle()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
      copen
    else
      cclose
    endif
  endfunction
]])

-- local cmd_bdelete = 'bdelete'
local cmd_bdelete = 'Bdelete'

M.defaults = {
  {
    name = 'BufferKill',
    fn = function()
      -- require('xxx.core.buffers').buf_kill('bd')
      require('xxx.core.buffers').buf_kill(cmd_bdelete)
    end,
  },
  {
    name = 'PrintRtp',
    fn = function()
      local content_provider = function(popup)
        local text = require('xxx.interface.text')
        local content = {}
        for k, v in pairs(vim.opt.rtp:get()) do
          local path = string.format('%3d: %s', k, v)
          table.insert(content, path)
        end
        return text.align_left(popup, content, 0.0)
      end
      local Popup = require('xxx.interface.popup'):new {
        win_opts = { number = false },
        buf_opts = { modifiable = false, filetype = 'RuntimePath' },
      }
      Popup:display(content_provider)
    end,
  },
}

function M.load(collection)
  local common_opts = { force = true }
  for _, cmd in pairs(collection) do
    local opts = vim.tbl_deep_extend('force', common_opts, cmd.opts or {})
    vim.api.nvim_create_user_command(cmd.name, cmd.fn, opts)
  end
end

function M.load_defaults()
  M.load(M.defaults)
end

return M
