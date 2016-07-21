set autoread
if !has("gui_running")
    augroup checktime
        autocmd!
        autocmd BufEnter     * silent! checktime
        autocmd CursorHold   * silent! checktime
        autocmd CursorHoldI  * silent! checktime
        autocmd CursorMoved  * silent! checktime
        autocmd CursorMovedI * silent! checktime
    augroup END
endif
