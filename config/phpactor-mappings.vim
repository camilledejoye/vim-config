let g:phpactorActivateOverlapingMappings = v:true

" Should be `pm` to be logic but `pp` is easiest and faster since I use it a lot
let g:phpactorCustomMappings = [
  \ ['<Leader>pp', '<Plug>phpactorContextMenu', 'n'],
  \ ['<Leader>pn', '<Plug>phpactorNavigate', 'n'],
  \ ['<Leader>pt', '<Plug>phpactorTransform', 'n'],
  \ ['<Leader>hh', '<Plug>phpactorHover', 'n'],
\ ]

" vim: et ts=2 sw=2 fdm=marker
