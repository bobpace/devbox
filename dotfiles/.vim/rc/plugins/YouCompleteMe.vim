NeoBundle 'Valloric/YouCompleteMe'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']
set completeopt-=preview
let g:ycm_auto_hover = ''

let g:ycm_filetype_blacklist = {
      \ 'tagbar': 1,
      \ 'notes': 1,
      \ 'markdown': 1,
      \ 'netrw': 1,
      \ 'unite': 1,
      \ 'text': 1,
      \ 'vimwiki': 1,
      \ 'pandoc': 1,
      \ 'infolog': 1,
      \ 'leaderf': 1,
      \ 'mail': 1,
      \ 'sql': 1
      \}

let g:ycm_gopls_args = ['-remote=auto']
let g:ycm_gopls_binary_path = "gopls"
"let g:ycm_gopls_binary_path = [$GOPATH.'/gopls']
