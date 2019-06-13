" Use Phpactor for omni-completion
augroup elyphpactor
  autocmd!
  autocmd FileType php setlocal omnifunc=phpactor#Complete
augroup END

let g:phpactorOmniError = v:true " Enable useful error messages when completion is invoked
let g:phpactorActivateMappings = v:true
let g:phpactorActivateOverlapingMappings = v:true

" Should be `pm` to be logic but `pp` is easiest and faster since I use it a lot
" nnoremap <Leader>pp :call phpactor#ContextMenu()<CR>
" nnoremap <Leader>pn :call phpactor#Navigate()<CR>
" nnoremap <Leader>pt :call phpactor#Transform()<CR>

let g:phpactorCustomMappings = [
  \ ['<Leader>pp', '<Plug>phpactorContextMenu', 'n'],
  \ ['<Leader>pn', '<Plug>phpactorNavigate', 'n'],
  \ ['<Leader>pt', '<Plug>phpactorTransform', 'n'],
\ ]

" vim: et ts=2 sw=2 fdm=marker
