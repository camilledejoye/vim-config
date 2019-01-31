if expand('<afile>:p') =~? '/tests/'
  let b:ale_php_phpcs_options = '--exclude=PSR1.Methods.CamelCapsMethodName.NotCamelCaps'
endif

" vim: ts=2 sw=2 et fdm=marker
