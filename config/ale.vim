let g:airline#extensions#ale#enabled = 1
let g:ale_yaml_yamllint_options = '-d relaxed'
let g:ale_fixers = { 'php': [
  \ 'php_cs_fixer',
  \ 'remove_trailing_lines',
  \ 'trim_whitespace',
\ ]}

nmap <silent> <Leader>fs <Plug>(ale_fix)<CR>

" vim: ts=2 sw=2 et fdm=marker
