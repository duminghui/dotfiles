-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

local autocmd = vim.api.nvim_create_autocmd

autocmd({ "BufRead", "BufWinEnter", "BufNewFile" }, {
  group = augroup("user_file_opened"),
  once = true,
  callback = function(args)
    local buftype = vim.api.nvim_get_option_value("buftype", { buf = args.buf })
    if not (vim.fn.expand("%") == "" or buftype == "nofile") then
      vim.cmd("do User FileOpened")
    end
  end,
})

---- below don't use in vscode
if vim.g.vscode then
  return
end

autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  pattern = "*",
  desc = "Highlight text on yank",
  callback = function()
    require("vim.highlight").on_yank({ higroup = "Search", timeout = 150 })
  end,
})
