call utils#init()
call plug#begin()

Plug 'bronson/vim-trailing-whitespace', g:vim_plug.cond(1)
Plug 'tpope/vim-surround', g:vim_plug.cond(1)
Plug 'jiangmiao/auto-pairs', g:vim_plug.cond(1)
Plug 'terryma/vim-multiple-cursors', g:vim_plug.cond(1)
Plug 'asvetliakov/vim-easymotion', g:vim_plug.cond(exists('g:vscode'), { 'as': 'vsc-easymotion' })
Plug 'haya14busa/vim-easyoperator-line'
Plug 'haya14busa/vim-easyoperator-phrase'
Plug 'tommcdo/vim-exchange'
" 对齐插件
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-lastpat'
Plug 'reedes/vim-textobj-sentence'
Plug 'reedes/vim-textobj-quote'
"  i', i", i), i], i}, ip and it.
Plug 'gcmt/wildfire.vim'
Plug 'tpope/vim-commentary', g:vim_plug.cond(1)
call plug#end()

" General {{{
" 去除蜂鸣声
set belloff=esc,spell
set nocompatible
" set background=dark
filetype plugin indent on
syntax on
set mouse&
set mousehide
set encoding=utf-8
scriptencoding utf-8
" * register使用copy-paste
set clipboard=unnamed
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
"set autowrite                       " Automatically write a file when leaving a modified buffer
" 控制状态栏显示的选项 :h shortmess
set shortmess+=filmnrwxoOtT         " Abbrev. of messages (avoids 'hit enter')
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
set virtualedit=onemore             " Allow for cursor beyond last character
set history=1000                    " Store a ton of history (default is 20)
" set spell                           " Spell checking on
set hidden                          " Allow buffer switching without saving
set iskeyword-=.                    " '.' is an end of word designator
set iskeyword-=#                    " '#' is an end of word designator
set iskeyword-=-                    " '-' is an end of word designator

set unbackup                  " Backups are nice ...
if has('persistent_undo')
    set undofile                " So is persistent undo ...
    set undolevels=1000         " Maximum number of changes that can be undone
    set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
endif

" set textwidth=80
set linebreak
set tabpagemax=15               " Only show 15 tabs
set showmode                    " Display the current mode
set cmdheight=2
set cursorline                  " Highlight current line
set cursorcolumn                " Highlight current column
set colorcolumn=+1
" 设置窗口的分配线和fold线
set fillchars=vert:\|,fold:-

if has('cmdline_info')
    set ruler                   " Show the ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
    set showcmd                 " Show partial commands in status line and  Selected characters/lines in visual mode
endif

set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set number                      " Line numbers on
set relativenumber
set showmatch                   " Show matching brackets/parenthesis
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set winminheight=0              " Windows can be 0 line high
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor
set foldenable                  " Auto fold code
set list
set listchars=tab:›■,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
if &term == 'xterm' || &term == 'screen'
    set t_Co=256            " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
endif

" set nowrap                      " Do not wrap long lines
set autoindent                  " Indent at the same level of the previous line
set shiftwidth=4                " Use indents of 4 spaces
set expandtab                   " Tabs are spaces, not tabs
set tabstop=4                   " An indentation every four columns
set softtabstop=4               " Let backspace delete indent
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current
"set matchpairs+=<:>             " Match, to be used with %
set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)
"set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks
" Remove trailing whitespaces and ^M chars
" To disable the stripping of whitespace, add the following to your

" Key (re)Mappings {{{
let mapleader = ','
noremap \ ,
let maplocalleader = '_'
" Wrapped lines goes down/up to next row, rather than next line in file.
noremap j gj
noremap gj j
noremap k gk
noremap gk k

" Stupid shift key fixes
if has("user_commands")
    command! -bang -nargs=* -complete=file E e<bang> <args>
    command! -bang -nargs=* -complete=file W w<bang> <args>
    command! -bang -nargs=* -complete=file Wq wq<bang> <args>
    command! -bang -nargs=* -complete=file WQ wq<bang> <args>
    command! -bang Wa wa<bang>
    command! -bang WA wa<bang>
    command! -bang Q q<bang>
    command! -bang QA qa<bang>
    command! -bang Qa qa<bang>
endif

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

nmap <silent> <leader>/ :nohlsearch<CR>

" Allow using the repeat operator with a visual selection (!)
" http://stackoverflow.com/a/8064607/127816
vnoremap . :normal .<CR>

set completeopt=menuone

" autoread {{{
set autoread
if !has("gui_running")
    augroup checktime
        autocmd!
        autocmd BufEnter     * silent! checktime
        autocmd CursorHold   * silent! checktime
        autocmd CursorHoldI  * silent! checktime
        autocmd CursorMoved  * silent! checktime
        autocmd CursorMovedI * silent! checktime
    augroup END
endif
" }}}

" }}}

" Initialize directories {{{
if !has('nvim')
    function! InitializeDirectories()
        let parent = $HOME
        let prefix = 'vim'
        let dir_list = {
                    \ 'backup': 'backupdir',
                    \ 'views': 'viewdir',
                    \ 'swap': 'directory' }

        if has('persistent_undo')
            let dir_list['undo'] = 'undodir'
        endif

        let common_dir = parent . '/.' . prefix

        for [dirname, settingname] in items(dir_list)
            let directory = common_dir . '/' . '.' . dirname . '/'
            if exists("*mkdir")
                if !isdirectory(directory)
                    call mkdir(directory)
                endif
            endif
            if !isdirectory(directory)
                echo "Warning: Unable to create backup directory: " . directory
                echo "Try: mkdir -p " . directory
            else
                let directory = substitute(directory, " ", "\\\\ ", "g")
                exec "set " . settingname . "=" . directory
            endif
        endfor
    endfunction
    call InitializeDirectories()
else
    set backupdir-=.
    for backupdir in split(&backupdir,',')
        if exists("*mkdir")
            if !isdirectory(backupdir)
                call mkdir(backupdir)
            endif
        endif
        if !isdirectory(backupdir)
            echo "Warning: Unable to create backup directory: " . backupdir
            echo "Try: mkdir -p " . backupdir
        endif
    endfor
endif
" }}}

set nobackup

if (has("win64"))
    augroup im
        autocmd!
        autocmd InsertLeave,BufEnter * :silent :!im-select.exe 1033
    augroup END
endif


if g:vim_plug.is_ready('auto-pairs')
    let g:AutoPairsShortcutToggle='<c-a>'
    " let g:AutoPairsShortcutFastWrap='<c-p>'
    " noremap <M-x> :echo "ALT-X pressed"<cr>
    " noremap <c-p> :echo "CTRL-P pressed"<cr>
    " exec "set <M-x>=\e]{0}x~"
    set ttimeout ttimeoutlen=100
endif

" 'reedes/vim-textobj-quote'
if g:vim_plug.is_ready('vim-textobj-quote')
    augroup textobj_quote
        autocmd!
        autocmd FileType markdown call textobj#quote#init()
        autocmd FileType textile call textobj#quote#init()
        autocmd FileType text call textobj#quote#init({'educate': 0})
    augroup END
endif

" 'reedes/vim-textobj-sentence'
if g:vim_plug.is_ready('vim-textobj-sentence')
    augroup textobj_sentence
        autocmd!
        autocmd FileType markdown call textobj#sentence#init()
        autocmd FileType textile call textobj#sentence#init()
        autocmd FileType text call textobj#sentence#init()
    augroup END
endif
