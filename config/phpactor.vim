" " Use Phpactor for omni-completion
" autocmd FileType php setlocal omnifunc=phpactor#Complete

" let g:phpactorOmniError = v:true " Enable useful error messages when completion is invoked

" TODO: add a test for ncm2 existence or put it to after/
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect

" Include use statement
nmap ypu :call phpactor#UseAdd()<CR>

" Invoke the context menu
nmap ,pm :call phpactor#ContextMenu()<CR>

" Invoke the navigation menu
nmap ,ps :call phpactor#Navigate()<CR>

" Goto definition of class or class member under the cursor
nmap <C-]> :call phpactor#GotoDefinition()<CR>

" Transform the classes in the current file
nmap ypt :call phpactor#Transform()<CR>

" Generate a new class (replacing the current file)
" nmap <Leader>cc :call phpactor#ClassNew()<CR>
" cnoreabbrev class call phpactor#ClassNew()<CR>
command! Class :call phpactor#ClassNew()

" Extract expression (normal mode)
nmap ypee :call phpactor#ExtractExpression(v:false)<CR>

" Extract expression from selection
vmap ypee :<C-U>call phpactor#ExtractExpression(v:true)<CR>

" Extract method from selection
vmap ypem :<C-U>call phpactor#ExtractMethod()<CR>
