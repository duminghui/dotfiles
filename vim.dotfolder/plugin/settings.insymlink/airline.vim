" 'vim-airline/vim-airline'
" 'vim-airline/vim-airline-themes'
if g:vim_plug.is_ready('vim-airline')
    set laststatus=2
    let g:airline_powerline_fonts = 1
    set t_Co=256

    let g:airline_theme='powerlineish'
    let g:airline_theme='hybridline'
    let g:airline_theme='hybrid'
    let g:airline_theme='badwolf'
    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif
    let g:airline_left_sep = ''
    let g:airline_left_sep = "\ue0b0"
    let g:airline_left_alt_sep = ''
    let g:airline_left_alt_sep = "\ue0b1"
    let g:airline_left_alt_sep = '|'
    let g:airline_right_sep = ''
    let g:airline_right_sep = "\ue0b2"
    let g:airline_right_alt_sep = ''
    let g:airline_right_alt_sep = "\ue0b3"
    let g:airline_right_alt_sep = '|'
    let g:airline_symbols.crypt = '🔒'
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.readonly = "\ue0a2"
    let g:airline_symbols.linenr = ''
    let g:airline_symbols.linenr = "\ue0a1"
    let g:airline_symbols.maxlinenr = '☰'
    let g:airline_symbols.branch = ''
    let g:airline_symbols.branch = "\ue0a0"
    let g:airline_symbols.paste = 'Þ'
    let g:airline_symbols.spell = 'Ꞩ'
    let g:airline_symbols.notexists = '∄'
    let g:airline_symbols.whitespace = 'Ξ'

    " let g:airline_extensions = []

    " let g:airline#extensions#default#layout = [
    "       \ [ 'a', 'b', 'c'  ],
    "       \ [ 'x', 'y', 'z', 'warning','error'  ]
    "       \ ]

    let g:airline#extensions#bufferline#enabled = 1
    let g:airline#extensions#bufferline#overwrite_variables = 1

    let g:airline#extensions#branch#enabled = 1
    let g:airline#extensions#branch#empty_message = ''
    let g:airline#extensions#branch#use_vcscommand = 0
    let g:airline#extensions#branch#displayed_head_limit = 10
    let g:airline#extensions#branch#format = 2
    " let g:airline#extensions#branch#format = 'CustomBranchName'
    " function! CustomBranchName(name)
    "     return '[' . a:name .']'
    " endfunction
    " 是否显示语法错误 在error位置显示
    let g:airline#extensions#syntastic#enabled = 1
    let g:airline#extensions#ale#enable = 1

    " 是否在状态栏显示修改状态(添加，修改，删除)
    let g:airline#extensions#hunks#enabled = 1
    " 如果状态的数值为0，则不显示相应的状态数
    let g:airline#extensions#hunks#non_zero_only = 1

    let g:airline#extensions#whitespace#enabled = 1

    let g:airline#extensions#tabline#enabled = 1
    " 这个决定在多个tab时,tab_label的位置显示tab_lable(0)或是显示当前编辑的buffer的名称(1)
    let g:airline#extensions#tabline#show_splits = 0
    " 交换buffers和tabs的显示位置
    let g:airline#extensions#tabline#switch_buffers_and_tabs = 0
    " 显示buffers_label在tabline上
    let g:airline#extensions#tabline#show_buffers = 1
    " 如果之前没有tab在新建一个tab时，已经打开的buffers会收集到一个新tab中(1),否则还是以buffer_list的形式展示
    let g:airline#extensions#tabline#show_tabs = 1
    let g:airline#extensions#tabline#exclude_preview = 1
    let g:airline#extensions#tabline#tab_nr_type = 2
    let g:airline#extensions#tabline#show_tab_nr = 1
    " 是否显示tab（far right）这个决定是否显示右上角的buffer_label/tab_lable
    let g:airline#extensions#tabline#show_tab_type = 1
    " let g:airline#extensions#tabline#show_tab_type = 0
    let g:airline#extensions#tabline#show_close_button = 0
    " 配置buffers显示的标签
    let g:airline#extensions#tabline#buffers_label = 'b'
    let g:airline#extensions#tabline#tabs_label = 't'
    " let g:airline#extensions#tabline#formatter = 'default'
    " let g:airline#extensions#tabline#formatter = 'unique_tail'
    let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
    let g:airline#extensions#tabline#buffer_nr_show = 1
    let g:airline#extensions#tabline#buffer_nr_format = '%s: '
    " let g:airline#extensions#tabline#fnamemod=':p:.'
    " let g:airline#extensions#tabline#fnamemod=':t'
    "是否将父目录的文件名省略到一个字符显示
    let g:airline#extensions#tabline#fnamecollapse = 1
    " 处于非活动状态的tab文件名显示位数
    let g:airline#extensions#tabline#fnametruncate = 0
    let g:airline#extensions#tabline#buffer_min_count = 0
    let g:airline#extensions#tabline#tab_min_count = 0
    " let g:airline#extensions#tabline#ignore_bufadd_pat =
    " \ '\c\vgundo|undotree|vimfiler|tagbar|nerd_tree'
    " let airline#extensions#tabline#disable_refresh = 0
    " 这个好像没起作用，在代码中没有看到这个的引用
    let g:airline#extensions#ctrlspace#enabled = 1
    " let g:CtrlSpaceStatuslineFunction = "airline#extensions#ctrlspace#statusline()"
    " let g:airline_exclude_preview = 1

    " 以下四项如果不配置默认使用ariline相关的配置
    " let g:airline#extensions#tabline#left_sep = '⮀'
    " let g:airline#extensions#tabline#left_alt_sep = '|'
    " let g:airline#extensions#tabline#right_sep = '⮂'
    " let g:airline#extensions#tabline#right_alt_sep = '|'

    let g:airline#extensions#tabline#buffer_idx_mode = 1
    nmap <leader>1 <Plug>AirlineSelectTab1
    nmap <leader>2 <Plug>AirlineSelectTab2
    nmap <leader>3 <Plug>AirlineSelectTab3
    nmap <leader>4 <Plug>AirlineSelectTab4
    nmap <leader>5 <Plug>AirlineSelectTab5
    nmap <leader>6 <Plug>AirlineSelectTab6
    nmap <leader>7 <Plug>AirlineSelectTab7
    nmap <leader>8 <Plug>AirlineSelectTab8
    nmap <leader>9 <Plug>AirlineSelectTab9
    nmap <leader>- <Plug>AirlineSelectPrevTab
    nmap <leader>+ <Plug>AirlineSelectNextTab

    let g:airline#extensions#tmuxline#enabled = 0
    let g:airline#extensions#tmuxline#snapshot_file = '~/.tmux.conf.colors.new'
endif
