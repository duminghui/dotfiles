" 'Shougo/denite.nvim'
if g:vim_plug.is_ready('denite.nvim')
    noremap <Leader>da :Denite<space>
    noremap <Leader>dr :Denite register<CR>
    noremap <Leader>db :Denite buffer<CR>
    noremap <Leader>df :Denite file<CR>
    noremap <Leader>dj :Denite jump<CR>
    noremap <Leader>dm :Denite menu<CR>
    noremap <leader>den :echo denite#custom#_get()<cr>

    augroup denite_augroup
        autocmd!
        autocmd FileType denite setlocal nospell
        " autocmd FileType nerdtree :echom "BBBBBB"
        " autocmd FileType nerdtree unmap  <Leader>db
        autocmd FileType nerdtree noremap <buffer> <silent> <Leader>da :setlocal belloff=all<cr>
        autocmd FileType nerdtree noremap <buffer> <silent> <Leader>dr :setlocal belloff=all<cr>
        autocmd FileType nerdtree noremap <buffer> <silent> <Leader>db :setlocal belloff=all<cr>
        autocmd FileType nerdtree noremap <buffer> <silent> <Leader>df :setlocal belloff=all<cr>
        autocmd FileType nerdtree noremap <buffer> <silent> <Leader>dj :setlocal belloff=all<cr>
        autocmd FileType nerdtree noremap <buffer> <silent> <Leader>dm :setlocal belloff=all<cr>
    augroup END

    " 有具体的srouces名称会覆盖掉'_' source的内容
    call denite#custom#option('default', {
                \ 'highlight_matched_char': 'MatchParen',
                \ 'mode': 'normal'
                \ })
    call denite#custom#option('_', 'statusline', v:false)
    call denite#custom#option('_', 'winheight', 10)
    call denite#custom#option('_', 'mode', 'insert')
endif
