" 'fatih/vim-go'

" 先不加判断, plug的for会引起不加入到rtp里
" if g:vim_plug.is_ready('vim-go')
let g:go_test_show_name = 0
let g:go_test_timeout= '10s'
" let g:go_play_browser_command = 'firefox-developer %URL% &'
" let g:go_play_browser_command = ''
let g:go_play_open_browser = 1

let g:go_auto_type_info = 0
let g:go_info_mode = 'guru'
" let g:go_info_mode = 'gocode'
let g:go_auto_sameids = 1
let g:go_updatetime = 800

let g:go_jump_to_error = 1

let g:go_fmt_autosave = 1
let g:go_fmt_command = 'gofmt'
let g:go_fmt_options = {}
let g:go_fmt_fail_silently = 0
let g:go_fmt_experimental = 0

" 使用K查看Doc
let g:go_doc_keywordprg_enabled = 1
let g:go_doc_max_height = 20
let g:go_doc_url = 'https://godoc.org'

let g:go_def_mode = 'godef'
let g:go_def_mode = 'guru'

" 使用CTRL-]:GoDef  CTRL-t :GoDefPop
let g:go_def_mapping_enabled = 1

let g:go_def_reuse_buffer = 0

let g:go_doc_command = ["godoc"]

" let g:go_bin_path = ""

let g:go_snippet_engine = "automatic"

"Use this option to disable updating dependencies with |:GoInstallBinaries|. By
" default this is enabled.
let g:go_get_update = 1

let g:go_guru_scope = []

let g:go_build_tags = ''

let g:go_autodetect_gopath = 0

let g:go_textobj_enabled = 1
let g:go_textobj_include_variable = 1

let g:go_metalinter_autosave = 0
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_disabled = []
let g:go_metalinter_command = ""
let g:go_metalinter_deadline = "5s"

" let g:go_list_height = 0
" let g:go_list_type = ""
" let g:go_list_type = "quickfix"
" let g:go_list_type = "locationlist"
" let g:go_list_type_commands = {}
" As an example, the following settings will change all list types to
" `locationlist` except for `:GoBuild` where `quickfix` is used:
" let g:go_list_type = "locationlist"
" let g:go_list_type_commands = {"GoBuild": "quickfix"}
let g:go_list_autoclose = 1

let g:go_asmfmt_autosave = 0

"Neovim only
" let g:go_term_mode = "vsplit"
" let g:go_term_height = 30
" let g:go_term_width = 30
" let g:go_term_enabled = 1

let g:go_alternate_mode = "edit"
" let g:go_gorename_prefill = 'expand("<cword>") =~# "^[A-Z]"' .
"             \ '? go#util#pascalcase(expand("<cword>"))' .
"             \ ': go#util#camelcase(expand("<cword>"))'

let g:go_gocode_autobuild = 1
let g:go_gocode_propose_builtins = 1
let g:go_gocode_unimported_packages = 1
let g:go_gocode_socket_type = 'tcp'
let g:go_gocode_socket_type = 'unix'

let g:go_template_autocreate = 1
" let g:go_template_file = "hello_world.go"
" let g:go_template_test_file = "hello_world_test.go"
let g:go_template_use_pkg = 0

let g:go_decls_includes = 'func,type'
let g:go_decls_mode = ''

let g:go_echo_command_info = 1
let g:go_echo_go_info = 1
" 60 seconds
let g:go_statusline_duration = 60000

let g:go_addtags_transform = 'camelcase'
let g:go_addtags_transform = 'snakecase'

" let g:go_debug = []

" 在foldmetho=syntax时起作用
let g:go_fold_enable = ['block', 'import', 'varconst', 'package_comment']

let g:go_highlight_array_whitespace_error = 1
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
let g:go_highlight_generate_tags = 1
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1

" endif
