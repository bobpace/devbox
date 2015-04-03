NeoBundle 'bobpace/omnisharp-vim', {'rev': 'nunitQuickfix'}
let g:OmniSharp_selecter_ui = 'ctrlp'

"can set preview here also but i found it causes flicker
set completeopt=longest,menuone

"makes enter work like C-y, confirming a popup selection
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']

autocmd Filetype cs,cshtml.html call SetOmniSharpOptions()
function SetOmniSharpOptions()
  echom "testing"
  setlocal omnifunc=OmniSharp#Complete
  setlocal tabstop=4
  setlocal softtabstop=4
  setlocal shiftwidth=4
  " Builds can also run asynchronously with vim-dispatch installed
  nnoremap <leader>b :wa!<cr>:OmniSharpBuildAsync<cr>

  nnoremap gd :OmniSharpGotoDefinition<cr>
  nnoremap <leader>fi :OmniSharpFindImplementations<cr>
  nnoremap <leader>ft :OmniSharpFindType<cr>
  nnoremap <leader>fs :OmniSharpFindSymbol<cr>
  nnoremap <leader>fu :OmniSharpFindUsages<cr>

  nnoremap <leader>fm :OmniSharpFindMembers<cr>
  " cursor can be anywhere on the line containing an issue
  nnoremap <leader>x  :OmniSharpFixIssue<cr>
  nnoremap <leader>fx :OmniSharpFixUsings<cr>
  nnoremap <leader>tt :OmniSharpTypeLookup<cr>
  nnoremap <leader>dc :OmniSharpDocumentation<cr>
  "navigate up by method/property/field
  nnoremap <leader>k :OmniSharpNavigateUp<cr>
  "navigate down by method/property/field
  nnoremap <leader>j :OmniSharpNavigateDown<cr>

  " Contextual code actions (requires CtrlP or unite.vim)
  nnoremap <leader><space> :OmniSharpGetCodeActions<cr>
  " Run code actions with text selected in visual mode to extract method
  vnoremap <leader><space> :call OmniSharp#GetCodeActions('visual')<cr>

  " rename with dialog
  nnoremap <leader>nm :OmniSharpRename<cr>
  " rename without dialog - with cursor on the symbol to rename... ':Rename newname'

  " Force OmniSharp to reload the solution. Useful when switching branches etc.
  nnoremap <leader>rs :OmniSharpReloadSolution<cr>
  nnoremap <leader>cf :OmniSharpCodeFormat<cr>
  " Load the current .cs file to the nearest project
  nnoremap <leader>tp :OmniSharpAddToProject<cr>

  " (Experimental - uses vim-dispatch or vimproc plugin) - Start the omnisharp server for the current solution
  nnoremap <leader>ss :OmniSharpStartServer<cr>
  nnoremap <leader>sp :OmniSharpStopServer<cr>

  " Add syntax highlighting for types and interfaces
  nnoremap <leader>th :OmniSharpHighlightTypes<cr>

  nnoremap <leader>rt :OmniSharpRunTests<cr>
  nnoremap <leader>rf :OmniSharpRunTestFixture<cr>
  nnoremap <leader>ra :OmniSharpRunAllTests<cr>
  nnoremap <leader>rl :OmniSharpRunLastTests<cr>
endfunction

augroup omnisharp_commands
  autocmd!

  command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

  " automatic syntax check on events (TextChanged requires Vim 7.4)
  autocmd BufEnter,TextChanged,InsertLeave *.cs,*.cshtml SyntasticCheck

  " Automatically add new cs files to the nearest project on save
  autocmd BufWritePost *.cs,*.cshtml call OmniSharp#AddToProject()

  "show type information automatically when the cursor stops moving
  autocmd CursorHold *.cs,*.cshtml call OmniSharp#TypeLookupWithoutDocumentation()
augroup END

set updatetime=500
" Remove 'Press Enter to continue' message when type information is longer than one line.
set cmdheight=2
