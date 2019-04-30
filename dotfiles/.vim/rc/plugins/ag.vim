NeoBundle 'rking/ag.vim'
let g:ackprg = 'ag --vimgrep'
let g:ag_prg="ag --vimgrep"
set grepprg=ag\ --vimgrep
nnoremap \ :Ag!<SPACE>
nnoremap <C-\> :ccl<CR>
let g:ag_highlight=1
let g:ag_mapping_message=0
