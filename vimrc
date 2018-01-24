"runtime bundles/tplugin_vim/macros/tplugin.v
set relativenumber
set expandtab ts=2 sw=2 ai
"   This fix the  issue with the delete button
set backspace=indent,eol,start

"  display spaces and tab
set listchars=tab:>␣,trail:~,extends:>,precedes:<,space:·
set list

" disable listchars
map <f12> :set list!<cr>

" prevent number to copy clipboard
se mouse+=a

" copy to clipboat with control + c
vmap <C-c> "+y

hi NonText ctermfg=7 guifg=gray
"  set listchars=tab:>-
" esc
inoremap jj <ESC>

" close modified buffers
set hidden

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

" let NERDTreeMapOpenInTab='<ENTER>'
let NERDTreeShowHidden=1

"map nerdtree
" nmap <F6> :NERDTreeTabsToggle<CR>
nmap ,n :NERDTreeFind<CR>
nmap ,m :NERDTreeToggle<CR>
"  let g:nerdtree_tabs_open_on_console_startup = 1

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

" set delete btns
nnoremap <leader>d "_d
vnoremap <leader>d "_d
vnoremap <leader>p "_dP

execute pathogen#infect()
syntax on
filetype plugin indent on
