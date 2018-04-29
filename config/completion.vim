set completeopt+=longest,menuone

function! s:ClosePreviewAfterComplete() " {{{
  if &completeopt =~ 'preview' " if preview option is activated
    try
      wincmd P " Go to the preview window

      " If there is an alternate buffer and it's hidden
      if !empty(bufname('#')) && -1 == bufwinnr('#')
        buffer # " Switch back to the previous buffer
        wincmd p " Go back to the original user window
      else
        pclose
      endif

    catch
      " Do nothing if there is no preview window
      echomsg v:exception
      return
    endtry
  endif
endfunction " }}}

augroup Completion
  autocmd!
  autocmd CompleteDone * call s:ClosePreviewAfterComplete()
augroup END

imap <expr> <Esc> pumvisible() ? "\<C-e>" : "\<Esc>"

" vim: et ts=2 sw=2 fdm=marker
