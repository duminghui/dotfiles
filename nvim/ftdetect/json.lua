-- when use filetype.nvim, this not work
vim.cmd [[
 au BufRead,BufNewFile tsconfig.json,tasks.json set filetype=jsonc
]]
