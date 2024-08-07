local M = {}

function M.load_default_options()
  -------------------- GLOBAL OPTIONS --------------------
  if vim.uv.os_uname().version:match('Windows') then
    vim.g.sqlite_clib_path = join_paths(vim.fn.stdpath('config'), 'sqlite3', 'sqlite3.dll')
  end
  vim.g.mapleader = ','
  vim.g.maplocalleader = ','

  vim.scriptencoding = 'utf-8'
  vim.opt.encoding = 'utf-8'
  vim.opt.fileencoding = 'utf-8'

  -------------------- BUFFER OPTIONS --------------------
  -- vim.bo.autoindent = true
  -- vim.bo.expandtab = true -- Use spaces instead of tabs
  -- vim.bo.shiftwidth = 4 -- Size of an indent
  -- vim.bo.smartindent = true -- Insert indents automatically
  -- vim.bo.softtabstop = 4 -- Number of spaces tabs count for **
  -- vim.bo.tabstop = 4 -- Number of spaces in a tab

  vim.opt.shiftround = true -- Round indent **

  vim.opt.autoindent = true
  vim.opt.smartindent = true -- Insert indents automatically
  vim.opt.expandtab = true -- Use spaces instead of tabs
  vim.opt.shiftwidth = 4 -- Number of spaces of an indent, when zero use `tabstop`
  vim.opt.tabstop = 4 -- Number of spaces in a tab
  vim.opt.softtabstop = 4 -- Number of spaces tabs count for **
  -- Number of spaces that a <Tab> counts for while performing editing
  -- operations, like inserting a <Tab> or using <BS>.
  -- When 'sts' is zero, this feature is off.
  -- When 'sts' is negative, the value of 'shiftwidth' is used.
  -- 'softtabstop' is set to 0 when the 'paste' option is set and restored
  -- when 'paste' is reset.

  -------------------- WINDOW OPTIONS --------------------
  if not vim.g.vscode then
    -- 会造成vscode显示多个光标符号
    -- vim.wo.colorcolumn = "80,120,160" -- Make a ruler at 80px and 120px
    vim.opt.colorcolumn = '80,100,120,140,160' -- Make a ruler at 80px and 120px and 160px
  end
  vim.opt.list = true -- Show some invisible characters like tabs etc
  vim.opt.listchars = 'tab:›󰨓,trail:•,extends:#,nbsp:.' -- ■
  -- vim.wo.numberwidth = 2 -- Make the line number column thinner
  ---Note: Setting number and relative number gives you hybrid mode
  ---https://jeffkreeftmeijer.com/vim-number/
  vim.wo.number = true -- Set the absolute number
  vim.wo.relativenumber = true -- Set the relative number
  -- vim.opt.signcolumn = 'yes:1' -- Show information next to the line numbers
  vim.wo.signcolumn = 'yes:2' -- Show information next to the line numbers

  -- wrap
  vim.opt.wrap = true
  vim.opt.wrapmargin = 1
  vim.opt.breakindent = true
  vim.opt.breakindentopt = 'shift:2,sbr' -- lin wrap opts
  vim.opt.linebreak = true
  -- vim.wo.breakat = ""
  vim.opt.whichwrap:append('b,s,h,l,<,>,[,]')

  -------------------- VIM OPTIONS --------------------
  vim.opt.title = true
  vim.opt.belloff = { 'esc', 'spell' }
  vim.opt.cmdheight = 2 -- Hide the command bar
  vim.opt.clipboard = { 'unnamedplus' } -- Use the system clipboard
  vim.opt.completeopt = { 'menuone', 'noselect' } -- Completion opions for code completion
  vim.opt.emoji = false -- Turn off emojis **
  vim.opt.fillchars = {
    horiz = '━',
    horizup = '┻',
    horizdown = '┳',
    vert = '┃',
    vertleft = '┫',
    vertright = '┣',
    verthoriz = '╋',
    fold = '-',
    stl = ' ',
    stlnc = ' ',
  }
  vim.opt.foldenable = false -- Disable folding at startup.
  vim.opt.foldlevel = 6 -- Fold by default
  -- vim.opt.foldmethod = "marker" -- Fold based on markers as opposed to indentation
  vim.opt.foldmethod = 'manual' -- folding, set to "expr" for treesitter based folding
  vim.opt.foldexpr = '' -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
  vim.opt.modelines = 1 -- Only use folding settings for this file

  -- vim.opt.laststatus = 3 -- Use global statusline **

  -- vim.opt.mouse = "a" -- Use the mouse in all modes
  vim.opt.mouse = '' -- disable mouse in all modes
  vim.opt.mousemoveevent = false -- for bufferline hover
  vim.opt.scrolljump = 1
  vim.opt.scrolloff = 6 -- Set the cursor 6 lines down instead of directly at the top of the file

  vim.opt.shortmess = {
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
    c = true, -- don't give |ins-completion-menu| messages; for example, "-- XXX completion (YYY)", "match 1 of 2", "The only match", "Pattern not found", "Back at original", etc.
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

  vim.opt.showcmd = true -- Do not show me what I'm typing

  -- search
  vim.opt.inccommand = 'split' -- show a preview when use %s :s
  vim.opt.showmatch = true -- Show matching brackets by flickering
  vim.opt.incsearch = true
  vim.opt.hlsearch = true
  vim.opt.smartcase = true -- Don't ignore case with capitals
  vim.opt.ignorecase = true -- Ignore case

  -- Keywords are used in searching and recognizing with many commands:
  -- "w", "*", "[i", etc.  It is also used for "\k" in a |pattern|
  vim.opt.iskeyword:remove { '.', '#', '-' }

  vim.opt.showmode = true -- Do not show the mode
  vim.opt.sidescrolloff = 8 -- The minimal number of columns to keep to the left and to the right of the cursor if 'nowrap' is set **
  vim.opt.splitbelow = true -- Put new windows below current
  vim.opt.splitright = true -- Put new windows right of current
  -- vim.opt.textwidth = 120 -- Total allowed width on the screen vim.opt.timeout = true -- This option and 'timeoutlen' determine the behavior when part of a mapped key sequence has been received. This is on by default but being explicit! **
  vim.opt.timeoutlen = 500 -- Time in milliseconds to wait for a mapped sequence to complete. **
  vim.opt.ttimeoutlen = 10 -- Time in milliseconds to wait for a key code sequence to complete **
  vim.opt.updatetime = 300 -- If in this many milliseconds nothing is typed, the swap file will be written to disk. Also used for CursorHold autocommand and set to 100 as per https://github.com/antoinemadec/FixCursorHold.nvim **
  vim.opt.wildmenu = true
  vim.opt.wildmode = 'list:longest,full' -- Command-line completion mode
  vim.opt.wildignore = { '*/.git/*', '*/node_modules/*' } -- Ignore these files/folders **
  vim.opt.virtualedit = 'onemore'

  -- Create folders for our backups, undos, swaps if they don't exist
  local state_dir = vim.fn.stdpath('state')
  for _, v in ipairs {
    { 'backupdir', 'backup' },
    { 'undodir', 'undo' },
    { 'directory', 'swap' },
    { 'viewdir', 'view' },
    'shada',
  } do
    if vim.islist(v) then
      local opt_name = v[1]
      local dir = join_paths(state_dir, v[2])
      vim.fn.mkdir(dir, 'p', '0700')
      vim.opt[opt_name] = dir
    else
      local dir = join_paths(state_dir, v)
      vim.fn.mkdir(dir, 'p', '0700')
      vim.opt.shadafile = join_paths(dir, 'nvim_xxx.shada')
    end
  end

  vim.o.sessionoptions = 'buffers,curdir,tabpages,winsize,globals,folds,winpos,skiprtp' -- Session options to store in the session

  vim.opt.undofile = true -- Maintain undo history between sessions
  vim.opt.undolevels = 1000 -- Ensure we can undo a lot! **

  --[[
        NOTE: don't store marks as they are currently broken in Neovim!
        @credit: wincent
    ]]
  -- vim.opt.shada = "!,'0,f0,<50,s10,h" -- **

  vim.opt.backup = false
  --[[if a file is being edited by another program
    (or was written to file while editing with another program), it is not allowed to be edited ]]
  vim.opt.writebackup = false
  vim.opt.swapfile = false -- don't use a swap file

  -------------------- Highlight OPTIONS --------------------
  vim.o.background = 'dark'
  vim.o.termguicolors = true -- True color support
  vim.opt.cursorline = true
  vim.opt.cursorcolumn = true
  -- Highlight the screen line of the cursor with CursorLine and the line number with CursorLineNr **
  -- line,screenline,number,both
  -- both: line,number
  -- line: whold line in warp
  -- screenline: current line in warp
  vim.opt.cursorlineopt = 'screenline,number'

  -- cursor blinking
  -- Cursor lCursor is highlight
  vim.opt.guicursor =
    'n-v:block,i-c-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait300-blinkoff300-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175'

  -- 如果背景是深色, 再开启这个, 背景就会变成纯黑色的块
  -- if not vim.g.vscode then
  -- 这个会造成vscode卡顿
  -- 在顔色主题中进行设置,不在这个文件中设置下面两顶
  -- Enables pseudo-transparency for the |popup-menu|.
  -- cmp's menu
  -- vim.opt.pumblend = 9
  -- Enables pseudo-transparency for a floating window. doc view
  -- vim.opt.winblend = 9
  -- end
  -- A list of words that change how |cmdline-completion| is done.
  -- The following values are supported:
  vim.opt.wildoptions = 'pum'

  -------------------- Program OPTIONS ----------------------
  -- 包含在使用o进入下一行或enter进入下一行时是否自动添加注释符
  -- t: Auto-wrap text using 'textwidth'
  -- c: Auto-wrap comments using 'textwidth', inserting the currment comment leader automatically
  -- r: 回车后自动添加注释符
  -- o: 用o或O进入后自动添加注释
  -- j: 使用j合并下一行时, 自动删除注释
  -- q: 使用gq命令时也格式化注释
  -- l: 当一个长行长度>'textwidth'时进入insert mod不自动生成新行(当有t或c选项时)
  vim.opt.formatoptions = 'rjl'

  --------------------------------------------------------

  -- Undercurl
  vim.cmd([[let &t_Cs = "\e[4:3m"]])
  vim.cmd([[let &t_Ce = "\e[4:0m"]])

  -- vim.opt.shortmess:append 'fxtOrmnlTwoi'

  -- syntax on 会引起site/after/ftplugin中的文件加载两次, 造成启动两次lsp, 不要启用
  -- vim.cmd('syntax on')
  -- vim.cmd('syntax enable')
  -- vim.cmd("colorscheme xxx")
end

function M.load_headless_options()
  vim.opt.shortmess = '' -- try to prevent echom from cutting messages off or prompting
  vim.opt.more = false -- don't pause listing when screen is filled
  vim.opt.cmdheight = 9999 -- helps avoiding |hit-enter| prompts.
  vim.opt.columns = 9999 -- set the widest screen possible
  vim.opt.swapfile = false -- don't use a swap file
end

function M.load_defaults()
  if #vim.api.nvim_list_uis() == 0 then
    M.load_headless_options()
    return
  end
  M.load_default_options()
end

return M
