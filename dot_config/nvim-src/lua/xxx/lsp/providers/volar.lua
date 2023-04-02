local typescript = require 'mason-lspconfig.typescript'

local server_mapping = require 'mason-lspconfig.mappings.server'
local path = require 'mason-core.path'
local pkg_name = server_mapping.lspconfig_to_package['volar']
local _install_dir = path.package_prefix(pkg_name)

local function yarn_tsdk(workspace_dir)
  return path.concat { workspace_dir, '.yarn', 'sdks', 'typescript', 'lib' }
end

local function resolve_tsdk(install_dir, workspace_dir)
  if workspace_dir then
    local tsdk = yarn_tsdk(workspace_dir)
    local local_tsserverlib = typescript.find_typescript_module_in_lib(tsdk)
    if local_tsserverlib then
      return tsdk, local_tsserverlib
    end
  end
  return typescript.resolve_tsdk(install_dir, workspace_dir)
end

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#volar
-- Take Over Mode
local opts = {
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' },
  on_new_config = function(new_config, workspace_dir)
    local tsdk = resolve_tsdk(_install_dir, workspace_dir)
    new_config.init_options.typescript.tsdk = tsdk
  end,
  init_options = {
    typescript = {
      tsdk = '',
    },
  },
  -- settings = {
  --   volar = {
  --     typescript = {
  --       tsdk = '.yarn/sdks/typescript/lib',
  --     },
  --   },
  -- },
}
return opts
