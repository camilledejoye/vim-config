" Can't do it because the function is not loaded yet
" if exists('pdv#DocumentWithSnip')
  nnoremap <C-p> :call pdv#DocumentWithSnip()<CR>

  function! PhpDocProxy()
    call pdv#DocumentWithSnip()
    echo mode()
    echomsg mode()
  endfunction
" endif
