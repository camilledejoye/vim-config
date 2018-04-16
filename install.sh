#!/bin/bash

if [ -d 'pack' ]; then
  echo 'Already installed'
  exit
fi

cmd='vim'

if hash nvim 2>/dev/null; then
  cmd='nvim'
elif ! hash lvim 2>/dev/null; then
  echo 'You must intall vim or nvim first'
  exit
fi

if [ ! -d 'pack/minpac/opt/minpac' ]; then
  git clone https://github.com/k-takata/minpac.git pack/minpac/opt/minpac/
fi

$cmd -c PackUpdate
