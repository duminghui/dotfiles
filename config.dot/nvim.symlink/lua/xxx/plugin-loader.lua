local plugin_loader = {}

local utils = require "xxx.utils"
local Log = require "xxx.core.log"
local in_headless = #vim.api.nvim_list_uis() == 0

local config_dir = vim.fn.stdpath("config")

-- we need to reuse this outside of init()
local compile_path = ""


function plugin_loader.init()

    local snapshot_path = join_paths(config_dir, "snapshots")
    local default_snapshot = join_paths(config_dir, "snapshots", "default.json")

    local package_root = join_paths(vim.fn.stdpath("data"), "site", "pack")
    local install_path = join_paths(package_root, "packer", "start", "packer.nvim")
    compile_path = join_paths(config_dir, "plugin", "packer_compiled.lua")

    local init_opts = {
        package_root = package_root,
        compile_path = compile_path,
        snapshot_path = snapshot_path,
        max_jobs = 33,
        log = { level = "warn" },
        git = { clone_timeout = 300 },
        display = {
            open_fn = function()
                return require("packer.util").float { border = "single" }
            end
        }
    }

    -- print("plugin-loader:", init_opts.package_root)
    -- print("plugin-loader:", install_path)
    -- print("plugin-loader:", compile_path)

    if in_headless then init_opts.display = nil end

    if not utils.is_directory(install_path) then
        vim.notify("Downloading packer.nvim to " .. install_path .. "... ", nil, { title = "Packer" })
        vim.fn.system {
            "git", "clone", "--depth", "1",
            "https://github.com/wbthomason/packer.nvim", install_path
        }
        vim.cmd "packadd packer.nvim"
        -- IMPORTANT: we only set this the very first time to avoid constantly triggering the rollback function
        -- https://github.com/wbthomason/packer.nvim/blob/c576ab3f1488ee86d60fd340d01ade08dcabd256/lua/packer.lua#L998-L995
        init_opts.snapshot = default_snapshot
    end

    local status_ok, packer = pcall(require, "packer")
    if status_ok then
        packer.on_complete = vim.schedule_wrap(function()
            Log:debug "Packer operation complete"
            vim.api.nvim_exec_autocmds("User", { pattern = "PackerComplete" })
        end)
        packer.init(init_opts)
    end
end

-- packer expects a space separated list
local function pcall_packer_command(cmd, kwargs)
    local status_ok, msg = pcall(function()
        require("packer")[cmd](unpack(kwargs or {}))
    end)
    if not status_ok then
        Log:warn(cmd .. " failed with: " .. vim.inspect(msg))
        Log:trace(vim.inspect(vim.fn.eval "v:errmsg"))
    end
end

function plugin_loader.cache_clear()
    if vim.fn.delete(compile_path) == 0 then
        Log:debug "delete packer_compiled.lua"
    end
end

function plugin_loader.compile()
    Log:debug "calling packer.compile()"
    vim.api.nvim_create_autocmd("User", {
        pattern = "PackerCompileDone",
        once = true,
        callback = function()
            if utils.is_file(compile_path) then
                Log:debug "finished compiling packer_compiled.lua"
                print("finished compiling packer_compiled.lua")
            end
        end,
    })
    pcall_packer_command "compile"
end

function plugin_loader.recompile()
    plugin_loader.cache_clear()
    plugin_loader.compile()
end

function plugin_loader.load(configurations)
    configurations = configurations or {}
    local plugins = configurations.plugins or {}
    -- Log:debug "loading plugins configuration"
    local packer_available, packer = pcall(require, "packer")
    if not packer_available then
        Log:warn "skipping loading plugins until Packer is installed"
        return
    end
    local status_ok, _ = xpcall(function()
        packer.reset()
        packer.startup(function(use)
            for _, plugin in ipairs(plugins) do
                use(plugin)
            end
        end)
    end, debug.traceback)
    if not status_ok then
        Log:warn "problems detected while loading plugins' configurations"
        Log:trace(debug.traceback())
    end
end

return plugin_loader
