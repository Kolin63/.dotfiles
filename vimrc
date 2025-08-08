"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SETS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Line Numbers
set rnu
set number

" Line Wrap
set nowrap

" Tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smartindent

" Makes Undo Files in a seperate directory
set noswapfile
set nobackup
set undodir=~/.vim/undodir

" Splits
set splitright
set splitbelow

" Colors
set syntax
set termguicolors
set bg=dark

" Faster Update Times
set updatetime=50

" Cursor Line
set cursorline

" Color Column
set colorcolumn=80

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" REMAPS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Leader
map <Space> <Leader>
map <Space> <LocalLeader>

" Leader pv does explore
nnoremap <Leader>pv :Explore<CR>

" Tab remaps
nnoremap <C-t> :tabnew<CR>
nnoremap <Tab> :tabn<CR>
nnoremap <S-Tab> :tabp<CR>
noremap <PageUp> :tabn<CR>
noremap <PageDown> :tabp<CR>

" Scrolling Remap
nnoremap <M-k> 2<C-y>2k
nnoremap <M-j> 2<C-e>2j
nnoremap <C-k> 2<C-y>
nnoremap <C-j> 2<C-e>

" Leader Y Goes to System Clipboard
" + Register is System Clipboard
nnoremap <Leader>y \"+y
vnoremap <Leader>y \"+y
nnoremap <Leader>Y \"+Y

" Void Register Delete
nnoremap <Leader>d \"_d
vnoremap <Leader>d \"_d
nnoremap <Leader>D \"_D
vnoremap <Leader>D \"_D

" Leader S over a word to replace it
nnoremap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>

" Split Remaps
nnoremap <M-s> :split<CR>:Explore<CR>
nnoremap <M-d> :vsplit<CR>:Explore<CR>
nnoremap <M-t> :split<CR>:term<CR>A

" Big D to dd
nnoremap D dd
" Big Y to yy
nnoremap Y yy
" Big C to cc
nnoremap C cc

" Alt d deletes word in insert mode
inoremap <M-d> <Esc>diwi

" Ctrl d maps to backspace in insert mode
inoremap <C-d> <BS>

" Emacs controls (dont worry guys its ok)
inoremap <C-f> <Esc>la
nnoremap <C-f> l
inoremap <C-b> <Esc>i
nnoremap <C-b> h

" Ctrl Shift G Opens GitHub Repo in Web
nnoremap <C-G> :!gh repo view --web<CR>

" Auto Braces and Parentheses and stuff
inoremap { {}<Esc>i
inoremap [ []<Esc>i
" inoremap ( ()<Esc>i
" inoremap \" \"\"<Esc>i
" inoremap ' ''<Esc>i

" Ctrl Z undo
inoremap <C-z> <Esc>ui
nnoremap <C-z> <Esc>u

" Get rid of arrow keys
nnoremap <Up> <nop>
inoremap <Up> <nop>
vnoremap <Up> <nop>
nnoremap <Down> <nop>
inoremap <Down> <nop>
vnoremap <Down> <nop>
nnoremap <Left> <nop>
inoremap <Left> <nop>
vnoremap <Left> <nop>
nnoremap <Right> <nop>
inoremap <Right> <nop>
vnoremap <Right> <nop>
nnoremap <S-Up> <nop>
inoremap <S-Up> <nop>
vnoremap <S-Up> <nop>
nnoremap <S-Down> <nop>
inoremap <S-Down> <nop>
vnoremap <S-Down> <nop>
nnoremap <S-Left> <nop>
inoremap <S-Left> <nop>
vnoremap <S-Left> <nop>
nnoremap <S-Right> <nop>
inoremap <S-Right> <nop>
vnoremap <S-Right> <nop>
