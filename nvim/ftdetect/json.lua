-- when use filetype.nvim, this not work
vim.cmd [[
  " au BufRead,BufNewFile tsconfig.json,tasks.json set filetype=jsonc
  au BufRead,BufNewFile *.json set filetype=jsonc
]]
