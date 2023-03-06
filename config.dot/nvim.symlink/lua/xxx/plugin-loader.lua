local plugin_loader = {}

local utils = require "xxx.utils"
local Log = require "xxx.core.log"

local plugins_dir = join_paths(vim.fn.stdpath "data", "lazy")

function plugin_loader.init()
  local lazy_install_dir = join_paths(vim.fn.stdpath "data", "lazy", "lazy.nvim")
  if not utils.is_directory(lazy_install_dir) then
    print("lazy.nvim downloading...")
    vim.fn.system {
      "git",
      "clone",
      "--branch=stable",
      "https://github.com/folke/lazy.nvim.git",
      lazy_install_dir,
    }
  end

  vim.opt.runtimepath:append(lazy_install_dir)
  vim.opt.runtimepath:append(join_paths(plugins_dir, "*"))

  pcall(function()
    -- set a custom path for lazy's cache
    local lazy_cache = require "lazy.core.cache"
    lazy_cache.path = join_paths(vim.fn.stdpath "cache", "lazy", "luac")
  end)
end

function plugin_loader.load(configurations)
  Log:debug "loading plugins configuration"
  local lazy_available, lazy = pcall(require, "lazy")
  if not lazy_available then
    Log:warn "skipping loading plugins until lazy.nvim is installed"
    return
  end

  -- remove plugins from rtp before loading lazy, so that all plugins won't be loaded on startup
  vim.opt.runtimepath:remove(join_paths(plugins_dir, "*"))

  local status_ok = xpcall(function()
    local opts = {
      install = {
        missing = true,
        colorscheme = { "tokyonight", "habamax" },
      },
      ui = {
        border = "rounded",
      },
      root = plugins_dir,
      git = {
        timeout = 120,
      },
      lockfile = join_paths(vim.fn.stdpath "data", "lazy-lock.json"),
      performance = {
        rtp = {
          reset = false,
        },
      },
      defaults = {
        lazy = false,
        version = nil,
      },
      readme = {
        root = join_paths(vim.fn.stdpath "state", "lazy", "readme"),
      },
    }

    lazy.setup(configurations, opts)
  end, debug.traceback)

  if not status_ok then
    Log:warn "problems detected while loading plugins' configurations"
    Log:trace(debug.traceback())
  end
end

return plugin_loader
