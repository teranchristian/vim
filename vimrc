" $HOME/.vimrc
set backupdir=~/.vimcache/backup//
set directory=~/.vimcache/swap//
set undodir=~/.vimcache/undo//
" set directory= ~/.vim/swapfiles//

"console log
" Console log from insert mode; Puts focus inside parentheses
imap cll console.log();<Esc><S-f>(a
" Console log from visual mode on next line, puts visual selection inside parentheses
vmap cll yocll<Esc>p
" Console log from normal mode, inserted on next line with word your on inside parentheses
nmap cll yiwocll<Esc>p

imap qtt process.exit(1);<Esc>p

" close modified buffers (move buffer to the background)
set hidden

"runtime bundles/tplugin_vim/macros/tplugin.v
set relativenumber
set expandtab ts=2 sw=2 ai
"   This fix the  issue with the delete button
set backspace=indent,eol,start

" copy the previous indentation on autoindenting
set copyindent

" set show matching parenthesis
set showmatch

" ignore case when searching
set ignorecase

" highlight search terms
set hlsearch

" show search matches as you type
set incsearch

" change color of matching bracket
hi MatchParen cterm=bold ctermbg=none ctermfg=magenta

" change the terminal's title
set title

"cursor
if &term =~ "xterm\\|rxvt"
  " use an orange cursor in insert mode
  let &t_SI = "\<Esc>]12;orange\x7"
  " use a red cursor otherwise
  let &t_EI = "\<Esc>]12;red\x7"
  silent !echo -ne "\033]12;red\007"
  " reset cursor when vim exits
  autocmd VimLeave * silent !echo -ne "\033]112\007"
  " use \003]12;gray\007 for gnome-terminal
endif

"  display spaces and tab
set listchars=tab:>␣,trail:~,extends:>,precedes:<,space:·
set list

" disable listchars
map <f12> :set list!<cr>

"airline
set encoding=utf8
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" copy to clipboat with control + c
vmap <C-c> "+y

" max line limit
set colorcolumn=100

" map esc btn
inoremap jj <ESC>

" insernew line
nmap oo o<Esc>k
nmap OO O<Esc>k

" close tab -> fix issue with Vim close buffer with nerdtree
nnoremap <leader>q :bp\|bd #<CR>

"display full path 
set statusline+=%F
".. hightlight all seach pattern
:set hlsearch

" buftab
noremap <f1> :bprev<CR> 
noremap <f2> :bnext<CR> 

" prevent to open buffer inside of nerdtree
autocmd FileType nerdtree noremap <buffer> <f1> <nop>
autocmd FileType nerdtree noremap <buffer> <f2> <nop>

" let NERDTreeMapOpenInTab='<ENTER>'
let NERDTreeShowHidden=1

" nerdtree remove "Press ? for help”
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Automatically delete the buffer of the file you just deleted with NerdTree
let NERDTreeAutoDeleteBuffer = 1

"close nerdtree when open controlp
let g:ctrlp_map = ''
nnoremap <c-p> :NERDTreeClose\|CtrlP<CR>
let g:ctrlp_cmd = 'call CtrlPCommand()'
"---
" this was a good try but it did not work
" function! CtrlPCommand()
"     let c = 0
"     let wincount = winnr('$')
"     " Don't open it here if current buffer is not writable (e.g. NERDTree)
"     while !empty(getbufvar(+expand("<abuf>"), "&buftype")) && c < wincount
"         exec 'wincmd w'
"         let c = c + 1
"     endwhile
"     exec 'CtrlP'
" endfunction
" ----

" find file path on nerd tree
nmap ,n :NERDTreeFind<CR>

" open nerd tree
nmap ,m :NERDTreeToggle<CR>
"  let g:nerdtree_tabs_open_on_console_startup = 1

" close nerdtree if is the last buffer is open
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Exit if the last window is a controlling one (NERDTree, qf). {{{2
" Note: vim-qf has something similar (but simpler).
function! s:QuitIfOnlyControlWinLeft()
  if winnr("$") != 1
    return
  endif
  " Alt Source: https://github.com/scrooloose/nerdtree/issues/21#issuecomment-3348390
  " autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
        \ || &buftype == 'quickfix'
    " NOTE: problematic with Unite's directory, when opening a file:
    " :Unite from startify, then quitting Unite quits Vim; also with TMRU from
    " startify.
        " \ || &ft == 'startify'
    q
  endif
endfunction
augroup my_QuitIfOnlyControlWinLeft
  au!
  au BufEnter * nested call s:QuitIfOnlyControlWinLeft()
augroup END

" nerdtree buffer prevent opening 
let g:miniBufExplModSelTarget = 1

"  vim ag
set runtimepath^=~/.vim/bundle/ag
let g:ag_working_path_mode="r"

" control p
set runtimepath^=~/.vim/bundle/ctrlp.vim

let g:ctrlp_regexp = 1
set wildignore+=*/tmp/*,*/node_modules/*,*/build/json/*,*/build/raw/1/*,*.so,*.swp,*.zip,*min.js
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(node_modules|git|hg|svn|build)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" javascript
let g:javascript_plugin_flow = 1
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1

"  set vim update time
set updatetime=250

" ignore
set wildignore+=.DS_Store

" Better split switching (Ctrl-j, Ctrl-k, Ctrl-h, Ctrl-l) {{{
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l
" }}}

"air vim setting i
" Use patched fonts
let g:airline_powerline_fonts = 1

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tabs = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" enable/disable fugitive/lawrencium integration
let g:airline#extensions#branch#enabled = 1

" enable/disable showing a summary of changed hunks under source control.
let g:airline#extensions#hunks#enabled = 1

" enable/disable showing only non-zero hunks.
let g:airline#extensions#hunks#non_zero_only = 1

let g:airline#extensions#whitespace#enabled = 0

"  codi {{
  let g:codi#interpreters = {
     \ 'javascript': {
         \ 'rightalign': 0,
         \ },
     \ }
" {{
execute pathogen#infect()
syntax on
filetype plugin indent on

" install npm install eslint --global
" install npm install -g eslint-cli
" let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_disabled_filetypes=['html', 'ejs']
let g:syntastic_mode_map = { 'passive_filetypes': ['ejs'] }
let g:syntastic_javascript_eslint_exe='$(npm bin)/eslint'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" search result middle of screen
nnoremap n nzz
nnoremap N Nzz
set scrolloff=5
function! CenterSearch()
  let cmdtype = getcmdtype()
  if cmdtype == '/' || cmdtype == '?'
    return "\<enter>zz"
  endif
  return "\<enter>"
endfunction

cnoremap <silent> <expr> <enter> CenterSearch()
" templates for ejs
au BufNewFile,BufRead *.ejs set filetype=html
au BufRead,BufNewFile,BufReadPost *.json set syntax=json
