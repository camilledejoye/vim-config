if exists(':Tabularize')
    " For assignments
    nmap <Leader>t= :Tabularize /=<CR>
    vmap <Leader>t= :Tabularize /=<CR>

    " For Doxygen tag @param type $var desc
    nmap <Leader>tà :Tabularize /$\w*<CR>
    vmap <Leader>tà :Tabularize /$\w*<CR>

    " For function params on a line
    " Ex. : $db->bind('name', $var, -1);
    "       $db->bind('anotherName', $anotherVar, -1);
    nmap <Leader>t, :Tabularize /,\zs/l0l1<CR>
    vmap <Leader>t, :Tabularize /,\zs/l0l1<CR>

    " For JSON syntax
    nmap <Leader>t: :Tabularize /:\zs/l0l1<CR>
    vmap <Leader>t: :Tabularize /:\zs/l0l1<CR>

    " For variables, ex.: multiple lines function definition
    nmap <Leader>t$ :Tabularize /\$/l1c0<CR>
    vmap <Leader>t$ :Tabularize /\$/l1c0<CR>
endif
