let g:php_sql_query      = 0 " Color SQL in PHP string - Doesn't work correctly
let g:php_sql_heredoc    = 1 " Color SQL in PHP Heredoc
let g:sql_type_default = 'sqloracle' " SQL syntax colorscheme
let g:php_folding        = 0 " Disable folding PHP block
let g:php_phpdoc_folding = 1 " Enable folding PHP comments

function! PhpSyntaxOverride()
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
