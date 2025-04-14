" Make sure to have vim-plug
" https://github.com/junegunn/vim-plug
" :PlugInstall, :PlugUpdate, :PlugDiff, :PlugClean
call plug#begin()

" Surround words with parantheses, quotes, etc
Plug 'https://github.com/tpope/vim-surround.git'

call plug#end()

set rnu " relative line number
set number " hybrid - current line shows line number
set tabstop=4
set shiftwidth=4
set expandtab
set nowrap

set splitright
set splitbelow

syntax on

" Vimrc command to quickly edit this file
command Vimrc split ~/.vimrc

" Space as leader
map <Space> <Leader>

" Remap delete commands to use the void register by default
nnoremap "d "_d
nnoremap "D "_D
nnoremap "c "_c
nnoremap "C "_C
nnoremap "x "_x
nnoremap "X "_X

" Scrolling Remap
" This will scroll one line up/down and keep the cursor
" in the same relative position
nnoremap <C-k> <C-y>k
nnoremap <C-j> <C-e>j

" Explore Remaps
" Sex means Split Explore (get your head out of the gutter)
" <CR> is enter
nnoremap <Leader>fs :Sex<CR>
nnoremap <Leader>fd :Vex<CR>
nnoremap <Leader>ff :Explore<CR>

" Split Remaps
nnoremap <Leader>s :split<CR>
nnoremap <Leader>d :vsplit<CR>
nnoremap <Leader>t :term<CR>

" Split Size Remaps
" Equals is plus without shift
" Minus maps to underscore
nnoremap <C-=> <C-w>+
nnoremap <C-_> <C-w>-

" Tab remaps
nnoremap <C-t> :tabnew<CR>
nnoremap <C-Tab> :tabn<CR>
nnoremap <C-S-Tab> :tabp<CR>

highlight markdownItalic cterm=italic ctermfg=darkgray ctermbg=black

