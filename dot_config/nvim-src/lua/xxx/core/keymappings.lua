local M = {}
-- local Log = require('xxx.core.log')

local generic_opts_any = { noremap = true, silent = true }
local silent_opts = { noremap = true, silent = false }

local generic_opts = {
  insert_mode = generic_opts_any,
  normal_mode = generic_opts_any,
  visual_mode = generic_opts_any,
  visual_block_mode = generic_opts_any,
  command_mode = generic_opts_any,
  term_mode = { silent = true },
}

local mode_adapters = {
  insert_mode = 'i',
  normal_mode = 'n',
  term_mode = 't',
  visual_mode = 'v',
  visual_block_mode = 'x',
  command_mode = 'c',
}

local defaults = {
  normal_mode = {
    -- don't yank with x
    -- ["x"]  = { '"_x', silent_opts },
    -- Increment/decrement
    ['+'] = { '<C-a>' },
    ['-'] = { '<C-x>' },
    ['j'] = { 'gj', silent_opts },
    ['gj'] = { 'j', silent_opts },
    ['k'] = { 'gk', silent_opts },
    ['gk'] = { 'k', silent_opts },
    ['zl'] = { 'zL', silent_opts },
    ['zh'] = { 'zH', silent_opts },
    -- ["Y"] = { "y$", silent_opts }, -- neovim buildin
  },
}

---@class Keys
---@field insert_mode table
---@field normal_mode table
---@field terminal_mode table
---@field visual_mode table
---@field visual_block_mode table
---@field command_mode table
local default_others = {
  insert_mode = {
    -- ["hlhl"] = " <C-U><Esc>",
    -- Move current line / block with Alt-j/k ala vscode.
    -- ['<A-j>'] = '<Esc>:m .+1<CR>==gi',
    -- Move current line / block with Alt-j/k ala vscode.
    -- ['<A-k>'] = '<Esc>:m .-2<CR>==gi',
    -- navigation
    ['<A-k>'] = '<C-\\><C-N><C-w>k',
    ['<A-j>'] = '<C-\\><C-N><C-w>j',
    ['<A-h>'] = '<C-\\><C-N><C-w>h',
    ['<A-l>'] = '<C-\\><C-N><C-w>l',
  },
  normal_mode = {

    -- Better window movement
    ['<C-h>'] = '<C-w>h',
    ['<C-j>'] = '<C-w>j',
    ['<C-k>'] = '<C-w>k',
    ['<C-l>'] = '<C-w>l',

    -- Resize with arrows
    ['<A-k>'] = ':resize -1<CR>',
    ['<A-j>'] = ':resize +1<CR>',
    ['<A-h>'] = ':vertical resize +1<CR>',
    ['<A-l>'] = ':vertical resize -1<CR>',
    -- Move current line / block with Alt-j/k a la vscode.
    -- ['<A-j>'] = ':m .+1<CR>==',
    -- ['<A-k>'] = ':m .-2<CR>==',
    -- QuickFix
    -- ["]q"] = ":cnext<CR>",
    -- ["[q"] = ":cprev<CR>",
    ['<C-q>'] = ':call QuickFixToggle()<CR>',
  },
  term_mode = {
    -- Terminal window navigation
    -- ['<C-h>'] = '<C-\\><C-N><C-w>h',
    -- ['<C-j>'] = '<C-\\><C-N><C-w>j',
    -- ['<C-k>'] = '<C-\\><C-N><C-w>k',
    -- ['<C-l>'] = '<C-\\><C-N><C-w>l',
  },
  visual_mode = {
    -- Better indenting
    ['<'] = '<gv',
    ['>'] = '>gv',
    -- ["p"] = '"0p',
    -- ["P"] = '"0P',
  },
  visual_block_mode = {
    -- Move selected line / block of text in visual mode
    -- ['K'] = ":move '<-2<CR>gv-gv",
    -- ['J'] = ":move '>+1<CR>gv-gv",
    -- Move current line / block with Alt-j/k ala vscode.
    -- ['<A-j>'] = ":m '>+1<CR>gv-gv",
    -- ['<A-k>'] = ":m '<-2<CR>gv-gv",
  },
  command_mode = {
    -- navigate tab completion with <c-j> and <c-k>
    -- runs conditionally
    ['<C-j>'] = { 'pumvisible() ? "\\<C-n>" : "\\<C-j>"', { expr = true, noremap = true } },
    ['<C-k>'] = { 'pumvisible() ? "\\<C-p>" : "\\<C-k>"', { expr = true, noremap = true } },
    -- cmap w!! w !sudo tee % >/dev/null
    -- ["w!!"] = { 'w !sudo tee % >/dev/null', generic_opts_any },
  },
}

-- if vim.fn.has('mac') == 1 then
--   default_others.normal_mode['<A-Up>'] = default_others.normal_mode['<C-Up>']
--   default_others.normal_mode['<A-Down>'] = default_others.normal_mode['<C-Down>']
--   default_others.normal_mode['<A-Left>'] = default_others.normal_mode['<C-Left>']
--   default_others.normal_mode['<A-Right>'] = default_others.normal_mode['<C-Right>']
--   Log:debug('Activated mac keymappings')
-- end

-- Unsets all keybindings defined in keymaps
-- @param keymaps The table of key mappings containing a list per mode (normal_mode, insert_mode, ..)
function M.clear(keymaps)
  local default = vim.tbl_deep_extend('force', defaults, default_others)
  for mode, mappings in pairs(keymaps) do
    local translated_mode = mode_adapters[mode] or mode
    for key, _ in pairs(mappings) do
      -- some plugins may override default bindings that the user hasn't manually overridden
      if default[mode][key] ~= nil or (default[translated_mode] ~= nil and default[translated_mode][key] ~= nil) then
        pcall(vim.keymap.del, translated_mode, key)
      end
    end
  end
end

-- Set key mappings individually
-- @param mode The keymap mode, can be one of the keys of mode_adapters
-- @param key The key of keymap
-- @param val Can be form as a mapping or tuple of mapping and user defined opt
function M.set_keymaps(mode, key, val)
  local opt = generic_opts[mode] or generic_opts_any
  if type(val) == 'table' then
    opt = val[2]
    val = val[1]
  end
  if val then
    vim.keymap.set(mode, key, val, opt)
  else
    pcall(vim.api.nvim_del_keymap, mode, key)
  end
end

-- Load key mappings for a given mode
-- @param mode The keymap mode, can be one of the keys of mode_adapters
-- @param keymaps The list of key mappings
function M.load_mode(mode, keymaps)
  mode = mode_adapters[mode] or mode
  for k, v in pairs(keymaps) do
    M.set_keymaps(mode, k, v)
  end
end

-- Load key mappings for all provided modes
-- @param keymaps A list of key mappings for each mode
function M.load(keymaps)
  keymaps = keymaps or {}
  for mode, mapping in pairs(keymaps) do
    M.load_mode(mode, mapping)
  end
end

-- Load the default keymappings
function M.load_defaults()
  M.load(defaults)
end

function M.load_others()
  M.load(default_others)
end

return M
