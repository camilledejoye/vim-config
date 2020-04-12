" Mappings
" '' to disable the mapping
let g:AutoPairsShortcutToggle = ''
let g:AutoPairsShortcutFastWrap = '<C-e>' " Not a believer but I will try
let g:AutoPairsShortcutJump = ''
let g:AutoPairsShortcutBackInsert = '<C-b>'

" Fly Mode will always force closed-pair jumping instead of inserting
" Only for ')', '}', ']'
" Might be confusing at first but I want to gave it a fair try
let g:AutoPairsFlyMode = 1

let g:AutoPairsCenterLine = 0 " Prevent `zz` when splitting pairs on multiple lines

" In case using Enter to split the pairs on different lines is not practical
" or conflict with something else:
" let g:AutoPairsMapCR = 0
inoremap <silent> <C-j> <C-R>=AutoPairsReturn()<CR>

" vim: ts=2 sw=2 et fdm=marker