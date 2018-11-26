
" install npm install eslint --global
syntax on
filetype plugin indent on
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_disabled_filetypes=['html', 'ejs']
let g:syntastic_mode_map = { 'passive_filetypes': ['ejs'] }
let g:syntastic_javascript_eslint_exe='$(npm bin)/eslint'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" javascript
let g:javascript_plugin_flow = 1
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1

" templates for ejs
au BufNewFile,BufRead *.ejs set filetype=html
au BufRead,BufNewFile,BufReadPost *.json set syntax=json

