NeoBundleLazy 'fatih/vim-go', {'autoload': {'filetypes':['go']}}
let g:go_bin_path = expand("~/go/bin")
let g:go_doc_popup_window = 1
let g:go_jump_to_error = 0
let g:go_auto_sameids = 0
let g:go_test_show_name=1

"let g:go_list_type = "quickfix"
"let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
"let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_list_type = "quickfix"

let g:go_def_mode = "gopls"
let g:go_metalinter_command = "golangci-lint"
let g:go_metalinter_autosave_enabled = []
let g:go_metalinter_enabled = []

au FileType go nmap <leader>gd <Plug>(go-doc)
au FileType go nmap <leader>gv <Plug>(go-doc-vertical)
au FileType go nmap gd <Plug>(go-def)
"au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>r <Plug>:GoBuildTags ''<cr>
"au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>tt <Plug>(go-test-func)
au FileType go nmap <leader>c <Plug>(go-coverage-toggle)
"au FileType go nmap <leader>ci <Plug>(go-describe)
au FileType go nmap <leader>f <Plug>(go-callers)
au FileType go nmap <leader>fs :GoFillStruct<cr>
au FileType go nmap <leader>e <Plug>(go-rename)
au FileType go nmap <leader>s <Plug>(go-implements)
au FileType go nmap <leader>i <Plug>(go-info)
au FileType go nmap <leader>ii <Plug>(go-implements)
au FileType go nmap <leader>ds <Plug>(go-def-split)
au FileType go nmap <leader>dv <Plug>(go-def-vertical)
au FileType go nmap <leader>dt <Plug>(go-def-tab)
au FileType go nmap <leader>ae <Plug>(go-alternate-edit)
au FileType go nmap <leader>av <Plug>(go-alternate-vertical)

"run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

au FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
