local M = {}

M.opts = {
}

function M.integrate_with_scrollbar()
  if M.is_integrate_with_scrollbar then
    return
  end
  local hlslens_ok, _ = pcall(require, "hlslens")
  if not hlslens_ok then
    return
  end
  local scrollbar_ok, shs = pcall(require, "scrollbar.handlers.search")
  if not scrollbar_ok then
    return
  end
  shs.setup(M.opts)
  M.is_integrate_with_scrollbar = true
end

function M.setup()
  local ok, _ = safe_require("hlslens")
  if not ok then
    return
  end

  -- hlslens.setup(M.opts)
  M.integrate_with_scrollbar()

  local kopts = { noremap = true, silent = true }

  vim.api.nvim_set_keymap('n', 'n',
    [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
    kopts)
  vim.api.nvim_set_keymap('n', 'N',
    [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
    kopts)
  vim.api.nvim_set_keymap('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
  vim.api.nvim_set_keymap('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
  vim.api.nvim_set_keymap('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
  vim.api.nvim_set_keymap('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)

end

return M
