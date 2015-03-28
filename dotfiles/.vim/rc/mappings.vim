nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <Space> :nohlsearch<CR>

"make Y behave like C and D
nnoremap Y y$

"keep cursor where it is while joining lines
nnoremap J mzJ`z

"center screen after moving
nnoremap n nzz
nnoremap } }zz

"find all occurences of word under cursor
nnoremap K :grep! "\b<cfile>\b"<CR>:cw<CR>

nnoremap <F1> <nop>
nnoremap Q <nop>

" Close the current buffer
map <leader>bd :Bclose<cr>

" switch to last open buffer
nnoremap <leader><leader> :b#<CR>
