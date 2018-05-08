
" 'majutsushi/tagbar'
if g:vim_plug.is_ready('tagbar')
    autocmd FileType go :TagbarOpen
    let g:tagbar_width = 33
    let g:tagbar_zoomwidth = 1
    let g:tagbar_foldlevel = 9
    let g:tagbar_autoclose = 0
    let g:tagbar_autofocus = 0
    let g:tagbar_expand = 1
    let g:tagbar_compact = 0
    let g:tagbar_autoshowtag = 1
    let g:tagbar_iconchars = ['▶', '▼']  " (default on Linux and Mac OS X)
    let g:tagbar_iconchars = ['▸', '▾']
    let g:tagbar_iconchars = ['▷', '◢']

    nnoremap <silent> <leader>tb :TagbarToggle<CR>
    let g:tagbar_type_go = {
                \ 'ctagstype' : 'go',
                \ 'kinds'     : [
                \ 'p:package',
                \ 'i:imports:1',
                \ 'c:constants',
                \ 'v:variables',
                \ 't:types',
                \ 'n:interfaces',
                \ 'w:fields',
                \ 'e:embedded',
                \ 'm:methods',
                \ 'r:constructor',
                \ 'f:functions'
                \ ],
                \ 'sro' : '.',
                \ 'kind2scope' : {
                \ 't' : 'ctype',
                \ 'n' : 'ntype'
                \ },
                \ 'scope2kind' : {
                \ 'ctype' : 't',
                \ 'ntype' : 'n'
                \ },
                \ 'ctagsbin'  : 'gotags',
                \ 'ctagsargs' : '-sort -silent'
                \ }
endif
