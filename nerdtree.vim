" close tab -> fix issue with Vim close buffer with nerdtree
nnoremap <leader>q :bp\|bd #<CR>

" buffer tab
noremap <f1> :bprev<CR>
noremap <f2> :bnext<CR>

" prevent to open buffer inside of nerdtree
autocmd FileType nerdtree noremap <buffer> <f1> <nop>
autocmd FileType nerdtree noremap <buffer> <f2> <nop>

" let NERDTreeMapOpenInTab='<ENTER>'
let NERDTreeShowHidden=1

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Automatically delete the buffer of the file you just deleted with NerdTree
let NERDTreeAutoDeleteBuffer = 1

"close nerdtree when open controlp
let g:ctrlp_map = ''
nnoremap <c-p> :NERDTreeClose\|CtrlP<CR>
let g:ctrlp_cmd = 'call CtrlPCommand()'

" find file path on nerd tree
nmap ,n :NERDTreeFind<CR>
" open nerd tree
nmap ,m :NERDTreeToggle<CR>

let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1

"  let g:nerdtree_tabs_open_on_console_startup = 1

" close nerdtree if is the last buffer is open
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Exit if the last window is a controlling one (NERDTree, qf). {{{2
function! s:QuitIfOnlyControlWinLeft()
  if winnr("$") != 1
    return
  endif
  " Alt Source: https://github.com/scrooloose/nerdtree/issues/21#issuecomment-3348390
  " autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
        \ || &buftype == 'quickfix'
    q
  endif
endfunction
augroup my_QuitIfOnlyControlWinLeft
  au!
  au BufEnter * nested call s:QuitIfOnlyControlWinLeft()
augroup END

" nerdtree buffer prevent opening
let g:miniBufExplModSelTarget = 1

