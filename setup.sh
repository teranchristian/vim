#!/bin/bash
DOTFILES=$(pwd)
DEV_DIR=~/code

set -euo pipefail

if [ ! -d $DOTFILES/bundle ]; then
  mkdir -p $DOTFILES/bundle;
  git clone --depth=1 https://github.com/vim-syntastic/syntastic.git
fi

if [ ! -d ~/.vimcache ]; then
  mkdir -p ~/.vimcache/backup
  mkdir -p ~/.vimcache/swap
  mkdir -p ~/.vimcache/undo
fi


/bin/mkdir -p ~/.vimcache/backup
/bin/mkdir -p ~/.vimcache/swap
/bin/mkdir -p ~/.vimcache/undo

# VIM
ln -sf $DOTFILES/vimrc $HOME/.vimrc

mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

#lVIM-PLUG INSTALL
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +q +q!
if [[ ! -e ~/.profile ]]; then
    touch ~/.profile
fi
