" 'altercation/vim-colors-solarized'
if g:vim_plug.is_ready('vim-colors-solarized')
    let g:solarized_termcolors=256
    let g:solarized_contrast="normal"
    let g:solarized_visibility="normal"
    " 配置DiffAdd,DiffChange,DiffDelete,DiffText的highlight显示样式，默认normal
    let g:solarized_diffmode="normal"
    call togglebg#map("<F5>")
    " 这个是反转显示背景色和当前行highlight的一些配置，使用drak用1比较好
    if 1
        let g:solarized_termtrans=1
        set background=dark
    else
        let g:solarized_termtrans=0
        set background=light
    endif
    syntax enable
    " set background=light
    colorscheme solarized             " Load a colorscheme
    highlight clear SignColumn      " SignColumn should match background
    highlight clear LineNr          " Current line number row will have same background color in relative mode
    " highlight CursorLineNr ctermfg=136 ctermbg=235
    " let s:highlight = g:utils.get_highlight_colors('LineNr',  'ctermbg',  'guibg')
    " call extend(s:highlight,  {'ctermfg':136,  'guifg':'#b58900'})
    " call g:utils.generate_highlight('CursorLineNr',  s:highlight)

    call g:utils.generate_highlight('CursorLineNr',  {'LineNr':  ['ctermbg',  'guibg']},  {'ctermfg' :  136,  'guifg' :  '#b58900'})
    " highlight CursorLineNr ctermfg=136 guifg='#b58900'
    "highlight clear CursorLineNr    " Remove highlight color from current line number
endif

