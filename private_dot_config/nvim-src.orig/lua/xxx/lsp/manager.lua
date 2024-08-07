local M = {}

local Log = require('xxx.core.log')
local ProgressNotify = require('xxx.core.progress-notify')
local icons = require('xxx.core.icons')
local lsp_utils = require('xxx.lsp.utils')
local fmt = string.format
local is_windows = vim.uv.os_uname().version:match('Windows')

local function resolve_mason_config(server_name)
  local found, mason_config = pcall(require, 'mason-lspconfig.server_configurations.' .. server_name)
  if not found then
    Log:debug(fmt('mason configuration not found for %s', server_name))
    return {}
  end
  local server_mapping = require('mason-lspconfig.mappings.server')
  local path = require('mason-core.path')
  local pkg_name = server_mapping.lspconfig_to_package[server_name]
  local install_dir = path.package_prefix(pkg_name)
  local conf = mason_config(install_dir)
  if is_windows and conf.cmd and conf.cmd[1] then
    local exepath = vim.fn.exepath(conf.cmd[1])
    if exepath ~= '' then
      conf.cmd[1] = exepath
    end
  end
  Log:debug(fmt('resolved mason configuration for %s, got %s', server_name, vim.inspect(conf)))
  return conf or {}
end

---Resolve the configuration for a server by merging with the default config
---@param server_name string
---@vararg any config table [optional]
---@return table
local function resolve_config(server_name, ...)
  local lsp = require('xxx.lsp')
  local defaults = lsp.get_common_opts()

  local module_path = 'xxx/lsp/providers/' .. server_name
  local has_custom_provider, custom_config = pcall(require, module_path)
  if has_custom_provider then
    Log:debug('# Using custom configuration for requested server: ' .. server_name)
    defaults = vim.tbl_deep_extend('force', defaults, custom_config)
  else
    if custom_config:match("module '" .. module_path .. "' not found:") then
      Log:debug(fmt("custom configuration not found for: %s, module: '%s'", server_name, module_path))
    else
      Log:error(
        fmt("custom configuration load error for: %s, module: '%s', %s", server_name, module_path, custom_config)
      )
    end
  end

  defaults = vim.tbl_deep_extend('force', ..., defaults)
  return defaults
end

-- manually start the server and don't wait for the usual filetype trigger from lspconfig
local function buf_try_add(server_name, bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()
  require('lspconfig')[server_name].manager:try_add_wrapper(bufnr)
end

-- check if the manager autocomd has already been configured since some servers can take a while to initialize
-- this helps guarding against a data-race condition where a server can get configured twice
-- which seems to occur only when attaching to single-files
local function client_is_configured(server_name, ft)
  ft = ft or vim.bo.filetype
  local active_autocmds = vim.api.nvim_get_autocmds { event = 'FileType', pattern = ft }
  for _, result in ipairs(active_autocmds) do
    if result.desc ~= nil and result.desc:match('server ' .. server_name .. ' ') then
      Log:debug(fmt('[%q] is already configured', server_name))
      return true
    end
  end
  return false
end

local function launch_server(server_name, config)
  local ok, result = pcall(function()
    local command = config.cmd
      or (function()
        local default_config = require('lspconfig.server_configurations.' .. server_name).default_config
        return default_config.cmd
      end)()
    if type(command) == 'table' and type(command[1]) == 'string' and vim.fn.executable(command[1]) ~= 1 then
      Log:warn(fmt('[%q] is either not installed, missing from PATH, or not executable.', server_name))
      return
    end
    require('lspconfig')[server_name].setup(config)
    buf_try_add(server_name)
  end)
  if not ok then
    Log:error(fmt('launch_server failed: %s(%s)', server_name, result))
  end
end

---Setup a language server by providing a name
---@param server_name string name of the language server
---@param user_config table? when available it will take predence over any default configurations
function M.setup(server_name, user_config)
  if vim.g.vscode then
    return
  end
  vim.validate { name = { server_name, 'string' } }
  user_config = user_config or {}

  if lsp_utils.is_client_active(server_name) or client_is_configured(server_name) then
    return
  end

  local server_mapping = require('mason-lspconfig.mappings.server')
  local registry = require('mason-registry')

  local pkg_name = server_mapping.lspconfig_to_package[server_name]
  if not pkg_name then
    local config = resolve_config(server_name, user_config)
    launch_server(server_name, config)
    return
  end

  local should_auto_install = function(name)
    local lsp_opts = require('xxx.lsp.config')
    local installer_settings = lsp_opts.mason_lspconfig.setup
    return installer_settings.automatic_installation
      and not vim.tbl_contains(installer_settings.automatic_installation.exclude, name)
  end

  if not registry.is_installed(pkg_name) then
    local notify_title = 'LSP automatic installer'
    if should_auto_install(server_name) then
      Log:debug('Automatic server installation detected')

      local pkg = registry.get_package(pkg_name)

      local pn = ProgressNotify:new()

      vim.schedule(function()
        pn:start(notify_title, fmt('Installation in progress for [%s:%s]...', server_name, pkg_name))
        -- vim.notify_once(fmt("Installation in progress for [%s], await...", server_name),
        --     vim.log.levels.INFO, notify_opts)
      end)

      pkg:once('install:success', function()
        vim.schedule(function()
          pn:finish(fmt("'%s:%s' was successfully installed", server_name, pkg_name))
          -- mason config is only available once the server has been installed
          local config = resolve_config(server_name, resolve_mason_config(server_name), user_config)
          launch_server(server_name, config)
        end)
      end)

      pkg:once('install:failed', function()
        vim.schedule(function()
          -- vim.log.levels.ERROR move to new lines is modify by vim.lsp.buf.format()
          pn:finish(
            fmt("'%s:%s' was failingly installed", server_name, pkg_name),
            vim.log.levels.ERROR,
            icons.ui.RunError
          )
        end)
      end)

      pkg:install()
      -- Log:debug 'Automatic server installation detected'
      -- vim.notify_once(fmt('Installation in progress for [%s]', server_name), vim.log.levels.INFO)
      -- local pkg = registry.get_package(pkg_name)
      -- pkg:install():once('closed', function()
      --   if pkg:is_installed() then
      --     vim.schedule(function()
      --       vim.notify_once(fmt('Installation complete for [%s]', server_name), vim.log.levels.INFO)
      --       -- mason config is only available once the server has been installed
      --       local config = resolve_config(server_name, resolve_mason_config(server_name), user_config)
      --       launch_server(server_name, config)
      --     end)
      --   end
      -- end)
    else
      local msg = server_name .. ' is not managed by the automatic installer'
      vim.schedule(function()
        vim.notify_once(msg, vim.log.levels.WARN, { title = notify_title })
      end)
    end
    return
  end

  local config = resolve_config(server_name, resolve_mason_config(server_name), user_config)
  launch_server(server_name, config)
end

return M
