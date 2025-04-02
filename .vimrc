set rnu " relative line number
set number " hybrid - current line shows line number
set tabstop=4
set shiftwidth=4
set expandtab

set splitright

syntax on

" Remap delete commands to use the void register by default
nnoremap "d "_d
nnoremap "D "_D
nnoremap "c "_c
nnoremap "C "_C
nnoremap "x "_x
nnoremap "X "_X

highlight markdownItalic cterm=italic ctermfg=darkgray ctermbg=black
