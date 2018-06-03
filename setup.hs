DOTFILES=$(pwd)
DEV_DIR=~/code


# VIM
ln -sf $DOTFILES/vimrc $HOME/.vimrc

# VIM-PLUG INSTALL
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +q +q!

source ~/.profile
