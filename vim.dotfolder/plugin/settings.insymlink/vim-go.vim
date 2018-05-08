" 'fatih/vim-go'

" 先不加判断, plug的for会引起不加入到rtp里
" if g:vim_plug.is_ready('vim-go')

let g:go_auto_type_info = 0
let g:go_info_mode = 'guru'
let g:go_info_mode = 'gocode'
let g:go_auto_sameids = 1
let g:go_jump_to_error = 1
let g:go_fmt_autosave = 1
let g:go_fmt_command = 'gofmt'
let g:go_fmt_options = {}
let g:go_fmt_fail_silently = 1
let g:go_fmt_experimental = 0
" 使用K查看Doc
let g:go_doc_keywordprg_enabled = 1
let g:go_def_mode = 'godef'
let g:go_def_mode = 'guru'
" 使用CTRL-]:GoDef  CTRL-t :GoDefPop
let g:go_def_mapping_enabled = 1
let g:go_def_reuse_buffer = 1
"Use this option to disable updating dependencies with |:GoInstallBinaries|. By
" default this is enabled.
let g:go_get_update = 1
let g:go_textobj_enabled = 1
let g:go_textobj_include_variable = 1
let g:go_metalinter_autosave = 0
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_disabled = []
let g:go_gocode_autobuild = 1
let g:go_gocode_unimported_packages = 0
let g:go_echo_command_info = 1
let g:go_echo_go_info = 1
" 60 seconds
let g:go_statusline_duration = 60000
let g:go_addtags_transform = 'camelcase'
let g:go_addtags_transform = 'snakecase'
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_arguments = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_fold_enable = ['block', 'import', 'varconst', 'package_comment']

" endif
