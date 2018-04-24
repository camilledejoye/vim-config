" Global {{{
let mapleader = ','

filetype plugin indent on
syntax on

" Try to user Vim 'funzy' finder
set path+=**
set noautochdir

" set mouse=a " Try to force myself to not use the mouse
set hidden
set number
set laststatus=2
set modelines=5
set ts=4 sts=4 sw=4 expandtab
set listchars=tab:▶\ ,eol:¬
set incsearch
set nojoinspaces
set display+=lastline
" set autochdir
set splitright
set scrolloff=3

if has('termguicolors')
  set termguicolors
endif

if has('nvim')
  set inccommand=nosplit
endif
" }}}

" Packages {{{
" Minpack {{{
if exists('*minpac#init')
  call minpac#init()

  call minpac#add('k-takata/minpac', {'type': 'opt'})
  call minpac#add('tpope/vim-surround')
  call minpac#add('tpope/vim-commentary')
  call minpac#add('tpope/vim-scriptease')
  call minpac#add('tpope/vim-unimpaired')
  call minpac#add('tpope/vim-endwise')
  call minpac#add('tpope/vim-speeddating')
  call minpac#add('tpope/vim-repeat')
  call minpac#add('vim-scripts/AnsiEsc.vim')
  call minpac#add('skywind3000/asyncrun.vim')
  call minpac#add('chriskempson/base16-vim')
  call minpac#add('kien/ctrlp.vim')
  "call minpac#add('scrooloose/nerdcommenter')
  call minpac#add('scrooloose/nerdtree', {'type': 'opt'})
  call minpac#add('Xuyuanp/nerdtree-git-plugin', {'type': 'opt'})
  call minpac#add('git@github.com:elythyr/pdv.git', {'branch': 'perso'})
  call minpac#add('git@github.com:elythyr/php.vim.git', {'branch': 'phpdoc-folding'})
  call minpac#add('git@github.com:elythyr/phpcd.vim.git', {'type': 'opt'})
  call minpac#add('git@github.com:elythyr/phpunit.vim.git')
  call minpac#add('git@github.com:elythyr/vim-php-refactoring-toolbox.git', {'branch': 'improvements'})
  call minpac#add('git@github.com:elythyr/vim-snippets.git', {'branch': 'perso'})
  call minpac#add('git@github.com:elythyr/vim-sync.git', {'branch': 'improvements'})
  call minpac#add('shawncplus/phpcomplete.vim')
  call minpac#add('ervandew/supertab')
  call minpac#add('vim-syntastic/syntastic')
  call minpac#add('godlygeek/tabular')
  call minpac#add('majutsushi/tagbar', {'type': 'opt'})
  call minpac#add('vim-php/tagbar-phpctags.vim', {'type': 'opt'})
  call minpac#add('SirVer/ultisnips')
  call minpac#add('tpope/vim-abolish')
  call minpac#add('tpope/vim-fugitive')
  call minpac#add('vim-airline/vim-airline')
  call minpac#add('vim-airline/vim-airline-themes')
  call minpac#add('xolox/vim-easytags')
  call minpac#add('xolox/vim-misc')
  call minpac#add('airblade/vim-gitgutter')
  call minpac#add('etdev/vim-hexcolor')
  call minpac#add('tobyS/vmustache')
  call minpac#add('elythyr/vim-twig')
  call minpac#add('wikitopian/hardmode')
  call minpac#add('kana/vim-vspec', {'type': 'opt'})
endif

command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update()
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()
" }}}

" Load optional plugins based on filetype {{{
augroup LoadPlugins
  autocmd!
  " autocmd FileType php packadd! 'phpunit.vim'
augroup END
" }}}
" }}}

" Autoload all config files
for s:config_file in split(glob('~/.vim/config/*.vim'), "\n")
    execute 'source ' s:config_file
endfor

" Abbreviations {{{
cnoreabbrev vfind vertical sfind
" }}}

" vim: ts=2 sw=2 et fdm=marker
