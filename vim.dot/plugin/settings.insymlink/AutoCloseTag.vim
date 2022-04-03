
" Make it so AutoCloseTag works for xml and xhtml files as well
au FileType xhtml,xml runtime ftplugin/html/autoclosetag.vim
nmap <Leader>ac <Plug>ToggleAutoCloseMappings
