" To toggle from paste mode to non-paste mode
set pastetoggle=<F12>

" Search {{{1
" To count the number of times the word under the cursor is present in the
" document
map ,* *<C-O>:%s///gn<CR>

" To count the number of results for the last search
map ,, :%s///gn<CR>

" Search for selected text, forwards or backwards.
" http://vim.wikia.com/wiki/Search_for_visually_selected_text
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \substitute(escape(@", '/\.*$^~['), '\v^\_s*(.{-})\_s*$', '\1', ''),
  \'\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \substitute(escape(@", '/\.*$^~['), '\v^\_s*(.{-})\_s*$', '\1', ''),
  \'\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
" 1}}}

" Buffers {{{1
" Command mapping (:bq) to close the current buffer and go back to the
" previous one
" cmap bq :bp <BAR> :bd #
cnoreabbrev bq bp <BAR> bd #<CR>
" 1}}}

" Folds {{{1
" Open all folds and close one level
" Usefull to open everything but documentation block
if empty(maparg('zT', 'n'))
  nmap <silent> zT zR<BAR>zm<CR>
endif

" Reset foldlevel to 1
if empty(maparg('zI', 'n'))
  nmap <silent> zI :let &foldlevel = &foldlevelstart<CR>
endif
" 1}}}

" Terminal {{{1
tnoremap <silent> <Esc> <C-\><C-n>
" 1}}}

" Quick quit insert mode
" Like the idea, want to gave it a try
inoremap jf <Esc>
inoremap fj <Esc>

" <C-^> is a real pain on azerty keaybords...
nnoremap <C-h> <C-^>

" Quick shell command
nnoremap ! :!

" vim: ts=2 sw=2 et fdm=marker
