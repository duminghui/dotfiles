
" 'Valloric/YouCompleteMe'
if g:vim_plug.is_ready('YouCompleteMe')
    " YouCompleteMe修改了shortmess，在其中添加了c，是为了防止输入时总是提示"User defined completion 的相关信息的

    let g:acp_enableAtStartup = 0

    " let g:ycm_filetype_blacklist = {
    "             \ 'tagbar'   : 1,
    "             \ 'qf'       : 1,
    "             \ 'notes'    : 1,
    "             \ 'markdown' : 1,
    "             \ 'unite'    : 1,
    "             \ 'text'     : 1,
    "             \ 'vimwiki'  : 1,
    "             \ 'pandoc'   : 1,
    "             \ 'infolog'  : 1,
    "             \ 'mail'     : 1,
    "             \ 'cs'       : 1
    "             \}

    " enable completion from tags
    let g:ycm_collect_identifiers_from_tags_files = 1
    let g:ycm_add_preview_to_completeopt = 0
    " 下面的选项是直接作用于syntastic插件的
    " let g:ycm_always_populate_location_list = 1
    " let g:ycm_error_symbol = '>>'
    " let g:ycm_warning_symbol = '>*'

    " For snippet_complete marker.
    if has('conceal')
        set conceallevel=2 concealcursor=i
    endif

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
    autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

    " Haskell post write lint and check with ghcmod
    " $ `cabal install ghcmod` if missing and ensure
    " ~/.cabal/bin is in your $PATH.
    if !executable("ghcmod")
        autocmd BufWritePost *.hs GhcModCheckAndLintAsync
    endif

    " Disable the neosnippet preview candidate window
    " When enabled, there can be too much visual noise
    " especially when splits are used.
    " set completeopt-=preview

    nnoremap <leader>jd :YcmCompleter GoTo<CR>
    let g:ycm_show_diagnostics_ui = 0
endif
