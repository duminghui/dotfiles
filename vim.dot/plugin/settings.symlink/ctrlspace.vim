
" 'vim-ctrlspace/vim-ctrlspace'
if g:vim_plug.is_ready('vim-ctrlspace')
    let g:CtrlSpaceUseTabline = 0
    set showtabline=0
    if has('gui_running')
        let g:CtrlSpaceSymbols = { "File": "◯", "CTab": "▣", "Tabs": "▢" }
    endif
endif
