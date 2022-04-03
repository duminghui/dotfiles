" 'SirVer/ultisnips'

if g:vim_plug.is_ready('ultisnips')
    let g:UltiSnipsExpandTrigger = "<c-j>"
    " 使用<cr>会影响换行
    " let g:UltiSnipsExpandTrigger = "<cr>"
    let g:UltiSnipsJumpForwardTrigger = "<c-j>"
    let g:UltiSnipsJumpBackwardTrigger = "<c-k>"

    inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<S-Tab>"
    " inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
    " inoremap <expr> <cr> pumvisible() ? "\<C-j>" : "\<cr>"
    " inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<Tab>"
endif
