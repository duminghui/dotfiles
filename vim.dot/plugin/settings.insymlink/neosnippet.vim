" 'Shougo/neosnippet.vim'

if g:vim_plug.is_ready('neosnippet.vim')
    " If it is not 0, neosnippet will expand snippets by a word
    " boundary. default 0
    let g:neosnippet#expand_word_boundary = 0

    " If this variable is not 0, neosnippet will use the conceal
    " markers. default 1
    " 是否不显示<0>这样子的标记在输入文本的时候 设为0会显示
    let g:neosnippet#enable_conceal_markers = 0

    " If this variable is not 0, neosnippet can expand the function
    " prototype. default 0
    " 是否自动填充snippet的参数, 如果下面的参数设为1,在nvim中会有问题,go的main展开不了
    let g:neosnippet#enable_completed_snippet = 1

    " If this variable is not 0, neosnippet will conceal commas in
    " expanded arguments from completed snippets. default 1
    " 上面选项为1的时候这个要设为0,
    " 否则在填充函数参数的时候会把,号也包括进去了,除非想一直手动输*
    let g:neosnippet#enable_optional_arguments = 0


    " If this variable is not 0, neosnippet will clear the markers
    " in the buffer when BufWritePost, CursorMoved and
    " CursorMovedI autocmd.default 1
    let g:neosnippet#enable_auto_clear_markers = 1

    " Plugin key-mappings.
    " Note: It must be "imap" and "smap".  It uses <Plug> mappings.
    imap <C-k>     <Plug>(neosnippet_expand_or_jump)
    smap <C-k>     <Plug>(neosnippet_expand_or_jump)
    " imap <C-k>     <Plug>(neosnippet_jump_or_expand)
    " smap <C-k>     <Plug>(neosnippet_jump_or_expand)
    imap <C-j>     <Plug>(neosnippet_jump)
    smap <C-j>     <Plug>(neosnippet_jump)
    xmap <C-k>     <Plug>(neosnippet_expand_target)

    " SuperTab like snippets behavior.
    " Note: It must be "imap" and "smap".  It uses <Plug> mappings.
    " imap <expr><TAB> pumvisible() ? "\<C-n>" :
    " \ neosnippet#expandable_or_jumpable() ?
    " \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

    " smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    " 			\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

    " For conceal markers.
    if has('conceal')
        " set conceallevel=2 concealcursor=niv
        set conceallevel=2
        augroup conceal_augroup
            autocmd!
            autocmd FileType json setlocal conceallevel=0
        augroup END
    endif
endif
