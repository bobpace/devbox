nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <Space> :nohlsearch<CR>
nnoremap <leader>sc :SyntasticCheck<CR>

nnoremap <leader>vv :source ~/.vimrc<CR>

"make Y behave like C and D
nnoremap Y y$

"keep cursor where it is while joining lines
nnoremap J mzJ`z

"center screen after moving
nnoremap n nzz
nnoremap } }zz

"find all occurences of word under cursor
nnoremap K :Ag! "<cfile>"<CR>

nnoremap <F1> <nop>
nnoremap Q <nop>

nnoremap <leader>q :q<CR>

" Close the current buffer
map <leader>bd :Bclose<cr>

" switch to last open buffer
nnoremap <leader><leader> :b#<CR>

nnoremap <leader>fx :silent %!xmllint --encode UTF-8 --format -<CR>

vmap <leader>fs <ESC>:'<,'>! pg_format --spaces 2 --function-case 2<CR>

"nnoremap <leader>sg :!open "https://github.com/search?q=org\%3Aweave-lab+<cword>&type=code"<CR><CR>
