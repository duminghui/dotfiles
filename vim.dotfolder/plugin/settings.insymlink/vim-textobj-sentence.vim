" 'reedes/vim-textobj-sentence'

if g:vim_plug.is_ready('vim-textobj-sentence')
    augroup textobj_sentence
        autocmd!
        autocmd FileType markdown call textobj#sentence#init()
        autocmd FileType textile call textobj#sentence#init()
        autocmd FileType text call textobj#sentence#init()
    augroup END
endif
