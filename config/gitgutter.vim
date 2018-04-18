" Define to 250ms in order to update faster the status of each lines.
" Defaults to 4s
set updatetime=250

nmap gph <Plug>GitGutterPrevHunk
nmap gnh <Plug>GitGutterNextHunk

let g:gitgutter_diff_args = '-w'
