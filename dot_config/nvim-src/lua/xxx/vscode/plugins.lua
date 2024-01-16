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
  -- { 'rlane/pounce.nvim', config = true },
  -- {
  --   'numToStr/Comment.nvim',
  --   config = function()
  --     require('xxx.plugin-config.comment-rc').setup()
  --   end,
  --   keys = { { 'gc', mode = { 'n', 'v' } }, { 'gb', mode = { 'n', 'v' } } },
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
