" 'scrooloose/nerdtree'
" 'jistr/vim-nerdtree-tabs'

if g:vim_plug.is_ready('nerdtree')
    let g:NERDShutUp=1
    map <C-e> <plug>NERDTreeTabsToggle<CR>
    map <leader>e :NERDTreeFind<CR>
    nmap <leader>nt :NERDTreeFind<CR>

    let NERDTreeShowBookmarks=0
    let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
    let NERDTreeChDirMode=0
    let NERDTreeChDirMode=2
    let NERDTreeDirArrows=1
    let NERDTreeMinimalUI=0
    let NERDTreeQuitOnOpen=1
    let NERDTreeQuitOnOpen=0
    let NERDTreeAutoCenter=1
    let NERDTreeMouseMode=2
    let NERDTreeShowHidden=1
    let NERDTreeKeepTreeInNewTab=1
    let NERDTreeWinSize=33
    let NERDTreeHijackNetrw=1
    let g:nerdtree_tabs_open_on_gui_startup=1
    let g:NERDTreeIndicatorMapCustom = {
                \ "Modified"  : "✹",
                \ "Staged"    : "✚",
                \ "Untracked" : "✭",
                \ "Renamed"   : "➜",
                \ "Unmerged"  : "═",
                \ "Deleted"   : "✖",
                \ "Dirty"     : "✗",
                \ "Clean"     : "✔︎",
                \ 'Ignored'   : '☒',
                \ "Unknown"   : "?"
                \ }
endif
