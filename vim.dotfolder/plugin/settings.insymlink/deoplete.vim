" 'Shougo/deoplete.nvim'

if g:vim_plug.is_ready('deoplete.nvim')
    let g:deoplete#enable_at_startup = 1
    " deoplete.nvim recommend
    set completeopt+=noselect
    set completeopt+=noinsert
    set completeopt-=preview
    " 设置全局的option 参数有两种形式, 一种是key:value 一种是{}
    call deoplete#custom#option({
                \ 'auto_complete': v:true,
                \ 'auto_complete_delay': 300,
                \ 'auto_refresh_delay': 20,
                \ 'camel_case': v:true,
                \ 'ignore_case': v:true,
                \ 'ignore_sources': {},
                \ 'max_list': 300,
                \ 'num_processes': 4,
                \ 'on_insert_enter': v:true,
                \ 'on_text_changed_i': v:true,
                \ 'profile': v:false,
                \ 'prev_completion_mode': 'filter',
                \ 'refresh_always': v:true,
                \ 'skip_multibyte': v:false,
                \ 'skip_chars': ['(', ')'],
                \ 'smart_case': v:true,
                \ 'min_pattern_length': 2,
                \ 'yarp': v:false,
                \ })

    " inoremap <expr>A pumvisible() ? deoplete#insert_candidate(0) : 'A'
    " inoremap <expr>S pumvisible() ? deoplete#insert_candidate(1) : 'S'
    " inoremap <expr>D pumvisible() ? deoplete#insert_candidate(2) : 'D'
    " inoremap <expr>F pumvisible() ? deoplete#insert_candidate(3) : 'F'
    " inoremap <expr>G pumvisible() ? deoplete#insert_candidate(4) : 'G'

    " " go与gopls的配置
    " call deoplete#custom#option('omni_patterns', {
    "             \ 'go': '[^. *\t]\.\w*',
    "             \ })

    " " call deoplete#custom#option('keyword_patterns', {
    " " \ '_': '[a-zA-Z_]\k*',
    " \ 'tex': '\\?[a-zA-Z_]\w*',
    " \ 'ruby': '[a-zA-Z_]\w*[!?]?',
    " \})
    "
    " option: source 设置文件加载的source '_': 用于默认的文件类型
    " call deoplete#custom#option('sources',{
    " \ '_': ['buffer'],
    " \ 'cpp': ['buffer', 'tag'],
    " })
    call deoplete#custom#var('around', {
                \   'range_above': 15,
                \   'range_below': 15,
                \   'mark_above': '[↑]',
                \   'mark_below': '[↓]',
                \   'mark_changes': '[*]',
                \})
    call deoplete#custom#source('_','matchers',['matcher_full_fuzzy'])
    " call deoplete#custom#source('_', 'sorters', ['sorter_word'])
    call deoplete#custom#source('_', 'sorters', ['sorter_rank'])
    call deoplete#custom#source('ultisnips', 'rank', 200)
    call deoplete#custom#source('ultisnips', 'min_pattern_length', 1)
    call deoplete#custom#source('neosnippet', 'rank', 200)
    call deoplete#custom#source('neosnippet', 'min_pattern_length', 1)
    " 查看配置的结果
    " echo deoplete#custom#_get()
    " echo deoplete#custom#_get_source_vars('omni')
    " echo deoplete#custom#_get_option('min_pattern_length')
    noremap <leader>deo :echo json_encode(deoplete#custom#_get())<cr>

    inoremap <silent><expr> <TAB>
                \ pumvisible() ? "\<C-n>" :
                \ <SID>check_back_space() ? "\<TAB>" :
                \ deoplete#manual_complete()

    function! s:check_back_space() abort "{{{
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~ '\s'
    endfunction "}}}
endif
