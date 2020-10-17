if exists('*packager#init')
  call packager#add('junegunn/fzf.vim')
endif

" The directory of fzf must also be in the runtimepath
execute 'set runtimepath+='. $DOTFILES .'/fzf'

" Search Files
nmap <Leader>sf :GFiles<CR>
nmap <Leader>sF :Files<CR>

" Search Buffers
nmap <Leader>sb :Buffers<CR>

" Search Commits
nmap <Leader>sc :Commits<CR>

" To be able to pass options
command! -bang -nargs=* -complete=dir RRg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '. <q-args>, 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

command! -bang H call fzf#vim#helptags(<bang>0)

" Add a default action to add entries to the quickfix
function! s:buildQuickfixList(lines) abort
  function! s:buildQuickfixItem(line) abort
    let l:matches = matchlist(a:line, '\v^(.{-})%(:(\d+))?%(:(\d+))?%(\s+(.+))?$')

    return {
      \ 'filename': l:matches[1],
      \ 'lnum': l:matches[2],
      \ 'col': l:matches[3],
      \ 'text': l:matches[4],
      \ }
  endfunction

  call setqflist(map(copy(a:lines), { k,v -> s:buildQuickfixItem(v) }))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:buildQuickfixList'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" To have fzf opening in a new window at the bottom of the screen
" let g:fzf_layout = {'down': '30%'}

" To have fzf opening ina floating window
let g:fzf_layout = {'window': {
  \ 'highlight': 'Comment',
  \ 'width': 0.99,
  \ 'height': 0.95,
  \ 'border': 'sharp',
\ }}

" Hide the status line when not using a floating window
if has('nvim') && type(get(get(g:, 'fzf_layout', {}), 'window', '')) != type({})
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
    \ | autocmd BufLeave <buffer> set laststatus=2 showmode ruler
endif

" vim: ts=2 sw=2 et fdm=marker
