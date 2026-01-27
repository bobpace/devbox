NeoBundle 'rking/ag.vim'
let g:ackprg = 'ag --vimgrep'
let g:ag_prg="ag --vimgrep"
set grepprg=ag\ --vimgrep
nnoremap \ :Ag!<SPACE>
nnoremap <C-\> :ccl<CR>
nnoremap \| :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
let g:ag_highlight=1
let g:ag_mapping_message=0

set t_ti= t_te=

"function Search(string) abort
"  let saved_shellpipe = &shellpipe
"  let &shellpipe = '>'
"  try
"    execute 'Ack!' shellescape(a:string, 1)
"  finally
"    let &shellpipe = saved_shellpipe
"  endtry
"endfunction
