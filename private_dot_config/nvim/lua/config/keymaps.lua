-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local del_keymaps = {
  { "n", "<leader>w" },
  { "n", "<leader>wd" },
  -- { "n", "<leader>w-" },
  -- { "n", "<leader>w|" },
  -- { "n", "<leader>-" },
  -- { "n", "<leader>|" },
  { "n", "<leader>wm" },

  -- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
  -- { { "n", "x", "o" }, "n" },
  -- { { "n", "x", "o" }, "N" },

  -- Resize window using <ctrl> arrow keys
  { "n", "<C-Up>" },
  { "n", "<C-Down>" },
  { "n", "<C-Left>" },
  { "n", "<C-Right>" },
  -- Move Lines
  { { "n", "i", "v" }, "<A-j>" },
  { { "n", "i", "v" }, "<A-k>" },
}

del_keymappings(del_keymaps)

local keymaps = {
  { "n", "<leader>w", "<CMD>w!<CR>", { desc = "Save File" } },
  { "i", "<A-k>", "<C-\\><C-N><C-w>k", { desc = "Go to the up window (Insert)", noremap = false } },
  { "i", "<A-j>", "<C-\\><C-N><C-w>j", { desc = "Go to the down window (Insert)", noremap = false } },
  { "i", "<A-h>", "<C-\\><C-N><C-w>h", { desc = "Go to the left window (Insert)", noremap = false } },
  { "i", "<A-l>", "<C-\\><C-N><C-w>l", { desc = "Go to the right window (Insert)", noremap = false } },
}

keymappings(keymaps)

if LazyVim.has("tmux.nvim") then
  -- 需要运行下面把覆盖掉的快捷键再重新配置
  local copy = require("tmux.copy")
  local navigation = require("tmux.navigation")
  local resize = require("tmux.resize")
  copy.setup()
  navigation.setup()
  resize.setup()
else
  keymaps = {
    { "n", "<A-j>", "<Cmd>resize +1<CR>", { desc = "Increase height" } },
    { "n", "<A-k>", "<Cmd>resize -1<CR>", { desc = "Decrease height" } },
    { "n", "<A-l>", "<Cmd>vertical resize +1<CR>", { desc = "Increase width" } },
    { "n", "<A-h>", "<Cmd>vertical resize -1<CR>", { desc = "Decrease width" } },
  }
  keymappings(keymaps)
end

require("config/keymaps-vscode")
