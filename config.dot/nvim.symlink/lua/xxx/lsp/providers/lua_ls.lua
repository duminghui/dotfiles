-- https://github.com/sumneko/lua-language-server/wiki/Settings
local default_workspace = {
  library = {
    vim.fn.expand("$VIMRUNTIME"),
    require("neodev.config").types(),
  },
  -- too big
  -- Make the server aware of Neovim runtime files
  -- library = vim.api.nvim_get_runtime_file("", true),

  maxPreload = 1000,
  preloadFileSize = 10000,
  checkThirdParty = false,
}

local function add_packages_to_workspace(packages, config)
  -- config.settings.Lua = config.settings.Lua or { workspace = default_workspace }
  local runtimedirs = vim.api.nvim__get_runtime({ "lua" }, true, { is_lua = true }) or {}
  local workspace = config.settings.Lua.workspace
  for _, v in pairs(runtimedirs) do
    for _, pack in ipairs(packages) do
      if v:match(pack) and not vim.tbl_contains(workspace.library, v) then
        table.insert(workspace.library, v)
      end
    end
  end
end

local lspconfig = require("lspconfig")

local make_on_new_config = function(on_new_config, _)
  return lspconfig.util.add_hook_before(on_new_config, function(new_config, _)
    local server_name = new_config.name
    if server_name ~= "lua_ls" then
      return
    end
    local plugins = { "plenary.nvim", "telescope.nvim", "nvim-treesitter", "LuaSnip" }
    add_packages_to_workspace(plugins, new_config)
  end)
end

lspconfig.util.default_config = vim.tbl_extend("force", lspconfig.util.default_config, {
  on_new_config = make_on_new_config(lspconfig.util.default_config.on_new_config),
})

local opts = {
  -- commands add after client attach
  -- Warning: Commands is deprecated and will be removed in future releases.
  -- It is recommended to use `vim.api.nvim_create_user_command()` instead in an `on_attach` function.
  commands = {
    XXXCmd = {
      function()
        print("this is XXX Cmd in sumneko_lua.lua, client.config.commands")
      end,
    },
  },
  settings = {
    Lua = {
      telemetry = { enable = false },
      runtime = {
        version = "LuaJIT",
        special = {
          reload = "require",
        },
      },
      diagnostics = {
        globals = { "vim", "packer_plugins" },
      },
      workspace = default_workspace,
    },
  },
}

return opts
