let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
    \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

let g:ctrlp_working_path_mode = 'ra' " Set the nearest ancesstor that contains .git, for example, as current directory
let g:ctrlp_map = '<C-F>' " To open CtrlP in 'File' (standard) mode without conflicting with pdv
