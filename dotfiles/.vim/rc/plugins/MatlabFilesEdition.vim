NeoBundle 'vim-scripts/MatlabFilesEdition'
augroup filetypedetect 
  au! BufRead,BufNewFile *.m,*.oct set filetype=matlab 
augroup END 

runtime macros/matchit.vim
nnoremap <F1> :!info octave --vi-keys --index-search <cfile><CR>
