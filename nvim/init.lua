local Log = require "xxx.core.log"

-- 全局
require "xxx.config.config"
require "xxx.core.globals"

if vim.fn.has "win32" ~= 0 then
  -- $XDG_DATA_HOME会影响rtp, 主要影响nvim-data的路径
  -- \nvim-data\site

  -- \nvim-data\site\after

  -- \Local\nvim.x\nvim\init.lua

  local init_path = debug.getinfo(1, "S").source:sub(2)
  -- \local\nvim.x\nvim
  local nvim_base_dir = init_path:match("(.*[/\\])"):sub(0, -2)

  if not vim.tbl_contains(vim.opt.rtp:get(), nvim_base_dir) then
    vim.opt.rtp:append(nvim_base_dir)
  end

  -- \local\nvim.x
  local root_dir = nvim_base_dir:match("(.*[/\\])"):sub(1, -2)

  -- 配置rpt
  require("xxx.bootstrap"):init_rtp(root_dir, nvim_base_dir)
end

require("xxx.config.options").load_defaults()
require("xxx.core.keymappings").load_defaults()
require("xxx.core.autocmds").load_defaults()
require("xxx.core.commands").load_defaults()

local plugin_loader = require "xxx.plugin-loader"

plugin_loader.init()

--插件配置
local plugins = require "xxx.plugins"

plugin_loader.load { plugins }

Log:debug "Starting XVim"

if not vim.g.vscode then
  -- --Lsp配置
  require("xxx.lsp").setup()
else
  -- 不显竖的光标所在行
  vim.opt.cursorcolumn = false
  require("xxx.vscode").setup()
end

-- local ProgressNotify = require("xxx.core.progress-notify")
-- local notif = ProgressNotify:new()
-- vim.defer_fn(function()
--     notif:start("this is a test", "This is a test")
--     vim.defer_fn(function()
--         notif:finish("This is end", "warn", "XX")
--     end, 2000)
-- end, 1000)
--

-- local nvim_lsp = require "lspconfig"

-- local on_attach = function(client) end

-- nvim_lsp.rust_analyzer.setup {
--   on_attach = on_attach,
--   settings = {
--     ["rust-analyzer"] = {
--       imports = {
--         granularity = {
--           group = "module",
--         },
--         prefix = "self",
--       },
--       cargo = {
--         buildScripts = {
--           enable = true,
--         },
--       },
--       procMacro = {
--         enable = true,
--       },
--       linkedProjects = {},
--     },
--   },
-- }
