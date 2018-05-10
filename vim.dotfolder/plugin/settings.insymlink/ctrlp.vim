" 'ctrlpvim/ctrlp.vim'
" 'tacahiroy/ctrlp-funky'
if g:vim_plug.is_ready('ctrlp.vim')
    let g:ctrlp_working_path_mode = 'ra'
    let g:ctrlp_by_filename = 1
    let g:ctrlp_funky_syntax_highlight = 1
    let g:ctrlp_map ='<c-p>'
    let g:ctrlp_cmd ='CtrlP'
    " nnoremap <silent> <D-t> :CtrlP<CR>
    " nnoremap <silent> <D-r> :CtrlPMRU<CR>
    let g:ctrlp_reuse_window = 'netrw'
    let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
    let g:ctrlp_custom_ignore = {
                \ 'dir':  '\v[\/]\.(git|hg|svn)$',
                \ 'file': '\v\.(exe|so|dll|pyc)$',
                \ 'link': 'some_bad_symbolic_links',
                \ }
    " let g:ctrlp_custom_ignore = {
                " \ 'dir':  '\.git$\|\.hg$\|\.svn$',
                " \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }

    if executable('ag')
        let s:ctrlp_fallback = 'ag %s --nocolor -l -g ""'
    elseif executable('ack-grep')
        let s:ctrlp_fallback = 'ack-grep %s --nocolor -f'
    elseif executable('ack')
        let s:ctrlp_fallback = 'ack %s --nocolor -f'
        " On Windows use "dir" as fallback command.
    else
        let s:ctrlp_fallback = 'find %s -type f'
    endif
    if exists("g:ctrlp_user_command")
        unlet g:ctrlp_user_command
    endif
    let g:ctrlp_user_command = {
                \ 'types': {
                \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
                \ 2: ['.hg', 'hg --cwd %s locate -I .'],
                \ },
                \ 'fallback': s:ctrlp_fallback
                \ }

    if g:vim_plug.is_ready('ctrlp-funky')
        " CtrlP extensions
        let g:ctrlp_extensions = ['funky']

        "funky
        nnoremap <Leader>fu :CtrlPFunky<Cr>
    endif
endif
