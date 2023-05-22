Xvim = {
  colorscheme = 'neo', -- neo(neosolarized), one(onedarkpro)
  winblend = 0, -- 当使用透明主题时, 有些组件不为零时背景为黑色
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
