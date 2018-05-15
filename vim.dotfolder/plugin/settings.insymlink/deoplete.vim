" 'Shougo/deoplete.nvim'

if g:vim_plug.is_ready('deoplete.nvim')
    let g:deoplete#enable_at_startup = 1
    " deoplete.nvim recommend
    " set completeopt+=noselect
    set completeopt-=preview
    call deoplete#custom#option({
                \ 'auto_complete': v:true,
                \ 'smart_case': v:true,
                \ })

    " call deoplete#custom#option('keyword_patterns', {
    " \ '_': '[a-zA-Z_]\k*',
    " \ 'tex': '\\?[a-zA-Z_]\w*',
    " \ 'ruby': '[a-zA-Z_]\w*[!?]?',
    " \})

    " call deoplete#custom#source('_', 'sorters', ['sorter_word'])
    call deoplete#custom#source('_', 'sorters', ['sorter_rank'])
    call deoplete#custom#source('ultisnips', 'rank', 200)
    call deoplete#custom#source('ultisnips', 'min_pattern_length', 1)
    call deoplete#custom#source('neosnippet', 'rank', 200)
    call deoplete#custom#source('neosnippet', 'min_pattern_length', 1)
    " 查看配置的结果
    " echo deoplete#custom#_get()
    " echo deoplete#custom#_get_source_var('omni')
    " echo deoplete#custom#_get_option('min_pattern_length')
    " nmap ,emc echo deoplete#custom#_get()

    inoremap <silent><expr> <TAB>
                \ pumvisible() ? "\<C-n>" :
                \ <SID>check_back_space() ? "\<TAB>" :
                \ deoplete#mappings#manual_complete()

    function! s:check_back_space() abort "{{{
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~ '\s'
    endfunction "}}}
endif
