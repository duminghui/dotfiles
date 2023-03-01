" 'terryma/vim-multiple-cursors'

if g:vim_plug.is_ready('vim-multiple-cursors')
    function! g:Multiple_cursors_before()
        if exists('g:loaded_deoplete')
            call deoplete#custom#buffer_option('auto_complete', v:false)
        endif
        if exists('g:fcitx_remote')
            call UnBindAu()
            call BindAu2zhOnce()
        endif
    endfunction
    function! g:Multiple_cursors_after()
        if exists('g:loaded_deoplete')
            call deoplete#custom#buffer_option('auto_complete', v:true)
        endif
        if exists('g:fcitx_remote')
            call Fcitx2en()
            call BindAu()
        endif
    endfunction
endif
