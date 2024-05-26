local plugin_loader = {}

local utils = require('xxx.utils')
local Log = require('xxx.core.log')

local plugins_dir = join_paths(vim.fn.stdpath('data'), 'lazy')

function plugin_loader.init()
  local lazy_install_dir = join_paths(plugins_dir, 'lazy.nvim')
  if not utils.is_directory(lazy_install_dir) then
    print('lazy.nvim downloading...')
    vim.fn.system {
      'git',
      'clone',
      '--branch=stable',
      'https://github.com/folke/lazy.nvim.git',
      lazy_install_dir,
    }
  end

  vim.opt.runtimepath:append(lazy_install_dir)
  vim.opt.runtimepath:append(join_paths(plugins_dir, '*'))

  pcall(function()
    -- set a custom path for lazy's cache
    local lazy_cache = require('lazy.core.cache')
    lazy_cache.path = join_paths(vim.fn.stdpath('cache'), 'lazy', 'luac')
  end)
end

function plugin_loader.load(configurations)
  Log:info('Loading plugins configuration')
  local lazy_available, lazy = pcall(require, 'lazy')
  if not lazy_available then
    Log:warn('skipping loading plugins until lazy.nvim is installed')
    return
  end

  -- remove plugins from rtp before loading lazy, so that all plugins won't be loaded on startup
  vim.opt.runtimepath:remove(join_paths(plugins_dir, '*'))

  local status_ok = xpcall(function()
    local opts = {
      root = plugins_dir,
      defaults = {
        lazy = false,
        version = nil,
      },
      lockfile = join_paths(vim.fn.stdpath('data'), 'lazy-lock.json'),
      concurrency = 20,
      git = {
        timeout = 120,
      },
      install = {
        missing = true,
        colorscheme = { 'tokyonight', 'habamax' },
      },
      ui = {
        size = { width = 0.8, height = 0.7 },
        -- border = 'single',
        border = 'none',
        -- The backdrop opacity. 0 is fully opaque, 100 is fully transparent.
        backdrop = 100,
        icons = {
          cmd = '',
          config = '󰒓',
          event = '󰉁',
          ft = '󰈔',
          init = '󰒓',
          import = '󱚀',
          keys = '󰌌',
          lazy = '󰒲',
          loaded = '●',
          not_loaded = '○',
          plugin = '󰏓',
          runtime = '',
          source = '󰗀',
          start = '󰐊',
          -- task = '✔',
          task = '󰄭 ',
          list = {
            '●',
            '󰜴',
            '󰓎',
            '󰍴',
          },
        },
        throttle = 20,
      },
      performance = {
        rtp = {
          -- 这个如果设置成true, 'folke/neodev.nvim' 这个就加载不到rtp中, lsp diagnostic 不会提示.
          -- 但是在false的情况下, lua treesitter 会出错, 可能和插件的加载顺序有关, false时,neovim本身的路径在前面
          reset = true, -- default true
          paths = {
            -- 解决当reset为true时, 不自动加载lsp使用的ftplugin
            join_paths(vim.fn.stdpath('data'), 'site', 'after'),
          },
        },
      },
      readme = {
        root = join_paths(vim.fn.stdpath('state'), 'lazy', 'readme'),
      },
    }

    lazy.setup(configurations, opts)
  end, debug.traceback)

  if not status_ok then
    Log:warn("problems detected while loading plugins' configurations")
    Log:trace(debug.traceback())
  end
end

return plugin_loader
