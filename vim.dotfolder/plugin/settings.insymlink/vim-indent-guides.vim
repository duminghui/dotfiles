" 'nathanaelkane/vim-indent-guides'

if g:vim_plug.is_ready('vim-indent-guides')
    let g:indent_guides_start_level = 2
    let g:indent_guides_guide_size = 1
    let g:indent_guides_enable_on_vim_startup = 1
    let g:indent_guides_color_change_percent = 10
    let g:indent_guides_space_guides = 1
    let g:indent_guides_tab_guides = 1
    let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
    let g:indent_guides_exclude_filetypes = ['help']
    "<leader>ig
    let g:indent_guides_default_mapping = 1
endif
