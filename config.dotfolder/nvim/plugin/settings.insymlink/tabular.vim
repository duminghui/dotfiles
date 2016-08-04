" 'godlygeek/tabular'

if g:vim_plug.is_ready('tabular')
    nmap <Leader>a& :Tabularize /&<CR>
    vmap <Leader>a& :Tabularize /&<CR>
    nmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
    vmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
    nmap <Leader>a=> :Tabularize /=><CR>
    vmap <Leader>a=> :Tabularize /=><CR>
    nmap <Leader>a: :Tabularize /:<CR>
    vmap <Leader>a: :Tabularize /:<CR>
    nmap <Leader>a:: :Tabularize /:\zs<CR>
    vmap <Leader>a:: :Tabularize /:\zs<CR>
    nmap <Leader>a, :Tabularize /,<CR>
    vmap <Leader>a, :Tabularize /,<CR>
    nmap <Leader>a,, :Tabularize /,\zs<CR>
    vmap <Leader>a,, :Tabularize /,\zs<CR>
    nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
    vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
    nmap <Leader>a* :Tabularize /*<CR>
    vmap <Leader>a* :Tabularize /*<CR>
    nmap <Leader>aa :Tabularize assignment<CR>
    vmap <Leader>aa :Tabularize assignment<CR>
    nmap <Leader>ap :Tabularize argument_list<CR>
    vmap <Leader>ap :Tabularize argument_list<CR>
    nmap <Leader>ams :Tabularize multiple_spaces<CR>
    nmap <Leader>ams :Tabularize multiple_spaces<CR>
    vmap <Leader>at :Tabularize ternary_operator<CR>
    vmap <Leader>at :Tabularize ternary_operator<CR>
endif
