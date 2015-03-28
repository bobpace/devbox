NeoBundle 'OmniSharp/omnisharp-vim'
let g:OmniSharp_selecter_ui = 'ctrlp'

"can set preview here also but i found it causes flicker
set completeopt=longest,menuone

"makes enter work like C-y, confirming a popup selection
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']

augroup omnisharp_commands
  autocmd!

  "Set autocomplete function to OmniSharp (if not using YouCompleteMe completion plugin)
  autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

  "4 space tabs
  autocmd FileType cs setlocal tabstop=4
  autocmd FileType cs setlocal softtabstop=4
  autocmd FileType cs setlocal shiftwidth=4

  " Synchronous build (blocks Vim)
  "autocmd FileType cs nnoremap <F5> :wa!<cr>:OmniSharpBuild<cr>
  " Builds can also run asynchronously with vim-dispatch installed
  autocmd FileType cs nnoremap <leader>b :wa!<cr>:OmniSharpBuildAsync<cr>
  " automatic syntax check on events (TextChanged requires Vim 7.4)
  autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck

  " Automatically add new cs files to the nearest project on save
  autocmd BufWritePost *.cs call OmniSharp#AddToProject()

  "show type information automatically when the cursor stops moving
  autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

  "The following commands are contextual, based on the current cursor position.

  autocmd FileType cs nnoremap gd :OmniSharpGotoDefinition<cr>
  autocmd FileType cs nnoremap <leader>fi :OmniSharpFindImplementations<cr>
  autocmd FileType cs nnoremap <leader>ft :OmniSharpFindType<cr>
  autocmd FileType cs nnoremap <leader>fs :OmniSharpFindSymbol<cr>
  autocmd FileType cs nnoremap <leader>fu :OmniSharpFindUsages<cr>
  "finds members in the current buffer
  autocmd FileType cs nnoremap <leader>fm :OmniSharpFindMembers<cr>
  " cursor can be anywhere on the line containing an issue
  autocmd FileType cs nnoremap <leader>x  :OmniSharpFixIssue<cr>
  autocmd FileType cs nnoremap <leader>fx :OmniSharpFixUsings<cr>
  autocmd FileType cs nnoremap <leader>tt :OmniSharpTypeLookup<cr>
  autocmd FileType cs nnoremap <leader>dc :OmniSharpDocumentation<cr>
  "navigate up by method/property/field
  autocmd FileType cs nnoremap <leader>k :OmniSharpNavigateUp<cr>
  "navigate down by method/property/field
  autocmd FileType cs nnoremap <leader>j :OmniSharpNavigateDown<cr>

  " Contextual code actions (requires CtrlP or unite.vim)
  autocmd FileType cs nnoremap <leader><space> :OmniSharpGetCodeActions<cr>
  " Run code actions with text selected in visual mode to extract method
  autocmd FileType cs vnoremap <leader><space> :call OmniSharp#GetCodeActions('visual')<cr>

  " rename with dialog
  autocmd FileType cs nnoremap <leader>nm :OmniSharpRename<cr>
  " rename without dialog - with cursor on the symbol to rename... ':Rename newname'
  command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

  " Force OmniSharp to reload the solution. Useful when switching branches etc.
  autocmd FileType cs nnoremap <leader>rs :OmniSharpReloadSolution<cr>
  autocmd FileType cs nnoremap <leader>cf :OmniSharpCodeFormat<cr>
  " Load the current .cs file to the nearest project
  autocmd FileType cs nnoremap <leader>tp :OmniSharpAddToProject<cr>

  " (Experimental - uses vim-dispatch or vimproc plugin) - Start the omnisharp server for the current solution
  autocmd FileType cs nnoremap <leader>ss :OmniSharpStartServer<cr>
  autocmd FileType cs nnoremap <leader>sp :OmniSharpStopServer<cr>

  " Add syntax highlighting for types and interfaces
  autocmd FileType cs nnoremap <leader>th :OmniSharpHighlightTypes<cr>

  autocmd FileType cs nnoremap <leader>rt :OmniSharpRunTests<cr>
  autocmd FileType cs nnoremap <leader>rf :OmniSharpRunTestFixture<cr>
  autocmd FileType cs nnoremap <leader>ra :OmniSharpRunAllTests<cr>
  autocmd FileType cs nnoremap <leader>rl :OmniSharpRunLastTests<cr>

augroup END

set updatetime=500
" Remove 'Press Enter to continue' message when type information is longer than one line.
set cmdheight=2
