if exists('*packager#init')
  call packager#add('junegunn/vim-easy-align')
  " Add for test, looks easier and I always add a hard time using easy-align
  " anyway
  call packager#add('tommcdo/vim-lion')
endif

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" vim: ts=2 sw=2 et fdm=marker
