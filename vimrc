" $HOME/.vimrc
set backupdir=~/.vimcache/backup//
set directory=~/.vimcache/swap//
set undodir=~/.vimcache/undo//
" set directory= ~/.vim/swapfiles//

"runtime bundles/tplugin_vim/macros/tplugin.v
set relativenumber
set expandtab ts=2 sw=2 ai
"   This fix the  issue with the delete button
set backspace=indent,eol,start

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

" prevent number to copy clipboard
se mouse+=a
set guifont=DejaVu\ Sans:s12

"airline
set encoding=utf8
let g:airline_powerline_fonts = 1

" copy to clipboat with control + c
vmap <C-c> "+y

" max line limit
set colorcolumn=100

" map esc btn
inoremap jj <ESC>

" close modified buffers
set hidden

" insernew line
nmap oo o<Esc>k
nmap OO O<Esc>k

"display full path 
set statusline+=%F
".. hightlight all seach pattern
:set hlsearch

if has("gui_macvim")
    let macvim_hig_shift_movement = 1
endif

" buftab
noremap <f1> :bprev<CR> 
noremap <f2> :bnext<CR> 

let g:airline#extensions#tabline#buffer_nr_show = 1

" prevent to open buffer inside of nerdtree
autocmd FileType nerdtree noremap <buffer> <f1> <nop>
autocmd FileType nerdtree noremap <buffer> <f2> <nop>

" let NERDTreeMapOpenInTab='<ENTER>'
let NERDTreeShowHidden=1

"close nerdtree when open controlp
let g:ctrlp_map = ''
nnoremap <c-p> :NERDTreeClose\|CtrlP<CR>

" open nerdtree with f6
nmap <F6> :NERDTreeTabsToggle<CR>

" find file path on nerd tree
nmap ,n :NERDTreeFind<CR>

" open nerd tree
nmap ,m :NERDTreeToggle<CR>
"  let g:nerdtree_tabs_open_on_console_startup = 1

" close nerdtree if is the last buffer is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" nerdtree buffer prevent opening 
let g:miniBufExplModSelTarget = 1

" i vim ag
set runtimepath^=~/.vim/bundle/ag
let g:ag_working_path_mode="r"

" control p
set runtimepath^=~/.vim/bundle/ctrlp.vim

let g:ctrlp_regexp = 1
set wildignore+=*/tmp/*,*/node_modules/*,*.so,*.swp,*.zip 
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(node_modules|git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" seelect line
if has("gui_macvim")
    let macvim_hig_shift_movement = 1
endif

" javascript
let g:javascript_plugin_flow = 1
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1

"  set vim update time
set updatetime=250

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

execute pathogen#infect()
syntax on
filetype plugin indent on

" install npm install eslint --global
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe='$(npm bin)/eslint'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
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
