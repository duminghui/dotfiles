local Log = require('xxx.core.log')

-- 全局
require('xxx.core.globals')
require('xxx.config.config')

-- if vim.fn.has('win32') ~= 0 then
--   -- $XDG_DATA_HOME会影响rtp, 主要影响nvim-data的路径
--   -- \nvim-data\site

--   -- \nvim-data\site\after

--   -- \Local\nvim.x\nvim\init.lua

--   local init_path = debug.getinfo(1, 'S').source:sub(2)
--   -- \local\nvim.x\nvim
--   local nvim_base_dir = init_path:match('(.*[/\\])'):sub(0, -2)

--   if not vim.tbl_contains(vim.opt.rtp:get(), nvim_base_dir) then
--     vim.opt.rtp:append(nvim_base_dir)
--   end

--   local root_dir = nvim_base_dir:match('(.*[/\\])'):sub(1, -2)

--   -- 配置rpt
--   require('xxx.bootstrap'):init_rtp(root_dir, nvim_base_dir)
-- end

-- Log:set_level(Xvim.log.level)

require('xxx.config.options').load_defaults()

local keymappings = require('xxx.core.keymappings')
keymappings.load_defaults()

require('xxx.core.autocmds').load_defaults()

local plugin_loader = require('xxx.plugin-loader')
plugin_loader.init()

if not vim.g.vscode then
  require('xxx.core.commands').load_defaults()

  keymappings.load_others()

  local plugins = require('xxx.plugins')
  plugin_loader.load { plugins }

  -- local plugins = require('xxx.vscode.plugins')
  -- plugin_loader.load { plugins }

  -- --Lsp配置
  if Xvim.lsp.enable then
    require('xxx.lsp').setup()
  end
  Log:info('Starting xvim')
else
  local plugins = require('xxx.vscode.plugins')
  plugin_loader.load { plugins }

  require('xxx.vscode').setup()
  Log:info('Starting xvim in vscode')
end
