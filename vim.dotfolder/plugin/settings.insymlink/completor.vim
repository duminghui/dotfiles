" 'maralla/completor'
if g:vim_plug.is_ready('vim-airline')
    inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
    inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"
    let g:completor_auto_trigger = 1
    inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<C-x>\<C-u>\<C-p>"
    " set completeopt=menu,preview,menuone
    set completeopt=menuone
endif
