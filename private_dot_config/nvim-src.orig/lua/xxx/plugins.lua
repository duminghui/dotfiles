local plugins = {
  {
    import = 'xxx.plugins-notvscode',
    cond = not vim.g.vscode,
    -- cond = function()
    --   return not vim.g.vscode
    -- end,
  },
  { import = 'xxx.plugins-always', cond = true },
}
return plugins
