local M = {}
function M.keymappings()
  local keymap_opts = {
    noremap = true,
    silent = false,
  }
  -- workbench.action.files.save
  vim.keymap.set("n", "<leader>w", "<cmd>call VSCodeNotify('workbench.action.files.save')<CR>", keymap_opts)
  vim.keymap.set("n", "<leader>/", "<cmd>nohl<CR>", keymap_opts)
  vim.keymap.set("x", "gc", "<Plug>VSCodeCommentary", keymap_opts)
  vim.keymap.set("n", "gc", "<Plug>VSCodeCommentary", keymap_opts)
  vim.keymap.set("o", "gc", "<Plug>VSCodeCommentary", keymap_opts)
  vim.keymap.set("n", "gcc", "<Plug>VSCodeCommentaryLine", keymap_opts)

  -- lsp
  vim.keymap.set("n", "gr", "<Cmd>call VSCodeNotify('editor.action.referenceSearch.trigger')<CR>", keymap_opts)
  vim.keymap.set("n", "gI", "<Cmd>call VSCodeNotify('editor.action.peekImplementation')<CR>", keymap_opts)
  vim.keymap.set("n", "gnr", "<Cmd>call VSCodeNotify('editor.action.rename')<CR>", keymap_opts)

  -- vim.keymap.set("n", "<leader><leader>a", "<cmd>HopAnywhere<CR>", keymap_opts)
  vim.keymap.set("n", "<leader><leader>s", "<cmd>HopChar1<CR>", keymap_opts)
  vim.keymap.set("n", "<leader><leader>t", "<cmd>HopChar2<CR>", keymap_opts)
  vim.keymap.set("n", "<leader><leader>w", "<cmd>HopWord<CR>", keymap_opts)
  vim.keymap.set("n", "<leader><leader>l", "<cmd>HopLineStart<CR>", keymap_opts)
end

function M.setup()
  vim.opt.cursorcolumn = false
  M.keymappings()
end
return M
