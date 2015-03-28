NeoBundle 'fsharp/fsharpbinding', {
      \ 'name': 'fsharp',
      \ 'rtp': '~/.vim/bundle/fsharp/vim',
      \ 'build': {
      \ 'unix': 'make install -C vim'
      \ }
    \ }
let g:fsharp_xbuild_path = "/usr/bin/xbuild"
let g:fsharpbinding_debug = 1

autocmd FileType fsharp setlocal tabstop=4
autocmd FileType fsharp setlocal softtabstop=4
autocmd FileType fsharp setlocal shiftwidth=4
