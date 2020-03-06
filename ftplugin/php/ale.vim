if 2 != exists(':ALEEnable')
  finish
endif

call ale#Set('php_phpcsfixer_options', '')
call ale#Set('php_phpcsfixer_executable', 'php-cs-fixer')
call ale#Set('php_phpcsfixer_use_global', get(g:, 'ale_use_global_executables', 0))

function! s:ale_linters_php_phpcsfixer_GetCommand(buffer) abort
  return '%e fix --format gitlab --show-progress none'
    \ . ale#Pad(ale#Var(a:buffer, 'php_phpcsfixer_options'))
endfunction

function! s:ale_linters_php_phpcsfixer_Handle(buffer, lines) abort
  let l:errors = {}
  let l:output = []

  try
    for l:line in a:lines
      for l:error in json_decode(l:line)
        let l:lnum = l:error.location.lines.begin + 0
        let l:text = l:error.description

        if !has_key(l:errors, l:lnum)
          let l:errors[l:lnum] = []
        endif

        call add(l:errors[l:lnum], l:text)
      endfor
    endfor
  endtry


  for [l:lnum, l:texts] in items(l:errors)
    call add(l:output, {
      \ 'lnum': lnum,
      \ 'text': join(texts, ', '),
      \ 'sub_type': 'style'
    \ })
  endfor

  return l:output
endfunction

call ale#linter#Define('php', {
  \ 'name': 'php_cs_fixer',
  \ 'executable': {buffer -> ale#node#FindExecutable(buffer, 'php_phpcsfixer', [
    \ 'vendor/bin/php-cs-fixer',
    \ 'php-cs-fixer'
  \ ])},
  \ 'command': function('<SID>ale_linters_php_phpcsfixer_GetCommand'),
  \ 'callback': function('<SID>ale_linters_php_phpcsfixer_Handle')
\ })

" vim: ts=2 sw=2 et fdm=marker
