" 'zchee/deoplete-go'

" 先不加判断, plug的for会引起不加入到rtp里
" if g:vim_plug.is_ready('vim-go')
let g:deoplete#sources#go#gocode_binary = ''
" let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode-gomod'
" let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gopls'
let g:deoplete#sources#go#package_dot = 0
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#pointer = 1
let g:deoplete#sources#go#cgo = 0
let g:deoplete#sources#go#cgo#libclang_path = ''
let g:deoplete#sources#go#cgo#std = 'c11'
let g:deoplete#sources#go#auto_goos = 0
let g:deoplete#sources#go#source_importer = 1
let g:deoplete#sources#go#builtin_objects = 1
let g:deoplete#sources#go#unimported_packages = 1
let g:deoplete#sources#go#fallback_to_source = 1

" endif

