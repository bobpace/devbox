let mapleader = ','
let g:mapleader = ','
set lazyredraw             " don't redraw while executing macros
set fileformats=unix,mac,dos " Automatic end-of-file format detection
" set autoindent               " automatic indent new lines
set smartindent              " be smart about it
set expandtab                " expand tabs to spaces
set smarttab                   " no tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
" Allow backspacing over everything in insert mode
set backspace=indent,eol,start
set clipboard=unnamed
set hidden                   "allow buffer switching without saving
set autoread 
set showcmd
set tags=tags;/
set showfulltag
set modeline
set modelines=5
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store,*/.mimosa
set hlsearch
set incsearch
set ignorecase
set smartcase
set noswapfile
set exrc
set secure
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode
set virtualedit=block
set splitbelow
set splitright
set linebreak
set autoread
au BufRead *.spark set filetype=html
au BufRead *.cake set filetype=cs
au BufRead *.lic set filetype=ruby

set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

"augroup XML
    "autocmd!
    "autocmd FileType xml setlocal foldmethod=indent foldlevelstart=999 foldminlines=0
"augroup END
