Xvim = {
  colorscheme = 'neo', -- neo(neosolarized), one(onedarkpro)
  telescope_winblend = 9,
  which_key_winblend = 9,
  lsp = {
    enable = true,
  },
  log = {
    ---@usage can be { "trace", "debug", "info", "warn", "error", "fatal" },
    level_console = 'info',
    level_file = 'debug',
    override_notify = false,
    viewer = {
      ---@usage this will fallback on "less +F" if not found
      cmd = 'lnav',
      layout_config = {
        ---@usage direction = 'vertical' | 'horizontal' | 'window' | 'float',
        direction = 'horizontal',
        open_mapping = '',
        size = 40,
        float_opts = {},
      },
    },
  },
}
