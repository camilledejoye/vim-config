" Needed to autoload packages depending on filetype
if exists('*packager#init')
  call packager#init()

  call packager#add('kristijanhusak/vim-packager', { 'type': 'opt' })

  call packager#add('git@github.com:camilledejoye/vim-cleanfold')

  call packager#add('kana/vim-niceblock')

  call packager#add('terryma/vim-multiple-cursors')

  " Equivalent of easy-align, I keep it until I decide which one I prefer
  " call packager#add('godlygeek/tabular')

  call packager#add('junegunn/vader.vim') " To launch the VimL tests

  call packager#add('vim-vdebug/vdebug')

  " call packager#add('benmills/vimux') " Could be interesting, I should check
  " it out when I will have some time

  " Language related (syntax, completion, etc.) {{{

  call packager#add('lumiliet/vim-twig')

  call packager#add('elzr/vim-json') " Improved JSON handling

  call packager#add('etdev/vim-hexcolor')

  call packager#add('othree/csscomplete.vim')

  call packager#add('iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } })

  " Handle .rst files
  " call packager#add('gu-fan/riv.vim')
  " }}}

  " Adds a bunch of text objects, especially argument text object
  call packager#add('wellle/targets.vim')
endif

command! PackInstall packadd vim-packager | source $MYVIMRC
  \ | call packager#install()
command! -bang PackUpdate packadd vim-packager | source $MYVIMRC
  \ | call packager#update({ 'force_hooks': '<bang>' })
command! PackClean  packadd vim-packager | source $MYVIMRC
  \ | call packager#clean()
command! PackStatus  packadd vim-packager | source $MYVIMRC
  \ | call packager#status()
