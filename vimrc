" Make sure to have vim-plug
" https://github.com/junegunn/vim-plug
" :PlugInstall, :PlugUpdate, :PlugDiff, :PlugClean

" Installs plugins via plug-vim
call plug#begin()

" Color Scheme
Plug 'https://github.com/morhetz/gruvbox'

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

" Colors
syntax on
set termguicolors
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'

" Vimrc command to quickly edit this file
command! Vimrc split ~/.vimrc

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

" Term Remaps
nnoremap <Leader>t :term<CR>
command! Vterm :vert term

" Split Size Remaps
" Equals is plus without shift
" Minus maps to underscore
nnoremap <C-=> <C-w>+
nnoremap <C-_> <C-w>-

" Tab remaps
nnoremap <C-t> :tabnew<CR>
nnoremap <Tab> :tabn<CR>
nnoremap <S-Tab> :tabp<CR>

highlight markdownItalic cterm=italic ctermfg=darkgray ctermbg=black

