if 0 == exists('ncm2#enable_for_buffer')
  finish
endif

" Enable NCM2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" vim: et ts=2 sw=2 fdm=marker
