" Make sure to have vim-plug
" https://github.com/junegunn/vim-plug
" :PlugInstall, :PlugUpdate, :PlugDiff, :PlugClean

" Installs plugins via plug-vim
call plug#begin()

" Color Scheme
Plug 'https://github.com/morhetz/gruvbox'

" Airline
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/vim-airline/vim-airline-themes'

" Surround words with parantheses, quotes, etc
Plug 'https://github.com/tpope/vim-surround'

" CPP Completion
Plug 'https://github.com/vim-scripts/OmniCppComplete'

" CPP Syntax Highlighting
Plug 'https://github.com/bfrg/vim-c-cpp-modern'

" Error Checker / Linter
Plug 'https://github.com/dense-analysis/ale'

" A Plugin :A swaps between .h and .cpp
Plug 'https://github.com/vim-scripts/a.vim'

" Dependencies
Plug 'https://github.com/marcweber/vim-addon-mw-utils'
Plug 'https://github.com/tomtom/tlib_vim'

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
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_italic=1
colorscheme gruvbox
set bg=dark

" Airline
let g:airline_theme='base16_gruvbox_dark_hard'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Guideline Column
set colorcolumn=80

" Completion Tags
set tags+=~/.vim/tags/cpp

" OmniCPPComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

" Ale (Linter)
let g:ale_fixers = ['clangtidy']
let g:ale_fix_on_save = 1

" Vimrc command to quickly edit this file
command! Vimrc tabnew ~/.vimrc

" Space as leader
map <Space> <Leader>

" Remap delete commands to use the void register by default
nnoremap "d "_d
nnoremap "D "_D
nnoremap "c "_c
nnoremap "C "_C
nnoremap "x "_x
nnoremap "X "_X

" Big letter stuff
nnoremap D dd
nnoremap Y yy
nnoremap C cc

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

