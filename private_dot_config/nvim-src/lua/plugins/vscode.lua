local vscode = vim.g.vscode == 1

---@type LazySpec
return {

  { "smoka7/hop.nvim", vscode = true },

  { "monaqa/dial.nvim", cond = vscode and true },
  { "ggandor/flit.nvim", cond = vscode and false },
  { "ggandor/leap.nvim", cond = vscode and false },
  { "echasnovski/mini.ai", cond = true },
  { "echasnovski/mini.comment", enabled = false },
  { "echasnovski/mini.move", cond = vscode and false },
  { "echasnovski/mini.pairs", cond = true },
  { "echasnovski/mini.surround", cond = true },
  { "nvim-treesitter/nvim-treesitter", cond = not vscode },
  { "nvim-treesitter/nvim-treesitter-textobjects", cond = not vscode },
  { "JoosepAlviste/nvim-ts-context-commentstring", enabled = false },
  { "folke/ts-comments.nvim", cond = not vscode },
  { "tpope/vim-repeat", enabled = false },
  { "gbprod/yanky.nvim", enabled = false }
,
}
