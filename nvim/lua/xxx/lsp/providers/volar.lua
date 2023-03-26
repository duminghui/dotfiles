local opts = {
  on_new_config = function(new_config, workspace_dir)
    local tsdk = ".yarn/sdks/typescript/lib"
    new_config.init_options.typescript.serverPath = tsdk
    new_config.init_options.typescript.tsdk = tsdk
  end,
  init_options = {
    typescript = {
      serverPath = ".yarn/sdks/typescript/lib",
      tsdk = ".yarn/sdks/typescript/lib",
    },
  },
  settings = {
    volar = {
      typescript = {
        serverPath = ".yarn/sdks/typescript/lib",
        tsdk = ".yarn/sdks/typescript/lib",
      },
    },
  },
}
return opts
