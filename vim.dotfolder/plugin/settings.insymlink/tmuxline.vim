" 'edkolev/tmuxline.vim'
if g:vim_plug.is_ready('tmuxline.vim')
    let g:tmuxline_powerline_separators = 0
    let g:tmuxline_separators = {
                \ 'left'      : '\ue0b0',
                \ 'left_alt'  : '|',
                \ 'right'     : '\ue0b2',
                \ 'right_alt' : '|',
                \ 'space'     : ' '
                \ }
    let g:tmuxline_preset = {
                \ 'a'           : ['#{?client_prefix,#{socket_path} | #S | #{session_attached}⨳ | ⑇,#{socket_path} | #S | #{session_attached}⨳}'],
                \ 'win'         : ['#I:#W'],
                \ 'cwin'        : ['#I:#W'],
                \ 'z'           : ['#{?client_prefix,⑇ | %R,%R}'],
                \ 'options'     : {'status-justify'              : 'left'},
                \ 'win_options' : {'window-status-activity-attr' : 'none'}
                \ }
    nnoremap <expr> <Leader>mtc exists(':TmuxlineSnapshot') ? ":TmuxlineSnapshot! ~/.tmux.conf.colors<CR>" : ":echo ':TmuxlineSnapshot Not Exist'<CR>"
endif
