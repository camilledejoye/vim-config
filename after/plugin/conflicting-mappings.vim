" Regroups mappings that conflicts between plugins
" This is the place to resolve them

" vim-unimpaired: =o and =op {{{
" I want to remove these mappings because I don't need them and they delay the
" = mapping in Vimwiki to increase the title
" But vim-unimpaired does not provide a way to do that for those "legacy"
" mappings so I had to be creative

if maparg('=o', 'n') =~ 'legacy_option_map'
  nunmap =o
endif

if maparg('=op', 'n') == '<Nop>'
  nunmap =op
endif
" }}}

" vim: fdm=marker
