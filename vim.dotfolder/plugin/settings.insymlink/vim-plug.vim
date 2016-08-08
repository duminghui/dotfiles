let g:plug_window='tabnew'
function! s:plug_gx()
    let line = getline('.')
    let sha = matchstr(line, '^ \X*\zs\x\{7}\ze ')
    let name = empty(sha) ? matchstr(line, '^[-x+] \zs[^:]\+\ze:')
                \ : getline(search('^- .*:$', 'bn'))[2:-2]
    let uri = get(get(g:plugs, name, {}), 'uri', '')
    if uri !~ 'github.com'
        return
    endif
    let repo = matchstr(uri, '[^:/]*/' . name)
    let url = empty(sha) ? 'https://github.com/' . repo
                \ : printf('https://github.com/%s/commit/%s', repo, sha)
    call netrw#BrowseX(url, 0)
endfunction

augroup PlugGx
    autocmd!
    autocmd FileType vim-plug nnoremap <buffer> <silent> gx :call <sid>plug_gx()<cr>
augroup END

function! s:plug_doc()
  let name = matchstr(getline('.'), '^- \zs\S\+\ze:')
  if has_key(g:plugs, name)
    for doc in split(globpath(g:plugs[name].dir, 'doc/*.txt'), '\n')
      execute 'tabe' doc
    endfor
  endif
endfunction

augroup PlugHelp
  autocmd!
  autocmd FileType vim-plug nnoremap <buffer> <silent> H :call <sid>plug_doc()<cr>
augroup END

function! s:scroll_preview(down)
  silent! wincmd P
  if &previewwindow
    execute 'normal!' a:down ? "\<c-e>" : "\<c-y>"
    wincmd p
  endif
endfunction

" J / K to scroll the preview window
" CTRL-N / CTRL-P to move between the commits
" CTRL-J / CTRL-K to move between the commits and synchronize the preview window

function! s:setup_extra_keys()
  nnoremap <silent> <buffer> J :call <sid>scroll_preview(1)<cr>
  nnoremap <silent> <buffer> K :call <sid>scroll_preview(0)<cr>
  nnoremap <silent> <buffer> <c-n> :call search('^  \X*\zs\x')<cr>
  nnoremap <silent> <buffer> <c-p> :call search('^  \X*\zs\x', 'b')<cr>
  nmap <silent> <buffer> <c-j> <c-n>o
  nmap <silent> <buffer> <c-k> <c-p>o
endfunction

augroup PlugDiffExtra
  autocmd!
  autocmd FileType vim-plug call s:setup_extra_keys()
augroup END

"  需要vim作特别的配置，暂时不用
" ----------------------------------------------------------------------------
" vimawesome.com
" ----------------------------------------------------------------------------
" function! VimAwesomeComplete() abort
"   let prefix = matchstr(strpart(getline('.'), 0, col('.') - 1), '[.a-zA-Z0-9_/-]*$')
"   echohl WarningMsg
"   echo 'Downloading plugin list from VimAwesome'
"   echohl None
" ruby << EOF
"   require 'json'
"   require 'open-uri'

"   query = VIM::evaluate('prefix').gsub('/', '%20')
"   items = 1.upto(max_pages = 3).map do |page|
"     Thread.new do
"       url  = "http://vimawesome.com/api/plugins?page=#{page}&query=#{query}"
"       data = open(url).read
"       json = JSON.parse(data, symbolize_names: true)
"       json[:plugins].map do |info|
"         pair = info.values_at :github_owner, :github_repo_name
"         next if pair.any? { |e| e.nil? || e.empty? }
"         {word: pair.join('/'),
"          menu: info[:category].to_s,
"          info: info.values_at(:short_desc, :author).compact.join($/)}
"       end.compact
"     end
"   end.each(&:join).map(&:value).inject(:+)
"   VIM::command("let cands = #{JSON.dump items}")
" EOF
"   if !empty(cands)
"     inoremap <buffer> <c-v> <c-n>
"     augroup _VimAwesomeComplete
"       autocmd!
"       autocmd CursorMovedI,InsertLeave * iunmap <buffer> <c-v>
"             \| autocmd! _VimAwesomeComplete
"     augroup END

"     call complete(col('.') - strchars(prefix), cands)
"   endif
"   return ''
" endfunction

" augroup VimAwesomeComplete
"   autocmd!
"   autocmd FileType vim inoremap <c-x><c-v> <c-r>=VimAwesomeComplete()<cr>
" augroup END
