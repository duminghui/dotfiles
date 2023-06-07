local plugins = {
  { 'folke/lazy.nvim', tag = 'stable' },
  {
    'laishulu/vim-macos-ime',
    cond = vim.loop.os_uname().sysname == 'Darwin',
    config = function()
      require('xxx.plugin-config.vim-macos-ime-rc').setup()
    end,
    event = { 'InsertEnter', 'InsertLeave' },
    enabled = false,
  },
  { 'Tastyep/structlog.nvim', lazy = true },
  {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config = true,
    opts = {
      multi_windows = false,
    },
    cmd = { 'HopAnywhere', 'HopChar1', 'HopChar2', 'HopWord', 'HopLineStart', 'HopLine', 'HopVertical', 'HopPattern' },
  },

  {
    'kylechui/nvim-surround',
    config = function()
      require('nvim-surround').setup()
    end,
    keys = { 'ys', 'cs', 'ds' },
  },
}
return plugins
