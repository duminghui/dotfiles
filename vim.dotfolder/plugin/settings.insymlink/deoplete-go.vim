" 'zchee/deoplete-go'

" 先不加判断, plug的for会引起不加入到rtp里
" if g:vim_plug.is_ready('vim-go')

let g:deoplete#sources#go#package_dot = 0
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#pointer = 0

" endif

