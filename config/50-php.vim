if exists('*packager#init')
  call packager#add('StanAngeloff/php.vim')

  call packager#add('sniphpets/sniphpets-common')
  call packager#add('sniphpets/sniphpets-symfony')
  call packager#add('sniphpets/sniphpets-phpunit')
  call packager#add('sniphpets/sniphpets-doctrine')
  call packager#add('sniphpets/sniphpets-postfix-codes')
  call packager#add('sniphpets/sniphpets')

  call packager#add('git@github.com:elythyr/pdv.git', {'branch': 'improvements'})
  call packager#add('tobyS/vmustache')

  " Don't feel the need for it, but I keep the link in case
  " https://github.com/2072/PHP-Indenting-for-VIm
  call packager#add('git@github.com:elythyr/php-foldexpr')

endif

" php.vim configurations {{{

let g:php_html_in_strings = 1
let g:sql_type_default    = 'sqloracle' " SQL syntax colorscheme
let g:PHP_noArrowMatching = 1 " Properly aligns "->" on multiple lines

function! s:PhpSyntaxOverride() " {{{
  hi! def link phpDocTags       phpConstants
  hi! def link phpDocParam      phpType
  hi! def link phpDocIdentifier phpIdentifier
endfunction " }}}

augroup MyPhpConfiguration
  autocmd!
  autocmd FileType php call <SID>PhpSyntaxOverride()
augroup END

" }}}

" vim: et ts=2 sw=2 fdm=marker
