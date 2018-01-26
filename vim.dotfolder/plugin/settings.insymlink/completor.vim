" 'maralla/completor.vim'
if g:vim_plug.is_ready('completor.vim')
    inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
    inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"

    let g:completor_auto_trigger = 0

    " 来源 https://github.com/prabirshrestha/asyncomplete.vim
    function! s:check_back_speace() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1] =~ '\s'
    endfunction

    inoremap <silent><expr> <TAB>
                \ pumvisible() ? "\<C-n>" :
                \ <SID>check_back_speace() ? "\<TAB>" :
                \ "<C-R>=completor#do('complete')<CR>"

    " inoremap <expr> <Tab> pumvisible() ? "<C-N>" : "<C-R>=completor#do('complete')<CR>"
    " inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<C-x>\<C-u>\<C-p>"
    " set completeopt=menu,preview,menuone
    set completeopt=menuone
    " let g:completor_set_options = 1
endif
