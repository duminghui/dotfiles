" 'vim-scripts/restore_view.vim'
if g:vim_plug.is_ready('restore_view.vim')
    " Add exclusions to mkview and loadview
    " eg: *.*, svn-commit.tmp
    let g:skipview_files = [
                \ '\[example pattern\]'
                \ ]
endif
