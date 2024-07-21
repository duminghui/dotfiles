-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.mapleader = ","
vim.g.maplocalleader = ","

local opt = vim.opt

opt.title = true
opt.belloff = { "esc", "spell" }

opt.completeopt = "menu,menuone,noselect"

opt.mouse = "" -- disable mouse in all modes
opt.mousemoveevent = true -- for bufferline hover
opt.breakindent = true
opt.breakindentopt = "shift:2,sbr" -- lin wrap opts
opt.showcmd = true
opt.cursorcolumn = true

-- Highlight the screen line of the cursor with CursorLine and the line number with CursorLineNr **
-- line,screenline,number,both
-- both: line,number
-- line: whold line in warp
-- screenline: current line in warp
opt.cursorlineopt = "screenline,number"

-- 如果vscode中配置会造成vscode显示多个光标符号
opt.colorcolumn = vim.g.vscode and "" or "80,100,120,140,160"
opt.cmdheight = 2 -- Hide the command bar

-- opt.statuscolumn = ""

opt.fillchars = {
  horiz = "━",
  horizup = "┻",
  horizdown = "┳",
  vert = "┃",
  vertleft = "┫",
  vertright = "┣",
  verthoriz = "╋",
  -- fold = "-",
  stl = " ",
  stlnc = " ",
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}
opt.guicursor =
  "n-v:block,i-c-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait300-blinkoff300-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
opt.list = true -- Show some invisible characters like tabs etc
opt.listchars = "tab:›󰨓,trail:•,extends:#,nbsp:." -- ■
opt.whichwrap:append("b,s,h,l,<,>,[,]")

opt.scrolloff = 6 -- Set the cursor 6 lines down instead of directly at the top of the file

opt.showmode = false -- Do not show the mode
opt.showcmd = true
opt.shortmess = {
  l = false, -- use "999L, 888B" instead of "999 lines, 888 bytes"
  m = false, -- use "[+]" instead of "[Modified]"
  r = false, -- use "[RO]" instead of "[readonly]"
  w = false, -- use "[w]" instead of "written" for file write message and "[a]" instead of "appended" for ':w >> file' command
  a = true, -- all of the above abbreviations
  o = true, -- overwrite message for writing a file with subsequent message for reading a file (useful for ":wn" or when 'autowrite' on)
  O = true, -- message for reading a file overwrites any previous message;  also for quickfix message (e.g., ":cn")
  s = false, -- don't give "search hit BOTTOM, continuing at TOP" or "search hit TOP, continuing at BOTTOM" messages; when using the search count do not show "W" after the count message (see S below)
  t = true, -- truncate file message at the start if it is too long to fit on the command-line, "<" will appear in the left most column; ignored in Ex mode
  T = true, --  truncate other messages in the middle if they are too long to fit on the command line; "..." will appear in the middle; ignored in Ex mode
  W = false, -- don't give "written" or "[w]" when writing a file
  A = false, -- don't give the "ATTENTION" message when an existing swap file is found
  I = false, -- don't give the intro message when starting Vim,:intro
  c = false, -- don't give |ins-completion-menu| messages; for example, "-- XXX completion (YYY)", "match 1 of 2", "The only match", "Pattern not found", "Back at original", etc.
  C = false, -- don't give messages while scanning for ins-completion items, for instance "scanning tags"
  q = false, -- use "recording" instead of "recording @a"
  F = true, -- don't give the file info when editing a file, like `:silent` was used for the command
  S = false, -- do not show search count message when searching, e.g.'[1/5]',
  -- remove in neovim 10
  f = false, -- use "(3 of 5)" instead of "(file 3 of 5)"
  i = false, -- use "[noeol]" instead of "[Incomplete last line]"
  n = false, -- use "[New]" instead of "[New File]"
  x = false, -- use "[dos]" instead of "[dos format]", "[unix]" instead of "[unix format]" and "[mac]" instead of "[mac format]"
}
opt.virtualedit = "onemore"

-- 包含在使用o进入下一行或enter进入下一行时是否自动添加注释符
-- t: Auto-wrap text using 'textwidth'
-- c: Auto-wrap comments using 'textwidth', inserting the currment comment leader automatically
-- r: 回车后自动添加注释符
-- o: 用o或O进入后自动添加注释
-- j: 使用j合并下一行时, 自动删除注释
-- q: 使用gq命令时也格式化注释
-- l: 当一个长行长度>'textwidth'时进入insert mod不自动生成新行(当有t或c选项时)
-- n:When formatting text, recognize numbered lists.
-- opt.formatoptions = "jroqnl"
opt.formatoptions = "jcroqlnt"

opt.wrap = true

opt.sessionoptions = "buffers,curdir,tabpages,winsize,globals,folds,winpos,skiprtp" -- Session options to store in the session

opt.backup = false
opt.writebackup = false
opt.swapfile = false

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

vim.cmd([[language message en_US.UTF-8]])
