
" 'svermeulen/vim-easyclip'
if g:vim_plug.is_ready('vim-easyclip')
    nnoremap gm m
    let g:EasyClipUsePasteToggleDefaults = 0
    nmap ]y <plug>EasyClipSwapPasteForward
    nmap [y <plug>EasyClipSwapPasteBackwards
endif
