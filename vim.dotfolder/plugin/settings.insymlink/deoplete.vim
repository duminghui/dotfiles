" 'Shougo/deoplete.nvim'

if g:vim_plug.is_ready('deoplete.nvim')
    " deoplete.nvim recommend
    set completeopt+=noselect
    set completeopt-=preview

    let g:deoplete#enable_at_startup = 1
    call deoplete#custom#option({
                \ 'auto_complete': v:true,
                \ 'smart_case': v:true,
                \ })

    inoremap <silent><expr> <TAB>
                \ pumvisible() ? "\<C-n>" :
                \ <SID>check_back_space() ? "\<TAB>" :
                \ deoplete#mappings#manual_complete()

    function! s:check_back_space() abort "{{{
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~ '\s'
    endfunction "}}}
endif
