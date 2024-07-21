local M = {}

local fmt = string.format
local vscode = require('vscode')

local keymap_opts = { noremap = true, silent = false }

local function cmd(c)
  return fmt('<CMD>%s<CR>', c)
end

local function vscode_action(vs_action)
  return cmd(fmt('lua require"vscode".action("%s")', vs_action))
end

local function cursor_move(to)
  return function()
    local count = vim.api.nvim_get_vvar('count')
    local args = {
      to = to,
      by = 'wrappedLine',
      value = count,
    }
    if count > 0 then
      args = {
        to = to,
        value = count,
      }
    end
    vscode.action('cursorMove', { args = args })
  end
end

local function manageEditorSize(wh, opt)
  local vs_action = ''
  if wh == 'w' then
    if opt == 'increase' then
      vs_action = 'workbench.action.increaseViewWidth'
    else
      vs_action = 'workbench.action.decreaseViewWidth'
    end
  else
    if opt == 'decrease' then
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
      vscode.call(vs_action)
    end
  end
end

M.keymappings = {
  ['<leader>/'] = { 'n', cmd('nohl') },
  ['k'] = { 'n', cursor_move('up') },
  ['j'] = { 'n', cursor_move('down') },
  ['gc'] = { { 'n', 'x', 'o' }, '<Plug>VSCodeCommentary' },
  ['gcc'] = { 'n', '<Plug>VSCodeCommentaryLine' },

  ['<leader><leader>a'] = { 'n', '<cmd>HopAnywhere<CR>' },
  ['<leader><leader>s'] = { 'n', cmd('HopChar1') },
  ['<leader><leader>t'] = { 'n', cmd('HopChar2') },
  ['<leader><leader>w'] = { 'n', cmd('HopWord') },
  ['<leader><leader>l'] = { 'n', cmd('HopLineStart') },
  -- ['<leader><leader>s'] = { 'n', cmd('Pounce') },

  ['<leader>sf'] = { 'n', vscode_action('workbench.action.quickOpen') },
  -- 无输入框
  -- ['<leader>bf'] = { 'n', vscode('workbench.action.quickOpenPreviousRecentlyUsedEditorInGroup') },
  -- 有输入框
  -- ['<leader>bf'] = { 'n', vscode('workbench.action.showEditorsInActiveGroup') },
  ['<leader>bf'] = { 'n', vscode_action('workbench.action.showAllEditors') },
  -- ['<leader>bf'] = { 'n', vscode('workbench.action.showAllEditorsByMostRecentlyUsed') },

  -- 从终端跳到编辑器
  -- 需要在vscode中配置keybindings
  -- {
  --   "command": "vscode-neovim.send",
  --   // the key sequence to activate the binding
  --   "key": ", b b",
  --   // don't activate during insert mode
  --   "when": "terminalFocus",
  --   // the input to send to Neovim
  --   "args": ",bb"
  -- }
  ['<leader>bb'] = { 'n', vscode_action('workbench.action.focusActiveEditorGroup') },

  -- 跳到终端
  ['<leader>tt'] = { 'n', vscode_action('workbench.action.terminal.toggleTerminal') },
  ['<leader>tn'] = { 'n', vscode_action('workbench.action.terminal.new') },

  -- window movement
  ['<C-h>'] = { 'n', vscode_action('workbench.action.navigateLeft') },
  ['<C-j>'] = { 'n', vscode_action('workbench.action.navigateDown') },
  ['<C-k>'] = { 'n', vscode_action('workbench.action.navigateUp') },
  ['<C-l>'] = { 'n', vscode_action('workbench.action.navigateRight') },

  -- not work
  -- ['<leader>b'] = { 'n', '<C-w>-', { noremap = false } },
  ['<A-h>'] = { 'n', manageEditorSize('w', 'decrease') },
  ['<A-j>'] = { 'n', manageEditorSize('h', 'increase') },
  ['<A-k>'] = { 'n', manageEditorSize('h', 'decrease') },
  ['<A-l>'] = { 'n', manageEditorSize('w', 'increase') },

  ['<leader>w'] = { 'n', vscode_action('workbench.action.files.save') },
  ['<leader>c'] = { 'n', vscode_action('workbench.action.closeActiveEditor') },
  -- ['<leader>e'] = { 'n', vscode('workbench.action.focusSideBar') },
  ['<leader>e'] = { 'n', vscode_action('workbench.view.explorer') },

  -- ['[d'] = { 'n', vscode('editor.action.marker.prevInFiles') },
  -- [']d'] = { 'n', vscode('editor.action.marker.nextInFiles') },
  ['[d'] = { 'n', vscode_action('editor.action.marker.prev') },
  [']d'] = { 'n', vscode_action('editor.action.marker.next') },

  ['[b'] = { 'n', vscode_action('workbench.action.previousEditor') },
  [']b'] = { 'n', vscode_action('workbench.action.nextEditor') },

  ['gr'] = { 'n', vscode_action('editor.action.referenceSearch.trigger') },
  ['gI'] = { 'n', vscode_action('editor.action.peekImplementation') },
  ['gnr'] = { 'n', vscode_action('editor.action.rename') },
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
  -- 不显示光标所在列
  vim.opt.cursorcolumn = false

  M.set_keymappings()
end
return M
