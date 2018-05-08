set background=dark
" set background=light
syntax enable
" let g:hybrid_custom_term_colors = 0
" let g:hybird_reduced_contrast = 0
colorscheme hybrid_material
" colorscheme solarized
highlight clear signcolumn      " signcolumn should match background
highlight clear linenr          " current line number row will have same background color in relative mode
" highlight clear Normal
" call g:utils.generate_highlight('CursorLineNr',  {'LineNr':  ['ctermbg',  'guibg']},  {'ctermfg' :  136,  'guifg' :  '#b58900'})
call g:utils.generate_highlight('CursorLineNr',  {'LineNr':  ['ctermbg',  'guibg']},  {'ctermfg' :  167,  'guifg' :  '#A54242'})
highlight Normal ctermbg=236
highlight Comment ctermfg=247
highlight VertSplit ctermfg=247

