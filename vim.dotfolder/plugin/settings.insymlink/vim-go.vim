" 'fatih/vim-go'

" 先不加判断, plug的for会引起不加入到rtp里
" if g:vim_plug.is_ready('vim-go')

augroup vim_go_augroup
    autocmd!
    if g:vim_plug.is_ready('denite.nvim')
        autocmd FileType go nnoremap <buffer> <leader>dd :Denite decls:%<CR>
    endif
    if g:vim_plug.is_ready('deoplete.nvim')
        " go与gopls的配置 但是用了这个之后ctrl-j,k就不起作用了
        " 不用这个第三方的依赖就不能显示子成员
        call deoplete#custom#option('omni_patterns', {
                    \ 'go': '[^. *\t]\.\w*',
                    \ })
    endif
    autocmd FileType go setlocal nospell
    " autocmd FileType go setlocal updatetime=300
    " autocmd FileType go setlocal autowrite

    " autocmd FileType go nmap <leader>gb   <Plug>(go-build)
    autocmd FileType go nmap <buffer> <leader>gr   <Plug>(go-run)
    autocmd FileType go nmap <buffer> <leader>gt   <Plug>(go-test)
    autocmd FileType go nmap <buffer> <leader>gd   <Plug>(go-def-split)
    " autocmd FileType go nnoremap <buffer> <leader>gis  <Plug>(go-imports)
    autocmd FileType go nmap <buffer> <leader>gc   <Plug>(go-coverage-toggle)
    autocmd FileType go nmap <buffer> <leader>gi   <Plug>(go-info)

    autocmd FileType go nnoremap <buffer> <leader>gn   :<C-u>GoImport<space>
    autocmd FileType go nnoremap <buffer> <leader>gm   :<C-u>GoRename<space>
    autocmd FileType go nnoremap <buffer> <leader>gk   :<C-u>GoKeyify<CR>
    autocmd FileType go nnoremap <buffer> <leader>gf   :<C-u>GoFillStruct<CR>
    autocmd FileType go nnoremap <buffer> <leader>gs   :<C-u>GoSameIdsAutoToggle<CR>


    function! s:build_go_files()
        let l:file = expand('%')
        if l:file =~# '^\f\+_test\.go$'
            call go#test#Test(0, 1)
        elseif l:file =~# '^\f\+\.go$'
            call go#cmd#Build(0)
        endif
    endfunction
    autocmd FileType go nnoremap <buffer> <leader>gb :<C-u>call <SID>build_go_files()<CR>

    autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
    autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
    autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
    autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
    autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
augroup END

let g:go_version_warning = 1
let g:go_code_completion_enabled = 1
let g:go_null_module_warning = 1
let g:go_test_show_name = 0
let g:go_test_timeout= '10s'
" let g:go_play_browser_command = 'firefox-developer %URL% &'
" let g:go_play_browser_command = ''
let g:go_play_open_browser = 1

let g:go_auto_type_info = 0
let g:go_info_mode = 'gopls'
" let g:go_info_mode = 'guru'
" let g:go_info_mode = 'gocode'
let g:go_auto_sameids = 0
let g:go_updatetime = 300

let g:go_jump_to_error = 1

let g:go_fmt_autosave = 1
" let g:go_fmt_command = 'gofmt' "gofmt
let g:go_fmt_command = 'goimports' "gofmt
let g:go_fmt_options = {}
let g:go_fmt_fail_silently = 0
let g:go_fmt_experimental = 0

let g:go_mod_fmt_autosave = 1

" 使用K查看Doc
let g:go_doc_keywordprg_enabled = 1
let g:go_doc_max_height = 20
let g:go_doc_url = 'https://godoc.org'
let g:go_doc_popup_window = 0

let g:go_def_mode = 'gopls'
" let g:go_def_mode = 'godef'
" let g:go_def_mode = 'guru'

" 使用CTRL-]:GoDef  CTRL-t :GoDefPop
let g:go_def_mapping_enabled = 1

" Use this option to jump to an existing buffer for the split, vsplit and tab
" mappings of :GoDef. By default it's disabled.
let g:go_def_reuse_buffer = 1

" let g:go_bin_path = ""
let go_search_bin_path_first = 1

let g:go_snippet_engine = "automatic"

"Use this option to disable updating dependencies with |:GoInstallBinaries|. By
" default this is enabled.
let g:go_get_update = 1

let g:go_guru_scope = []

let g:go_build_tags = ''

let g:go_autodetect_gopath = 0

let g:go_textobj_enabled = 1
let g:go_textobj_include_function_doc = 1
let g:go_textobj_include_variable = 1

let g:go_metalinter_autosave = 0
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_disabled = []
let g:go_metalinter_command = "gometalinter"
let g:go_metalinter_command = "golangci-lint"
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
let g:go_term_mode = "vsplit"
let g:go_term_mode = "split"
let g:go_term_height = 15
let g:go_term_width = 30
let g:go_term_enabled = 1
let g:go_term_close_on_exit = 1

let g:go_alternate_mode = "edit"
" let g:go_gorename_prefill = 'expand("<cword>") =~# "^[A-Z]"' .
"             \ '? go#util#pascalcase(expand("<cword>"))' .
"             \ ': go#util#camelcase(expand("<cword>"))'

" not support for gocode
" let g:go_gocode_propose_builtins = 1
" let g:go_gocode_propose_source = 0
" let g:go_gocode_unimported_packages = 0
" let g:go_gocode_socket_type = 'unix'
" let g:go_gocode_socket_type = 'tcp'

let g:go_template_autocreate = 1
" let g:go_template_file = "hello_world.go"
" let g:go_template_test_file = "hello_world_test.go"
let g:go_template_use_pkg = 0

let g:go_decls_includes = 'func,type'
"`ctrlp.vim` or `fzf`.
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
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_format_strings = 1
" Highlight variable names in variable declarations (`x` in ` x :=`).
let g:go_highlight_variable_declarations = 1
" Highlight variable names in variable assignments (`x` in `x =`).
let g:go_highlight_variable_assignments = 1

" endif
