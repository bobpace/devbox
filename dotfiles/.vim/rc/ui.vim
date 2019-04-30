set encoding=utf-8
set background=dark
set t_Co=256
silent! colorscheme vividchalk
set showmatch                                       "automatically highlight matching braces/brackets/etc.
set matchtime=2                                     "tens of a second to show matching parentheses
set number
set lazyredraw
set laststatus=2
set noshowmode
set noshowmatch
set foldenable                                      "enable folds by default
set foldmethod=syntax                               "fold via syntax of files
set foldlevelstart=99                               "open all folds by default
let g:xml_syntax_folding=1                          "enable xml folding

set timeoutlen=300
set ttimeoutlen=10

set mouse=a                                         "enable mouse
set mousehide                                       "hide when characters are typed
set history=1000                                    "number of command lines to remember
set ttyfast                                         "assume fast terminal connection
set viewoptions=folds,options,cursor,unix,slash     "unix/windows compatibility

"set cursorline
"autocmd WinLeave * setlocal nocursorline
"autocmd WinEnter * setlocal cursorline

if has('gui_running')
  set guioptions+=t
  set guioptions-=T
  set transparency=2
else
  set shellpipe=>
  let &t_ti.="\e[1 q"
  let &t_SI.="\e[5 q"
  let &t_EI.="\e[1 q"
  let &t_te.="\e[0 q"
endif

if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif
