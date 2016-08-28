 " 'kshenoy/vim-signature'
if g:vim_plug.is_ready('vim-signature')
    let g:SignaturePrioritizeMarks = 1
    let g:SignatureMarkTextHLDynamic = 1
    let g:SignatureMarkerTextHLDynamic = 1
    let g:SignatureUnconditionallyRecycleMarks = 0
    " autocmd! BufReadPost * silent SignatureRefresh
endif
