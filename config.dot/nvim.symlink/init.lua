local in_headless = #vim.api.nvim_list_uis() == 0
local Log = require("xxx.core.log")

-- if in_headless then
    -- Log:debug("in headless")
-- end

local function use_impatient()
    Log:debug(string.format("in_headless: %s", in_headless))
    if not in_headless then
        Log:debug("Use impatient")

        _G.PLENARY_DEBUG = false

        _G.__luacache_config = {
            chunks = {
                enable = true,
                -- path = vim.fn.stdpath('cache') .. '/luacache_chunks',
            },
            modpaths = {
                enable = true,
                -- path = vim.fn.stdpath('cache') .. '/luacache_modpaths',
            }
        }

        local present, impatient = pcall(require, "impatient")

        if present then
            impatient.enable_profile()
        else
            Log:warn("install impatient")
        end
    end

end

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

if vim.fn.has("win32") ~= 0 then
    -- 配置rpt
    require("xxx.bootstrap"):init_rtp(root_dir, nvim_base_dir)
end

use_impatient()

local Log = require("xxx.core.log")

-- local config = require("xxx.config")

require("xxx.config.options").load_defaults()
require("xxx.core.keymappings").load_defaults()
require("xxx.core.autocmds").load_defaults()

require("xxx.plugin-loader").init()

-- config.load()

--插件配置
local plugins = require "xxx.plugins"
require("xxx.plugin-loader").load { plugins = plugins }

Log:debug "Starting XVim"

local commands = require "xxx.core.commands"
commands.load_defaults()

-- --Lsp配置
require("xxx.lsp").setup()

-- local ProgressNotify = require("xxx.core.progress-notify")
-- local notif = ProgressNotify:new()
-- vim.defer_fn(function()
--     notif:start("this is a test", "This is a test")
--     vim.defer_fn(function()
--         notif:finish("This is end", "warn", "XX")
--     end, 2000)
-- end, 1000)
--
