" This vimrc file should work with minimal features and even if no plugins are available.

" Set these before defining any maps:
let mapleader = ' '
let maplocalleader = '\'
" pseudo-leader
nnoremap , <nop>
xnoremap , <nop>

" two keystrokes operate linewise:
"   yy               yank linewise
"   dd             delete linewise
"   vv             visual linewise
nnoremap yy yy| " yank linewise. Redundant with default behavior
nnoremap dd dd| " delete linewise. Redundant with default behavior
nnoremap vv V| " visual linewise.

" capital letter operates until end of line:
"   Y           yank to end of line
"   D           delete to end of line
"   V           visual to end of line
nnoremap Y y$| " yank to end of line. Redundant with :h default-mappings in neovim
nnoremap D D| " delete to end of line. Redundant with default behavior
nnoremap V v$h| " visual to end of line.

" from neovim's :h default-mappings:
nnoremap Y y$
nnoremap <C-L> <Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>
inoremap <C-U> <C-G>u<C-U>
inoremap <C-W> <C-G>u<C-W>

nnoremap <space>w :set wrap!<cr>:set wrap?<cr>| " toggle wrap

set cmdheight=2
set completeopt=menu,menuone,noselect
set expandtab
set formatoptions-=c
set formatoptions-=t
set ignorecase
set list
set mouse=a
if has("mouse")
  set mouse=a
endif
set noequalalways
set nohidden
set nosmarttab
set nowrap
set number
set numberwidth=1
set scrolloff=1
set shiftwidth=0
set sidescrolloff=5
set smartcase
set spell
set tabstop=2
set termguicolors
set undofile
set updatetime=200
set textwidth=100

nnoremap Y y$| " vim compat
nnoremap ; :
xnoremap ; :
" forward t/T/f/F
nnoremap " ;| " repeat  search
xnoremap " ;| " repeat  search
" reverse t/T/f/F
nnoremap : ,| " reverse search
xnoremap : ,| " reverse search
" register
nnoremap ' "| " access reg
xnoremap ' "| " access reg
inoremap jk <esc>l
nnoremap q :q<cr>|                                                 " quit
xnoremap <space>c  "+y|                                            " Copy w/ clipboard
nnoremap <space>c  ^"+y$|                                          " Copy w/ clipboard
nnoremap <space>p  :set paste<cr>i<C-r>+<esc>:set nopaste<cr>|     " Paste clipboard
xnoremap <space>p  <cmd>set paste<cr>"+p<cmd>set nopaste<cr>|      " Paste clipboard
nnoremap <space>P  :set paste!<cr>|                                " toggle &paste
nnoremap <space>ic :set ic!<cr>|                                   " toggle &ignorecase

nnoremap ,e :edit<cr>| " edit current file
nnoremap ,w :write<cr>| " write file
nnoremap ,q q| " record macro
nnoremap ,m m| " mark

" directional window movement
nnoremap h <c-w>h| " <m-h> -> move left
nnoremap j <c-w>j| " <m-j> -> move down
nnoremap k <c-w>k| " <m-k> -> move up
nnoremap l <c-w>l| " <m-l> -> move right

if has("nvim")
  tmap <M-h> <C-\><C-n><M-h>
  tmap <M-j> <C-\><C-n><M-j>
  tmap <M-k> <C-\><C-n><M-k>
  tmap <M-l> <C-\><C-n><M-l>
  imap <M-h> <C-\><C-n><M-h>
  imap <M-j> <C-\><C-n><M-j>
  imap <M-k> <C-\><C-n><M-k>
  imap <M-l> <C-\><C-n><M-l>
else
  tmap h <C-\><C-n>h
  tmap j <C-\><C-n>j
  tmap k <C-\><C-n>k
  tmap l <C-\><C-n>l
  imap h <C-\><C-n>h
  imap j <C-\><C-n>j
  imap k <C-\><C-n>k
  imap l <C-\><C-n>l
endif

if has("nvim")
  nnoremap <m-=> <C-W>=| "<m-=> -> equalize win H&W (CTRL-W_=)"
else
  nnoremap = <C-W>=| "<m-=> -> equalize win H&W (CTRL-W_=)"
endif
nnoremap ,H    :topleft    vs<cr>| "sp far left"
nnoremap ,J    :botright   sp<cr>| "sp far below"
nnoremap ,K    :topleft    sp<cr>| "sp far above"
nnoremap ,L    :botright   vs<cr>| "sp far right"
nnoremap ,h    :leftabove  vs<cr>| "sp     left"
nnoremap ,j    :belowright sp<cr>| "sp     below"
nnoremap ,k    :aboveleft  sp<cr>| "sp     above"
nnoremap ,l    :rightbelow vs<cr>| "sp     right"
nnoremap ,t    :tabe<cr>:verbose pwd<cr>| "new tab (blank)"
nnoremap ,T    :tab sp<cr>:verbose pwd<cr>| "new tab (currrent buf)"

nnoremap <silent> <left>    :tabp  <cr>:verbose pwd<cr>| " goto tab left
nnoremap <silent> <Right>   :tabn  <cr>:verbose pwd<cr>| " goto tab right
nnoremap <silent> <Up>      :tabfir<cr>:verbose pwd<cr>| " goto tab first
nnoremap <silent> <Down>    :tabl  <cr>:verbose pwd<cr>| " goto tab left
nnoremap <silent> <C-Left>  :tabm -<cr>| " mv tab left
nnoremap <silent> <C-Right> :tabm +<cr>| " mv tab right

nnoremap -max :resize 1000<cr>| " maximize split
nnoremap -min :resize 0<cr>| " minimize split
nnoremap -vmax :vert resize 1000<cr>| " maximize vertical split
nnoremap -vmin :vert resize 0<cr>| " minimize vertical split

xnoremap <space>so :sort<cr>
xnoremap <expr> <space>sl ":! awk ' { print length(), $0 \| " . '"' . "sort -n \| cut -d\\  -f2-" . '"' . " }'<cr>"| " sort lines by length:

nnoremap gf :e <cfile><CR>

autocmd WinEnter,VimEnter,Bufenter *\(.md\)\@<! set cursorline " all ft except md
function! GetColorColumn()
  if &textwidth == 0
    return 101
  else
    return &textwidth + 1
  endif
endfunction
autocmd WinEnter,VimEnter * exe 'set colorcolumn='.GetColorColumn()
autocmd WinLeave * set nocursorline colorcolumn=

autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * checktime

augroup HelpFileTypeSetup
  autocmd FileType help syntax on | setlocal number
augroup END

highlight LineNr ctermfg=white ctermbg=grey
highlight LineNr guifg=white guibg=grey
