set background=dark

if !has('gui_running') && !exists('g:base16_shell_path')
  let g:base16_shell_path = '~/.dotfiles/base16/base16-shell/scripts'
endif

if !exists('g:base16_theme') || empty(globpath(&runtimepath, 'colors/' . g:base16_theme . '.vim'))
  let g:base16_theme = !empty($BASE16_THEME) ? $BASE16_THEME : 'base16-tomorrow-night'

  let base16_prefix = 'base16-'
  if 0 != stridx(g:base16_theme, base16_prefix)
    " changes in base16-shell that removed the "base16-" prefix from
    " $BASE16_THEME but it still needed for the vim colorschemes
    let g:base16_theme = base16_prefix . g:base16_theme
  endif
endif

if !exists('g:colors_name') || g:colors_name != g:base16_theme
  let base16colorspace=256

  silent! execute 'colorscheme ' . g:base16_theme
endif
