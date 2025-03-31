set rnu
set tabstop=4
set shiftwidth=4
set expandtab

set splitright

syntax on

" Note: Caps should send F13
" Make F13 act as Escape
inoremap <F13> <Esc>
nnoremap <F13> <Esc>
vnoremap <F13> <Esc>

" Make F13 + F act as Tab
inoremap <F13>f <Tab>
nnoremap <F13>f <Tab>
vnoremap <F13>f <Tab>
