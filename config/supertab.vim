let g:SuperTabDefaultCompletionType        = "context" " Will try to recognize which completion use
let g:SuperTabContextDefaultCompletionType = "<C-X><C-O>"
let g:SuperTabLongestEnhanced              = 1
let g:SuperTabLongestHighlight             = 1
let g:SuperTabClosePreviewOnPopupClose     = 1
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
let g:SuperTabContextDiscoverDiscovery = ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]

" To start SuperTab with <C-Space>
imap <C-Space> <Plug>SuperTabForward

" To make <C-Space> working in a terminal
if !has("gui_running")
    imap <C-@> <C-Space>
endif

