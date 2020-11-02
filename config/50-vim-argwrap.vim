if exists('*packager#init')
  call packager#add('FooSoft/vim-argwrap')
endif

nnoremap <silent> gaw :ArgWrap<CR>

let g:argwrap_tail_comma_braces = '['
let g:argwrap_php_smart_brace = 1

augroup ely_argwrap
  autocmd!
  autocmd FileType vim let b:argwrap_line_prefix = '\ '
  " PHP 7.4 allows the last parameter of a function call to have a comma at
  " then end, unfortunately it is not the case for the function declaration.
  " So it might be painful to have to remove the extra comma when unwrapping a
  " function declaration but I feel like I do it more often on function calls
  " anyway.
  autocmd FileType php let b:argwrap_tail_comma_braces = g:argwrap_tail_comma_braces .'('
augroup END

" vim: ts=2 sw=2 et fdm=marker
