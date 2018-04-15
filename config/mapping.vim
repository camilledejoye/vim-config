" To toggle from paste mode to non-paste mode
set pastetoggle=<F12>

" To count the number of times the word under the cursor is present in the
" document
map ,* *<C-O>:%s///gn<CR>

" To count the number of results for the last search
map ,, :%s///gn<CR>

" For the completion
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
"  \ '<C-n><C-r>=pumvisiblele() ? "\<lt>Down>" : ""<CR>'
"inoremap <expr> <C-x><C-o> pumvisible() ? '<C-n>' :
"  \ '<C-x><C-o><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

"inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
"  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Command mapping (:bq) to close the current buffer and go back to the
" previous one
cmap bq :bp <BAR> :bd #
