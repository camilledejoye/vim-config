if exists('*packager#init')
  call packager#add('neoclide/coc.nvim', {'branch': 'release'})
endif

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
  \ ]

" }}}

" Mappings {{{

  " Use `[g` and `]g` to navigate diagnostics
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)

  " Goto code navigation.
  nmap <silent> <C-M-]> :call CocActionAsync('jumpTypeDefinition', 'edit')<CR>
  nmap <silent> <C-w><C-M-]> :call CocActionAsync('jumpTypeDefinition', 'vsplit')<CR>
  " Caution: gd will require <space> or to wait for the timeout
  nmap <silent> gdi <Plug>(coc-implementation)
  nmap <silent> <C-w>gdi :call CocActionAsync('jumpImplementation', 'vsplit')<CR>
  nmap <silent> gdr <Plug>(coc-references)
  nmap <silent> <C-w>gdr :call CocActionAsync('jumpReferences', 'vsplit')<CR>

  nmap <silent> gh :call CocActionAsync('doHover')<CR>

  " cr used by tpope/vim-abolish
  " nmap crn <Plug>(coc-rename)
  " Uses this until phpactor provide rename feature in LSP
  nmap <silent> crn :CocCommand document.renameCurrentWord<CR>

  " Multiple cursor mapping, select the word under the cursor and move to the
  " next match
  nmap <expr> <silent> <C-c> "\<Plug>(coc-cursors-word)*:nohl\<CR>"
  " To make it appear like a visual selection
  highlight link CocCursorRange Visual

  " Use <Tab> to expand snippets (may conflict with UltiSnips if enabled)
  " imap <silent> <expr> <Tab> coc#expandable()
  "   \ ? "\<Plug>(coc-snippets-expand)"
  "   \ : "\<Tab>"

  " Applying codeAction to the selected region.
  " Example: `<leader>aap` for current paragraph
  xmap <leader>ac <Plug>(coc-codeaction-selected)
  nmap <leader>ac <Plug>(coc-codeaction-selected)

  " To manually refresh CoC completion list
  inoremap <expr> <silent> <C-space> coc#refresh()

  " Refresh completion list on <BS>
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

    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocActionAsync('formatSelected')

    " , being my leader it does not trigger the signature helper properly
    " https://github.com/neoclide/coc.nvim/issues/1797#issuecomment-616940358
    autocmd InsertCharPre * if ',' == v:char | call CocActionAsync('showSignatureHelp') | endif

    autocmd FileType * call s:InitBuffer()
  augroup END

  function! s:InitBuffer() abort " {{{
    " Unfortunately we can't call CocHasProvider('definition') here
    " Because the RPC client does not seems to be work yet
    " We would need a User event triggered when CoC is operational for a
    " buffer
    if 'help' != &filetype
      nmap <buffer> <silent> <C-]> :call CocActionAsync('jumpDefinition', 'edit')<CR>
      nmap <buffer> <silent> <C-w><C-]> :call CocActionAsync('jumpDefinition', 'vsplit')<CR>
    endif
  endfunction " }}}

" }}}

" Status line {{{

  let g:airline#extensions#coc#enabled = 1 " see :h coc-status-airline

" }}}

" vim: fdm=marker
