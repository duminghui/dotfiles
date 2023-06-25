local M = {}

local fmt = string.format

local keymap_opts = { noremap = true, silent = false }

local function cmd(c)
  return fmt('<cmd>%s<CR>', c)
end

local function vscode(vs_action)
  return cmd(fmt("call VSCodeNotify('%s')", vs_action))
end

local function manageEditorSize(wh, to)
  local vs_action = ''
  if wh == 'w' then
    if to == 'increase' then
      vs_action = 'workbench.action.increaseViewWidth'
    else
      vs_action = 'workbench.action.decreaseViewWidth'
    end
  else
    if to == 'decrease' then
      vs_action = 'workbench.action.decreaseViewHeight'
    else
      vs_action = 'workbench.action.increaseViewHeight'
    end
  end
  return function()
    local count = vim.api.nvim_get_vvar('count')
    if count == 0 then
      count = 1
    end
    for _ = 1, count, 1 do
      vim.fn['VSCodeNotify'](vs_action)
    end
  end
end

M.keymappings = {
  ['<leader>/'] = { 'n', cmd('nohl') },
  ['gc'] = { { 'n', 'x', 'o' }, '<Plug>VSCodeCommentary' },
  ['gcc'] = { 'n', '<Plug>VSCodeCommentaryLine' },

  -- ['<leader><leader>a'] = { 'n', '<cmd>HopAnywhere<CR>' },
  ['<leader><leader>s'] = { 'n', cmd('HopChar1') },
  ['<leader><leader>t'] = { 'n', cmd('HopChar2') },
  ['<leader><leader>w'] = { 'n', cmd('HopWord') },
  ['<leader><leader>l'] = { 'n', cmd('HopLineStart') },

  ['<leader>sf'] = { 'n', vscode('workbench.action.quickOpen') },

  -- window movement
  ['<C-h>'] = { 'n', vscode('workbench.action.focusLeftGroup') },
  ['<C-j>'] = { 'n', vscode('workbench.action.focusBelowGroup') },
  ['<C-k>'] = { 'n', vscode('workbench.action.focusAboveGroup') },
  ['<C-l>'] = { 'n', vscode('workbench.action.focusRightGroup') },

  -- not work
  -- ['<leader>b'] = { 'n', '<C-w>-', { noremap = false } },
  ['<A-h>'] = { 'n', manageEditorSize('w', 'decrease') },
  ['<A-j>'] = { 'n', manageEditorSize('h', 'increase') },
  ['<A-k>'] = { 'n', manageEditorSize('h', 'decrease') },
  ['<A-l>'] = { 'n', manageEditorSize('w', 'increase') },

  ['<leader>w'] = { 'n', vscode('workbench.action.files.save') },
  ['<leader>c'] = { 'n', vscode('workbench.action.closeActiveEditor') },
  ['<leader>e'] = { 'n', vscode('workbench.action.focusSideBar') },

  ['[d'] = { 'n', vscode('editor.action.marker.prevInFiles') },
  [']d'] = { 'n', vscode('editor.action.marker.nextInFiles') },

  ['[b'] = { 'n', vscode('workbench.action.previousEditor') },
  [']b'] = { 'n', vscode('workbench.action.nextEditor') },

  ['gr'] = { 'n', vscode('editor.action.referenceSearch.trigger') },
  ['gI'] = { 'n', vscode('editor.action.peekImplementation') },
  ['gnr'] = { 'n', vscode('editor.action.rename') },
}

function M.set_keymappings()
  for key, val in pairs(M.keymappings) do
    local modes = val[1]
    local map = val[2]
    local opts = vim.tbl_deep_extend('keep', val[3] or {}, keymap_opts)
    vim.keymap.set(modes, key, map, opts)
  end
end

function M.setup()
  -- 不显竖的光标所在行
  vim.opt.cursorcolumn = false

  M.set_keymappings()
end
return M
