NeoBundle 'fsharp/fsharpbinding', {
      \ 'name': 'fsharp',
      \ 'rtp': '~/.vim/bundle/fsharp/vim',
      \ 'build': {
      \ 'linux': 'make install -C vim'
      \ }
    \ }
let g:fsharp_xbuild_path = "/usr/bin/xbuild"
let g:fsharpbinding_debug = 1
