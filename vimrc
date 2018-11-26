" remad leader to comma
let mapleader = ','
" map esc btn
inoremap jj <ESC>

source $HOME/dev/ct/vim/nerdtree.vim
source $HOME/dev/ct/vim/ag.vim
source $HOME/dev/ct/vim/controlP.vim
source $HOME/dev/ct/vim/syntastic.vim

" fix issues with vim-airline color
let &t_Co=256

" $HOME/.vimrc
set backupdir=~/.vimcache/backup//
set directory=~/.vimcache/swap//
set undodir=~/.vimcache/undo//

" close modified buffers (move buffer to the background)
set hidden

set relativenumber
set expandtab ts=2 sw=2 ai
"   This fix the  issue with the delete button
set backspace=indent,eol,start


"   // FORMAT
" copy the previous indentation on autoindenting
set copyindent
" set show matching parenthesis
set showmatch
" change color of matching bracket
hi MatchParen cterm=bold ctermbg=none ctermfg=magenta
"  display spaces and tab
set listchars=tab:>␣,trail:~,extends:>,precedes:<,space:·
set list
" disable listchars
map <f12> :set list!<cr>


"   /// SEARCH
" ignore case when searching
set ignorecase
" highlight search terms
set hlsearch
" show search matches as you type
set incsearch
" hightlight all seach pattern
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
:set hlsearch


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


"   /// CLIPBOARD
" prevent number to copy clipboard
se mouse+=a
" copy to clipboat with control + c
vmap <C-c> "+y

"airline
set encoding=utf8
let g:airline_powerline_fonts = 1

" max line limit
set colorcolumn=100

" insernew line
nmap oo o<Esc>k
nmap OO O<Esc>k

"display full path 
set statusline+=%F

let g:airline#extensions#tabline#buffer_nr_show = 1


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

let g:airline_theme='simple'

let g:airline#extensions#tabline#formatter = 'jsformatter'

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>

" Fuzzy file finder
set rtp+=/usr/local/opt/fzf

"Plugins {
 call plug#begin('~/.vim/plugged')
   " PRE: install silver search : https://github.com/ggreer/the_silver_searcher#installing
   Plug 'scrooloose/nerdtree'
   Plug 'rking/ag.vim'
   Plug 'ap/vim-css-color'
   " Plug 'junegunn/fzf.vim'
   " Plug '/usr/local/opt/fzf'
   Plug 'ctrlpvim/ctrlp.vim'
   Plug 'vim-syntastic/syntastic'
   Plug 'vim-scripts/tComment'
   Plug 'vim-airline/vim-airline'
   Plug 'vim-airline/vim-airline-themes'
   Plug 'airblade/vim-gitgutter'
   Plug 'pangloss/vim-javascript'
   Plug 'mxw/vim-jsx'
call plug#end()

execute pathogen#infect()
