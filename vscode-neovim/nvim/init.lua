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

require "xxx.core.globals"

-- 全局
require "xxx.config.config"

-- 配置rpt
require("xxx.bootstrap"):init_rtp(root_dir, nvim_base_dir)

local Log = require("xxx.core.log")

require("xxx.config.options").load_defaults()
require("xxx.core.autocmds").load_defaults()

require("xxx.plugin-loader").init()


--插件配置
local plugins = require "xxx.plugins"
require("xxx.plugin-loader").load({ plugins = plugins })


Log:debug "Starting XVim"

local keymap_opts = {
    noremap = true, silent = false
}
-- workbench.action.files.save
vim.keymap.set("n", "<leader>w", "<cmd>call VSCodeNotify('workbench.action.files.save')<CR>", keymap_opts)
vim.keymap.set("n", "<leader>/", "<cmd>nohl<CR>", keymap_opts)
vim.keymap.set("x", "gc", "<Plug>VSCodeCommentary", keymap_opts)
vim.keymap.set("n", "gc", "<Plug>VSCodeCommentary", keymap_opts)
vim.keymap.set("o", "gc", "<Plug>VSCodeCommentary", keymap_opts)
vim.keymap.set("n", "gcc", "<Plug>VSCodeCommentaryLine", keymap_opts)

-- lsp
vim.keymap.set("n", "gr", "<Cmd>call VSCodeNotify('editor.action.referenceSearch.trigger')<CR>", keymap_opts)
vim.keymap.set("n", "gI", "<Cmd>call VSCodeNotify('editor.action.peekImplementation')<CR>", keymap_opts)
vim.keymap.set("n", "gnr", "<Cmd>call VSCodeNotify('editor.action.rename')<CR>", keymap_opts)

-- vim.keymap.set("n", "<leader><leader>a", "<cmd>HopAnywhere<CR>", keymap_opts)
vim.keymap.set("n", "<leader><leader>s", "<cmd>HopChar1<CR>", keymap_opts)
vim.keymap.set("n", "<leader><leader>t", "<cmd>HopChar2<CR>", keymap_opts)
vim.keymap.set("n", "<leader><leader>w", "<cmd>HopWord<CR>", keymap_opts)
vim.keymap.set("n", "<leader><leader>l", "<cmd>HopLineStart<CR>", keymap_opts)
