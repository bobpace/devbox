NeoBundle 'majutsushi/tagbar'
let g:tagbar_autofocus = 0
nmap <silent> <F4> :TagbarToggle<CR>

autocmd FileType qf if (getwininfo(win_getid())[0].loclist != 1) | wincmd J | endif
