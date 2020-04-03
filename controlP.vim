
" control p
set runtimepath^=~/.vim/bundle/ctrlp.vim

let g:ctrlp_regexp = 1
let g:ctrlp_working_path_mode = ''

set wildignore+=*/tmp/*,*/node_modules/*,*/build/json/*,*/build/raw/1/*,*.so,*.swp,*.zip,*min.js
" ignore
set wildignore+=.DS_Store

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(node_modules|git|hg|svn|build)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
