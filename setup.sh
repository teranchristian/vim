DOTFILES=$(pwd)
DEV_DIR=~/code

# mkdir ~/.vimcache
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

sudo apt-get install fonts-powerline -y

source ~/.profile
