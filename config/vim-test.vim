" Disabled the possibility to run a test from it's source file
" let g:test#no_alternate = 1 " Ex.: Don't run tests on save from the sources

nnoremap <silent> <Leader>tn :TestNearest<CR>
nnoremap <silent> <Leader>tf :TestFile<CR>
nnoremap <silent> <Leader>ts :TestSuite<CR>
nnoremap <silent> <Leader>tl :TestLast<CR>
nnoremap <silent> <Leader>tv :TestVisit<CR>

function! s:DefineStrategy() " {{{1
  if exists('*VimuxRunCommand')
    return 'vimux'
  elseif 2 == exists(':VtrSendCommandToRunner')
    return 'vtr'
  elseif has('nvim')
    return 'neovim'
  " elseif has('terminal') || exists('*term_start')
  "   return 'vimterminal'
  else
    return 'basic'
  endif
endfunction " 1}}}

" " Disable because I got some weird bugs with ncm2
" " After saving a file, it pop the completion menu
" " So the focus is on the window of the source file
" " But we are still in insert mode (strategy neovim)
" " When pressing <CR> to close the tests, I modify my file...
" augroup auto_vimtest_on_write " {{{1
"   autocmd!
"   autocmd BufWrite * if test#exists() |
"     \   TestFile |
"     \ endif
" augroup END " 1}}}

" See vimux plugin and strategy when i will use tmux
let test#strategy = <SID>DefineStrategy()

" Possible if needed
" let test#strategy = {
"   \ 'nearest': 'neovim',
"   \ 'file':    'dispatch',
"   \ 'suite':   'basic',
" \}

" vim: ts=2 sw=2 et fdm=marker
