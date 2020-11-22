if exists('*packager#init')
  call packager#add('git@github.com:camilledejoye/vim-test', {'branch': 'dev'})
endif

" Disabled the possibility to run a test from it's source file
" let g:test#no_alternate = 1 " Ex.: Don't run tests on save from the sources
let g:test#php#behat#use_suite_in_args = 1

nnoremap <silent> <Leader>tn :TestNearest<CR>
nnoremap <silent> <Leader>tf :TestFile<CR>
nnoremap <silent> <Leader>ts :TestSuite<CR>
nnoremap <silent> <Leader>tl :TestLast<CR>
nnoremap <silent> <Leader>tv :TestVisit<CR>

" " Disable because it doesn't leave the focus in the neovim terminal
" " So I can't close it quicly, which is my favorite thing :)
" augroup auto_vimtest_on_write " {{{1
"   autocmd!
"   autocmd BufWrite * if test#exists() |
"     \   TestFile |
"     \ endif
" augroup END " 1}}}

" Strategy auto-detection {{{

function! s:DefineStrategy() " {{{
  if has('nvim')
    return 'neovim'
  elseif exists('*VimuxRunCommand')
    return 'vimux'
  elseif 2 == exists(':VtrSendCommandToRunner')
    return 'vtr'
  " elseif has('terminal') || exists('*term_start')
  "   return 'vimterminal'
  else
    return 'basic'
  endif
endfunction " }}}

" See vimux plugin and strategy when i will use tmux
let test#strategy = <SID>DefineStrategy()

" Possible if needed
" let test#strategy = {
"   \ 'nearest': 'neovim',
"   \ 'file':    'dispatch',
"   \ 'suite':   'basic',
" \}

" }}}

" vim: ts=2 sw=2 et fdm=marker
