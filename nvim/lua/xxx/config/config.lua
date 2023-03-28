Xvim = {
  colorscheme = 'neo', -- neo(neosolarized), one(onedarkpro)
  winblend = 0, -- 当使用透明主题时, 有些组件不为零时背景为黑色
  which_key_winblend = 9,
  use_lsp = true,
  log = {
    ---@usage can be { "trace", "debug", "info", "warn", "error", "fatal" },
    level = 'info',
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
