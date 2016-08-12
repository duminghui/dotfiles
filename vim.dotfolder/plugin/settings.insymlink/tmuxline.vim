" 'edkolev/tmuxline.vim'
if g:vim_plug.is_ready('tmuxline.vim')
    let g:tmuxline_powerline_separators = 0
    let g:tmuxline_separators = {
                \ 'left'      : '⮀',
                \ 'left_alt'  : '|',
                \ 'right'     : '⮂',
                \ 'right_alt' : '|',
                \ 'space'     : ' '
                \ }
    let g:tmuxline_preset = {
                \ 'a'           : '#S',
                \ 'win'         : ['#I:#W'],
                \ 'cwin'        : ['#I:#W'],
                \ 'z'           : ['#{?client_prefix,%R | ⑇,%R}'],
                \ 'options'     : {'status-justify'              : 'left'},
                \ 'win_options' : {'window-status-activity-attr' : 'none'}
                \ }
    nnoremap <expr> <Leader>mtc exists(':TmuxlineSnapshot') ? ":TmuxlineSnapshot! ~/.tmux.conf.colors<CR>" : ":echo ':TmuxlineSnapshot Not Exist'<CR>"
endif
