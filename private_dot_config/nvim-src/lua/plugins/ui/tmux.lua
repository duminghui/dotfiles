-- 不知道为什么, 要把clipboard放在这里才能起作用
vim.opt.clipboard = { "unnamedplus" } -- Use the system clipboard
return {
  "aserowy/tmux.nvim",
  -- 要加opts, 否则插件不进行配置
  opts = {},
  event = "VeryLazy",
  -- 不用加下面的条件, 一直用tmux.nvim来进行窗口导航和改变窗口大小
  -- cond = function()
  --   return os.getenv("TERM_PROGRAM") == "tmux"
  -- end,
}
