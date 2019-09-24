if (empty($TMUX))
    if (has("nvim"))
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    endif
    if (has("termguicolors"))
        set termguicolors
    endif
endif
" set background=dark
set background=light
syntax enable
" let g:hybrid_custom_term_colors = 0
" let g:hybird_reduced_contrast = 0
" colorscheme hybrid_material
" colorscheme solarized
colorscheme one
" colorscheme onehalflight
" colorscheme onehalfdark
" highlight clear signcolumn      " signcolumn should match background
" highlight clear linenr          " current line number row will have same background color in relative mode
" highlight clear Normal
" call g:utils.generate_highlight('CursorLineNr',  {'LineNr':  ['ctermbg',  'guibg']},  {'ctermfg' :  136,  'guifg' :  '#b58900'})
call g:utils.generate_highlight('CursorLineNr',  {'LineNr':  ['ctermbg',  'guibg']},  {'ctermfg' :  167,  'guifg' :  '#A54242'})
" if !has('nvim')
    " highlight Normal ctermfg=250 ctermbg=236
    " highlight Comment ctermfg=247
    " highlight VertSplit ctermfg=247
" endif
if has('nvim')
    set guicursor=n-v-c:hor25,i-ci-ve:hor25,r-cr:hor25,o:hor50
    "             \,a:blinkwait700-blinkoff400-blinkon250-Cursor/Cursor
    "             \,sm:block-blinkwait175-blinkoff150-blinkon175
    " let $NVIM_TUI_ENABLE_CURSOR_SHAPE=0
endif
