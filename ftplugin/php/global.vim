" Global PHP filetype configurations

function! s:TextObject(inner) abort " {{{
  keepjumps normal! [[
endfunction " }}}

setlocal foldlevel=1 " To automaticaly open classes folds

nnoremap <silent> zI :set foldlevel=1<CR>

" Open the phpdoc for the word under the cursor
nnoremap <silent> <Leader>pk :silent execute ':!xdg-open ' .
  \ 'https://php.net/en/' . expand('<cword>')<CR>


" vim:ts=2:sw=2:et:fdm=marker
