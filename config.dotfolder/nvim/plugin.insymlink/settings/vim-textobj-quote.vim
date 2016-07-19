" 'reedes/vim-textobj-quote'

if g:vim_plug.is_ready('vim-textobj-quote')
    augroup textobj_quote
        autocmd!
        autocmd FileType markdown call textobj#quote#init()
        autocmd FileType textile call textobj#quote#init()
        autocmd FileType text call textobj#quote#init({'educate': 0})
    augroup END
endif
