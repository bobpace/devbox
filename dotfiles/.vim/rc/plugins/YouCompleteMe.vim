NeoBundle 'Valloric/YouCompleteMe', {
  \ 'vim_version':'7.3.584', 
  \ 'build' : { 'mac' : './install.sh'},
  \ }
set completeopt-=preview

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
