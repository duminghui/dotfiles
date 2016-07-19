" 'vim-scripts/sessionman.vim'
set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize
if g:vim_plug.is_ready('sessionman.vim')
    nmap <leader>sl :SessionList<CR>
    nmap <leader>ss :SessionSave<CR>
    nmap <leader>sc :SessionClose<CR>
endif
