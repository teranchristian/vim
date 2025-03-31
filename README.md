# vim

install:
execute `~/.setup.sh`

post install 
```
cd ~/.vim/bundle && \
git clone --depth=1 https://github.com/vim-syntastic/syntastic.git
```

Also, install eslint globaly (npm install eslint -g)
