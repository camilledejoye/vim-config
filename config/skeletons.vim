let g:skeletons_dir = fnamemodify(resolve(expand('<sfile>')), ':p:h:h') .'/skeletons'

augroup ElySkeletons
  autocmd!

  for skeleton in glob(g:skeletons_dir.'/*.*', v:false, v:true)
    let ext = fnamemodify(skeleton, ':e')
    execute "autocmd BufNewFile *.". ext ." 0r ". skeleton
  endfor
augroup END

" vim: ts=2 sw=2 et fdm=marker
