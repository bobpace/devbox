NeoBundle 'rking/ag.vim'
let g:ackprg = 'ag --nogroup --nocolor --column'
set grepprg=ag\ --nogroup\ --nocolor
nnoremap \ :Ag<SPACE>
