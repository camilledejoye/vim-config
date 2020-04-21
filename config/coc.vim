" Extensions {{{
  " Extensions will be installed on start
  " coc-json: Help with CoC configuration file
  " coc-vimlsp: VimL completion <3
  " coc-actions: Floating windows for possible actions
  " coc-snippets: Handle all kinds of snippet
  " coc-ultisnips: Alternative to coc-snippets if it's too much
  let g:coc_global_extensions = [
    \ 'coc-json',
    \ 'coc-vimlsp',
    \ 'coc-snippets',
  \ ]
" }}}

" Mappings {{{
  " Use `[g` and `]g` to navigate diagnostics
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)

  " Goto code navigation.
  function! s:gotoDefinition(command) abort " {{{
    if index(['vim', 'help'], &filetype) >= 0
      normal! K
    else
      call CocAction('jumpDefinition', a:command)
    endif
  endfunction " }}}
  nmap <silent> <C-]> :call <SID>gotoDefinition('edit')<CR>
  nmap <silent> <C-w><C-]> :call <SID>gotoDefinition('vsplit')<CR>
  " nmap <silent> gy <Plug>(coc-type-definition)
  " nmap <silent> gi <Plug>(coc-implementation)
  " nmap <silent> gr <Plug>(coc-references)}

  nmap <silent> gh :call CocActionAsync('doHover')<CR>

  " cr used by tpope/vim-abolish
  nmap crn <Plug>(coc-rename)

  " Applying codeAction to the selected region.
  " Example: `<leader>aap` for current paragraph
  xmap <leader>ac <Plug>(coc-codeaction-selected)
  nmap <leader>ac <Plug>(coc-codeaction-selected)

  inoremap <expr> <silent> <C-space> coc#refresh()
  " Conflicting mapping, see: after/plugin/conflicting-mappings.vim
  " imap <silent> <BS> <BS><C-space>
" }}}

" Auto-commands {{{
  augroup coc_custom
    autocmd!
    " Highlight the symbol and its references when holding the cursor.
    autocmd CursorHold * silent call CocActionAsync('highlight')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

    " , being my leader it does not trigger the signature helper properly
    " https://github.com/neoclide/coc.nvim/issues/1797#issuecomment-616940358
    autocmd InsertCharPre * if ',' == v:char | call CocActionAsync('showSignatureHelp') | endif
  augroup END
" }}}

" Status line {{{
  let g:airline#extensions#coc#enabled = 1 " see :h coc-status-airline
" }}}
