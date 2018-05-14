" 'Shougo/context_filetype.vim'

if g:vim_plug.is_ready('context_filetype.vim')
    if !exists('g:context_filetype#same_filetypes')
        let g:context_filetype#same_filetypes = {}
        let g:context_filetype#same_filetypes.vim = 'vim.insymlink'
    endif
endif
