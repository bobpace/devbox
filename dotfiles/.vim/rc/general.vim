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
"if exists('$TMUX')
  "set clipboard=
"else
set clipboard=unnamed      "sync with OS clipboard
"endif
set hidden                   "allow buffer switching without saving
set autoread 
set showcmd
set tags=tags;/
set showfulltag
set modeline
set modelines=5
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store,*/.mimosa
set visualbell t_vb=         " No beep sound
set noerrorbells
set novisualbell
set hlsearch
set incsearch
set ignorecase
set smartcase
set noswapfile
