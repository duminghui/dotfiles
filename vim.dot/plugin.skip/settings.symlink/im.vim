" 普通模式与输入模式间的输入法切换
if (has("win64"))
    augroup im
        autocmd!
        autocmd InsertLeave,BufEnter * :silent :!im-select.exe 1033
    augroup END
endif
