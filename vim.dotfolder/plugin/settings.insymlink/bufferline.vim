
" 'bling/vim-bufferline'
if g:vim_plug.is_ready('vim-bufferline')
    let g:bufferline_echo = 0
    let g:bufferline_rotate = 1
    let g:bufferline_fixed_index =  0 "always first
    let g:bufferline_fname_mod = ':t:s?^$?[No Name]?'
endif
