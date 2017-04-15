
" 'airblade/vim-gitgutter'
if g:vim_plug.is_ready('vim-gitgutter')
    " 是否让SignColumn的highlight和LineNr的一至(默认是1)
    let g:gitgutter_override_sign_column_highlight=1
    " let g:gitgutter_highlight_lines=1
    let g:gitgutter_signs=1
    call g:gitgutter#highlight#define_sign_column_highlight()
    " call g:utils.generate_diff_groups_highlight()
    " highlight link GitGutterAdd          MyDiffAdd
    " highlight link GitGutterChange       MyDiffChange
    " highlight link GitGutterDelete       MyDiffDelete
    " highlight link GitGutterChangeDelete MyDiffChangeDelete
endif

