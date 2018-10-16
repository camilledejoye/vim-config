" " Use Phpactor for omni-completion
" autocmd FileType php setlocal omnifunc=phpactor#Complete

" let g:phpactorOmniError = v:true " Enable useful error messages when completion is invoked

" TODO: add a test for ncm2 existence or put it to after/
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
