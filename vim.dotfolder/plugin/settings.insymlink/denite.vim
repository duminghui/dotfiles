" 'Shougo/denite.nvim'
if g:vim_plug.is_ready('denite.nvim')
    noremap <Leader>da :Denite<space>
    noremap <Leader>dr :Denite register<CR>
    noremap <Leader>db :Denite buffer<CR>
    noremap <Leader>df :Denite file<CR>
    noremap <Leader>dj :Denite jump<CR>
    noremap <Leader>dm :Denite menu<CR>

    augroup denite_augroup
        autocmd!
        autocmd FileType denite setlocal nospell
    augroup END

    call denite#custom#option('default', {
                \ 'highlight_matched_char': 'MatchParen'
                \ })


    call denite#custom#option('_', 'statusline', v:false)
    noremap <silent><expr> <Leader>tt <SID>check_back_space()
                " \ pumvisible() ? "\<C-n>" :
                " \ <SID>check_back_space() ? "\<TAB>" :
                " \ deoplete#mappings#manual_complete()

    function! s:check_back_space() abort "{{{
        echo '####:|' . denite#get_status_mode() ."|"
    endfunction "}}}
endif
