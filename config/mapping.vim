" To toggle from paste mode to non-paste mode
set pastetoggle=<F12>

" To count the number of times the word under the cursor is present in the
" document
map ,* *<C-O>:%s///gn<CR>

" To count the number of results for the last search
map ,, :%s///gn<CR>

" Command mapping (:bq) to close the current buffer and go back to the
" previous one
" cmap bq :bp <BAR> :bd #
cnoreabbrev bq bp <BAR> bd #<CR>

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
