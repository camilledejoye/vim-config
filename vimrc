" External configuration {{{
" Will always add the directory of this file to the runtimepath
" Allow me to move all the vim-config repository inside my .dotfiles/
let s:my_vim_dir = fnamemodify(resolve(expand('<sfile>')), ':p:h')
execute 'set runtimepath^=' . s:my_vim_dir
execute 'set runtimepath+=' . s:my_vim_dir . '/after'
let &packpath = &runtimepath

" To add a personal templates directory to the runtimepath
execute 'set runtimepath+=' . s:my_vim_dir . '/templates'
" }}}

" Global {{{
let mapleader = ','

filetype plugin indent on
syntax on

" Try to user Vim 'fuzzy' finder
set path+=**
set noautochdir
" The goal is to speed up the find mainly, try and check if that doesn't screw
" something up
" set wildignore+=*/.git/*,*/vendor/*,*/node_modules/*,*/var/*,*/web/build/*
set wildignore+=*/.git/*,*/node_modules/*,*/var/*,*/web/build/*

set hidden
set number
set relativenumber
set cursorline
set laststatus=2
set modelines=5
set ts=4 sts=4 sw=4 expandtab
set listchars=tab:»\ ,eol:¬
set incsearch
set nojoinspaces
set display+=lastline
set splitright
set scrolloff=3
set diffopt+=vertical
set wildmenu

if has('termguicolors')
  set termguicolors
endif

if has('nvim')
  set inccommand=nosplit
endif
" }}}

" Packages {{{
" Packager {{{

" Needed to autoload packages depending on filetype
if exists('*packager#init')
  call packager#init()

  call packager#add('kristijanhusak/vim-packager', { 'type': 'opt' })

  call packager#add('wikitopian/hardmode')

  call packager#add('vim-airline/vim-airline')
  call packager#add('vim-airline/vim-airline-themes')

  call packager#add('tpope/vim-surround')
  call packager#add('tpope/vim-commentary')
  "call packager#add('scrooloose/nerdcommenter')
  call packager#add('tpope/vim-scriptease')
  call packager#add('tpope/vim-unimpaired')
  " call packager#add('tpope/vim-endwise')
  " call packager#add('tpope/vim-speeddating')
  call packager#add('tpope/vim-abolish')
  call packager#add('tpope/vim-fugitive')
  call packager#add('tpope/vim-repeat')
  call packager#add('tpope/vim-dispatch')
  call packager#add('radenling/vim-dispatch-neovim')
  call packager#add('tpope/vim-projectionist')
  call packager#add('tpope/vim-eunuch')
  call packager#add('tpope/vim-sleuth')

  call packager#add('w0rp/ale')
  call packager#add('editorconfig/editorconfig-vim', { 'type': 'opt' })

  call packager#add('terryma/vim-multiple-cursors')

  " call packager#add('easymotion/vim-easymotion')

  call packager#add('skywind3000/asyncrun.vim')

  " call packager#add('godlygeek/tabular')
  call packager#add('junegunn/vim-easy-align')

  call packager#add('StanAngeloff/php.vim')
  call packager#add('phpactor/phpactor', {'branch': 'develop', 'do': 'composer install -o'})
    call packager#add('junegunn/vader.vim') " To launch the tests
    call packager#add('elythyr/phpactor-mappings')
  call packager#add('git@github.com:elythyr/vim-php-refactoring-toolbox.git', {'branch': 'improvements'})

  call packager#add('ncm2/ncm2')
    call packager#add('roxma/nvim-yarp')
  call packager#add('ncm2/ncm2-path')
  " call packager#add('ncm2/ncm2-tmux')
  " call packager#add('wellle/tmux-complete')
  call packager#add('ncm2/ncm2-cssomni')
  call packager#add('ncm2/ncm2-ultisnips') " Experimental
  " call packager#add('ncm2/ncm2-snipmate') " Experimental
  call packager#add('ncm2/ncm2-html-subscope')
  call packager#add('phpactor/ncm2-phpactor')

  " Don't feel the need for it, but I keep the link in case
  " https://github.com/2072/PHP-Indenting-for-VIm

  call packager#add('othree/csscomplete.vim')
  call packager#add('etdev/vim-hexcolor')

  call packager#add('SirVer/ultisnips')
  call packager#add('honza/vim-snippets')
  call packager#add('git@github.com:elythyr/pdv.git', {'branch': 'improvements'})
    call packager#add('tobyS/vmustache')

  call packager#add('sniphpets/sniphpets-common')
  call packager#add('sniphpets/sniphpets-symfony')
  call packager#add('sniphpets/sniphpets-phpunit')
  call packager#add('sniphpets/sniphpets-doctrine')
  call packager#add('sniphpets/sniphpets-postfix-codes')
    call packager#add('sniphpets/sniphpets')

  call packager#add('vim-vdebug/vdebug')

  call packager#add('git@github.com:elythyr/vim-test', {'branch': 'dev'})
  " call packager#add('benmills/vimux') " Could be interesting, I should check
  " it out when I will have some time

  call packager#add('airblade/vim-gitgutter')

  " call packager#add('kana/vim-vspec', {'type': 'opt'})
  call packager#add('kana/vim-niceblock')
  " call packager#add('kana/vim-smartinput')
  " call packager#add('kana/vim-smartword')
  call packager#add('kana/vim-textobj-user') " Require for textobj plugins
  call packager#add('kana/vim-textobj-function')
  " call packager#add('kana/vim-textobj-syntax')
  " call packager#add('kana/vim-textobj-indent')

  call packager#add('jiangmiao/auto-pairs') " Try in place of kana/vim-smartinput

  call packager#add('scrooloose/nerdtree')
  call packager#add('Xuyuanp/nerdtree-git-plugin')

  call packager#add('git@github.com:elythyr/vim-cleanfold.git')
  call packager#add('git@github.com:elythyr/php-foldexpr.vim.git')

  call packager#add('lumiliet/vim-twig')
  call packager#add('elzr/vim-json') " Improved JSON handling

  call packager#add('junegunn/fzf.vim')

  call packager#add('pangloss/vim-javascript')
  call packager#add('ryym/vim-riot')

  call packager#add('alvan/vim-closetag')

  call packager#add('FooSoft/vim-argwrap')

  call packager#add('powerman/vim-plugin-viewdoc')
  call packager#add('vimwiki/vimwiki', { 'type': 'opt' })
  call packager#add('iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } })
endif

command! PackInstall packadd vim-packager | source $MYVIMRC | call packager#install()
command! -bang PackUpdate packadd vim-packager | source $MYVIMRC | call packager#update({ 'force_hooks': '<bang>' })
command! PackClean  packadd vim-packager | source $MYVIMRC | call packager#clean()
command! PackStatus  packadd vim-packager | source $MYVIMRC | call packager#status()
" }}}
" }}}

" Autoload all config files
for s:config_file in glob(s:my_vim_dir . '/config/*.vim', v:false, v:true)
    execute 'source ' s:config_file
endfor

" Abbreviations {{{
cnoreabbrev f   find
cnoreabbrev sf  sfind
cnoreabbrev vsf vertical sfind
cnoreabbrev tf  tabfind

cnoreabbrev te  tabedit
" }}}

unlet s:my_vim_dir

" vim: ts=2 sw=2 et fdm=marker
