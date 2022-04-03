" 'vim-syntastic/syntastic'

if g:vim_plug.is_ready('syntastic')
    " auto fill the |location-list| with the errors found
    " default 0
    let g:syntastic_always_populate_loc_list = 1
    " the cursor to jump to the first detected issue when saveing or opening a file
    " default 0
    " 0: no jump
    " 1: always to jump
    " 2: only if issue is an error
    " 3: all issues detected are warning
    let g:syntastic_auto_jump = 0
    " automatically open and/or close the location-list
    " default 2
    " 0: neither
    " 1: automatically opened when errors are detected,and closed when none are detected
    " 2: automatically closed when no errors are detected,but not opened automatically
    " 3: automatically opend , not closed automatically
    let g:syntastic_auto_loc_list = 2
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
    let g:syntastic_loc_list_height = 5
    let g:syntastic_error_symbol = "\u2307\u2307" "⌇⌇
    let g:syntastic_warning_symbol = "\u2307" "⌇
    let g:syntastic_style_error_symbol = "\u2CFD\u2CFD" "⳽⳽
    let g:syntastic_style_warning_symbol = "\u2CFD" "⳽

    let g:syntastic_c_checkers = ['gcc']
endif
