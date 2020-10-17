if exists('*packager#init')
  call packager#add('SirVer/ultisnips')
  call packager#add('honza/vim-snippets')
endif

let g:UltiSnipsExpandTrigger		= "<Tab>"
let g:UltiSnipsJumpForwardTrigger	= "<c-j>"
let g:UltiSnipsJumpBackwardTrigger	= "<c-k>"
let g:UltiSnipsRemoveSelectModeMappings = 0

" Projectionist template expansion {{{
function! s:try_insert(skel)
  execute "normal! i" . a:skel . "\<C-r>=UltiSnips#ExpandSnippet()\<CR>"

  if g:ulti_expand_res == 0
    " If it failed remove a:skel from the buffer
    silent! undo
  endif

  return g:ulti_expand_res
endfunction

function! s:InsertSkeleton() abort
  let filename = expand('%')

  " abort on non-empty buffer or exitant file
  if !(line('$') == 1 && getline('$') == '') || filereadable(filename)
    return
  endif

  if !empty('b:projectionist')
    " Loop through projections with 'skeleton' key and try each one until
    " the snippet expands
    for [root, value] in projectionist#query('skeleton')
      if s:try_insert(value)
        return
      endif
    endfor
  endif
endfunction

augroup ultisnips_auto_skeleton
  autocmd!
  autocmd BufNewFile * silent! call <SID>InsertSkeleton()
augroup END
" }}}

" vim: ts=2 sw=2 et fdm=marker
