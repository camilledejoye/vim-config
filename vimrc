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
" Minpack {{{

" Needed to autoload packages depending on filetype
if exists('*minpac#init')
  call minpac#init()

  call minpac#add('k-takata/minpac', {'type': 'opt', 'branch': 'master'})

  call minpac#add('chriskempson/base16-vim')

  call minpac#add('wikitopian/hardmode')

  call minpac#add('vim-airline/vim-airline')
  call minpac#add('vim-airline/vim-airline-themes')

  call minpac#add('tpope/vim-surround')
  call minpac#add('tpope/vim-commentary')
  "call minpac#add('scrooloose/nerdcommenter')
  call minpac#add('tpope/vim-scriptease')
  call minpac#add('tpope/vim-unimpaired')
  " call minpac#add('tpope/vim-endwise')
  " call minpac#add('tpope/vim-speeddating')
  call minpac#add('tpope/vim-abolish')
  call minpac#add('tpope/vim-fugitive')
  call minpac#add('tpope/vim-repeat')
  call minpac#add('tpope/vim-dispatch')
  call minpac#add('radenling/vim-dispatch-neovim')
  call minpac#add('tpope/vim-projectionist')
  call minpac#add('tpope/vim-eunuch')

  call minpac#add('w0rp/ale')
  call minpac#add('editorconfig/editorconfig-vim')
  call minpac#add('terryma/vim-multiple-cursors')

  " call minpac#add('easymotion/vim-easymotion')

  call minpac#add('skywind3000/asyncrun.vim')

  " call minpac#add('godlygeek/tabular')
  call minpac#add('junegunn/vim-easy-align')

  call minpac#add('StanAngeloff/php.vim')
  call minpac#add('phpactor/phpactor', {'branch': 'develop', 'do': '!composer install -o'})
    call minpac#add('junegunn/vader.vim') " To launch the tests
    call minpac#add('git@github.com:elythyr/phpactor-mappings.git')
  call minpac#add('git@github.com:elythyr/vim-php-refactoring-toolbox.git', {'branch': 'improvements'})

  call minpac#add('ncm2/ncm2')
    call minpac#add('roxma/nvim-yarp')
  call minpac#add('ncm2/ncm2-path')
  " call minpac#add('ncm2/ncm2-tmux')
  " call minpac#add('wellle/tmux-complete')
  call minpac#add('ncm2/ncm2-cssomni')
  call minpac#add('ncm2/ncm2-ultisnips') " Experimental
  " call minpac#add('ncm2/ncm2-snipmate') " Experimental
  call minpac#add('ncm2/ncm2-html-subscope')
  call minpac#add('phpactor/ncm2-phpactor')

  " Don't feel the need for it, but I keep the link in case
  " https://github.com/2072/PHP-Indenting-for-VIm

  call minpac#add('othree/csscomplete.vim')
  call minpac#add('etdev/vim-hexcolor')

  call minpac#add('SirVer/ultisnips')
  call minpac#add('honza/vim-snippets')
  call minpac#add('git@github.com:elythyr/pdv.git', {'branch': 'improvements'})
    call minpac#add('tobyS/vmustache')

  call minpac#add('sniphpets/sniphpets-common')
  call minpac#add('sniphpets/sniphpets-symfony')
  call minpac#add('sniphpets/sniphpets-phpunit')
  call minpac#add('sniphpets/sniphpets-doctrine')
  call minpac#add('sniphpets/sniphpets-postfix-codes')
    call minpac#add('sniphpets/sniphpets')

  call minpac#add('vim-vdebug/vdebug')

  call minpac#add('git@github.com:elythyr/vim-test', {'branch': 'dev'})
  " call minpac#add('benmills/vimux') " Could be interesting, I should check
  " it out when I will have some time

  call minpac#add('airblade/vim-gitgutter')

  " call minpac#add('kana/vim-vspec', {'type': 'opt'})
  call minpac#add('kana/vim-niceblock')
  call minpac#add('kana/vim-smartinput')
  " call minpac#add('kana/vim-smartword')
  call minpac#add('kana/vim-textobj-user') " Require for textobj plugins
  call minpac#add('kana/vim-textobj-function')
  " call minpac#add('kana/vim-textobj-syntax')
  " call minpac#add('kana/vim-textobj-indent')

  call minpac#add('scrooloose/nerdtree')
  call minpac#add('Xuyuanp/nerdtree-git-plugin')

  call minpac#add('git@github.com:elythyr/vim-cleanfold.git')
  call minpac#add('git@github.com:elythyr/php-foldexpr.vim.git')

  call minpac#add('lumiliet/vim-twig')

  call minpac#add('junegunn/fzf.vim')

  call minpac#add('pangloss/vim-javascript')
  call minpac#add('ryym/vim-riot')

  call minpac#add('alvan/vim-closetag')

  call minpac#add('FooSoft/vim-argwrap')

  call minpac#add('powerman/vim-plugin-viewdoc')
endif

command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update()
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()
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
