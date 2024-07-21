local plugins = {
  { 'folke/lazy.nvim', tag = 'stable' },
  {
    'keaising/im-select.nvim',
    config = function()
      require('xxx.plugin-config.im-select-rc').setup()
    end,
    -- event = { 'VeryLazy' },
    enabled = false,
  },
  { 'Tastyep/structlog.nvim', lazy = true },
  {
    'smoka7/hop.nvim',
    version = '*',
    -- config = true,
    config = function()
      require('xxx.plugin-config.hop-rc').setup()
    end,
    opts = {
      multi_windows = false,
    },
    cmd = { 'HopAnywhere', 'HopChar1', 'HopChar2', 'HopWord', 'HopLineStart', 'HopLine', 'HopVertical', 'HopPattern' },
    enabled = true,
  },
  -- {
  --   -- Pounce is a motion plugin
  --   'rlane/pounce.nvim',
  --   config = true,
  --   cmd = { 'Pounce' },
  -- },
  {
    'kylechui/nvim-surround',
    config = function()
      require('nvim-surround').setup()
    end,
    keys = { 'ys', 'cs', 'ds' },
  },
}
return plugins
