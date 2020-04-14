" 'w0rp/ale'
if g:vim_plug.is_ready('ale')
    let g:ale_sign_error = "\u2307\u2307" "⌇⌇
    let g:ale_sign_warning = "\u2307" "⌇
    let g:ale_sign_style_error = "\u2CFD\u2CFD" "⳽⳽
    let g:ale_sign_style_warning = "\u2CFD" "⳽

    let g:ale_lint_on_text_changed = 'never'
    let g:ale_lint_on_enter = 1
    let g:ale_set_loclist = 0
    let g:ale_set_quickfix = 1
    " let g:ale_open_list = 1
    let g:ale_linters = {'go': ['gopls']}
endif
