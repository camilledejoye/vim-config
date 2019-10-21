" Use Phpactor for omni-completion
augroup elyphpactor
  autocmd!
  autocmd FileType php setlocal omnifunc=phpactor#Complete
augroup END

let g:phpactorOmniError = v:true " Enable useful error messages when completion is invoked

" vim: et ts=2 sw=2 fdm=marker
