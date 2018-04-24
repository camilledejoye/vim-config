let g:php_html_in_strings = 1
let g:sql_type_default    = 'sqloracle' " SQL syntax colorscheme
let g:php_folding         = 1 " Enable folding PHP blocks
let g:php_phpdoc_folding  = 1 " Enable folding PHP comments

function! PhpSyntaxOverride()
  redraw!
    hi! def link phpDocTags       phpConstants
    hi! def link phpDocParam      phpType
    hi! def link phpDocIdentifier phpIdentifier
endfunction

augroup phpSyntaxOverride
    autocmd!
    autocmd FileType php call PhpSyntaxOverride()
augroup END

augroup phpTagsFile
  autocmd!
  autocmd FileType php set tags^=./.php.tags;
augroup END
