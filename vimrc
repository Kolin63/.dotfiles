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
syntax on
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

" Scrolling Remap
nnoremap <M-k> 2<C-y>2k
nnoremap <M-j> 2<C-e>2j
nnoremap <C-k> 2<C-y>
nnoremap <C-j> 2<C-e>

" Page Up and Down
nnoremap <PageUp> <C-u>
nnoremap <PageDown> <C-d>
nnoremap <S-PageUp> <PageUp>
nnoremap <S-PageDown> <PageDown>

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM TMUX NAVIGATOR
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Maps <C-h/j/k/l> to switch vim splits in the given direction. If there are no more windows in that direction, forwards the operation to tmux.
" Additionally, <C-\> toggles between last active vim splits/tmux panes.

if exists("g:loaded_tmux_navigator") || &cp || v:version < 700
  finish
endif
let g:loaded_tmux_navigator = 1

function! s:VimNavigate(direction)
  try
    execute 'wincmd ' . a:direction
  catch
    echohl ErrorMsg | echo 'E11: Invalid in command-line window; <CR> executes, CTRL-C quits: wincmd k' | echohl None
  endtry
endfunction

if !get(g:, 'tmux_navigator_no_mappings', 0)
  nnoremap <silent> <c-h> :<C-U>TmuxNavigateLeft<cr>
  nnoremap <silent> <c-j> :<C-U>TmuxNavigateDown<cr>
  nnoremap <silent> <c-k> :<C-U>TmuxNavigateUp<cr>
  nnoremap <silent> <c-l> :<C-U>TmuxNavigateRight<cr>
  nnoremap <silent> <c-\> :<C-U>TmuxNavigatePrevious<cr>

  if !empty($TMUX)
    function! IsFZF()
      return &ft == 'fzf'
    endfunction
    tnoremap <expr> <silent> <C-h> IsFZF() ? "\<C-h>" : "\<C-w>:\<C-U> TmuxNavigateLeft\<cr>"
    tnoremap <expr> <silent> <C-j> IsFZF() ? "\<C-j>" : "\<C-w>:\<C-U> TmuxNavigateDown\<cr>"
    tnoremap <expr> <silent> <C-k> IsFZF() ? "\<C-k>" : "\<C-w>:\<C-U> TmuxNavigateUp\<cr>"
    tnoremap <expr> <silent> <C-l> IsFZF() ? "\<C-l>" : "\<C-w>:\<C-U> TmuxNavigateRight\<cr>"
  endif

  if !get(g:, 'tmux_navigator_disable_netrw_workaround', 0)
    if !exists('g:Netrw_UserMaps')
      let g:Netrw_UserMaps = [['<C-l>', '<C-U>TmuxNavigateRight<cr>']]
    else
      echohl ErrorMsg | echo 'vim-tmux-navigator conflicts with netrw <C-l> mapping. See https://github.com/christoomey/vim-tmux-navigator#netrw or add `let g:tmux_navigator_disable_netrw_workaround = 1` to suppress this warning.' | echohl None
    endif
  endif
endif

if empty($TMUX)
  command! TmuxNavigateLeft call s:VimNavigate('h')
  command! TmuxNavigateDown call s:VimNavigate('j')
  command! TmuxNavigateUp call s:VimNavigate('k')
  command! TmuxNavigateRight call s:VimNavigate('l')
  command! TmuxNavigatePrevious call s:VimNavigate('p')
  finish
endif

command! TmuxNavigateLeft call s:TmuxAwareNavigate('h')
command! TmuxNavigateDown call s:TmuxAwareNavigate('j')
command! TmuxNavigateUp call s:TmuxAwareNavigate('k')
command! TmuxNavigateRight call s:TmuxAwareNavigate('l')
command! TmuxNavigatePrevious call s:TmuxAwareNavigate('p')

if !exists("g:tmux_navigator_save_on_switch")
  let g:tmux_navigator_save_on_switch = 0
endif

if !exists("g:tmux_navigator_disable_when_zoomed")
  let g:tmux_navigator_disable_when_zoomed = 0
endif

if !exists("g:tmux_navigator_preserve_zoom")
  let g:tmux_navigator_preserve_zoom = 0
endif

if !exists("g:tmux_navigator_no_wrap")
  let g:tmux_navigator_no_wrap = 0
endif

let s:pane_position_from_direction = {'h': 'left', 'j': 'bottom', 'k': 'top', 'l': 'right'}

function! s:TmuxOrTmateExecutable()
  return (match($TMUX, 'tmate') != -1 ? 'tmate' : 'tmux')
endfunction

function! s:TmuxVimPaneIsZoomed()
  return s:TmuxCommand("display-message -p '#{window_zoomed_flag}'") == 1
endfunction

function! s:TmuxSocket()
  " The socket path is the first value in the comma-separated list of $TMUX.
  return split($TMUX, ',')[0]
endfunction

function! s:TmuxCommand(args)
  let cmd = s:TmuxOrTmateExecutable() . ' -S ' . s:TmuxSocket() . ' ' . a:args
  let l:x=&shellcmdflag
  let &shellcmdflag='-c'
  let retval=system(cmd)
  let &shellcmdflag=l:x
  return retval
endfunction

function! s:TmuxNavigatorProcessList()
  echo s:TmuxCommand("run-shell 'ps -o state= -o comm= -t ''''#{pane_tty}'''''")
endfunction
command! TmuxNavigatorProcessList call s:TmuxNavigatorProcessList()

let s:tmux_is_last_pane = 0
augroup tmux_navigator
  au!
  autocmd WinEnter * let s:tmux_is_last_pane = 0
augroup END

function! s:NeedsVitalityRedraw()
  return exists('g:loaded_vitality') && v:version < 704 && !has("patch481")
endfunction

function! s:ShouldForwardNavigationBackToTmux(tmux_last_pane, at_tab_page_edge)
  if g:tmux_navigator_disable_when_zoomed && s:TmuxVimPaneIsZoomed()
    return 0
  endif
  return a:tmux_last_pane || a:at_tab_page_edge
endfunction


function! s:TmuxAwareNavigate(direction)
  let nr = winnr()
  let tmux_last_pane = (a:direction == 'p' && s:tmux_is_last_pane)
  if !tmux_last_pane
    call s:VimNavigate(a:direction)
  endif
  let at_tab_page_edge = (nr == winnr())
  " Forward the switch panes command to tmux if:
  " a) we're toggling between the last tmux pane;
  " b) we tried switching windows in vim but it didn't have effect.
  if s:ShouldForwardNavigationBackToTmux(tmux_last_pane, at_tab_page_edge)
    if g:tmux_navigator_save_on_switch == 1
      try
        update " save the active buffer. See :help update
      catch /^Vim\%((\a\+)\)\=:E32/ " catches the no file name error
      endtry
    elseif g:tmux_navigator_save_on_switch == 2
      try
        wall " save all the buffers. See :help wall
      catch /^Vim\%((\a\+)\)\=:E141/ " catches the no file name error
      endtry
    endif
    let args = 'select-pane -t ' . shellescape($TMUX_PANE) . ' -' . tr(a:direction, 'phjkl', 'lLDUR')
    if g:tmux_navigator_preserve_zoom == 1
      let l:args .= ' -Z'
    endif
    if g:tmux_navigator_no_wrap == 1 && a:direction != 'p'
      let args = 'if -F "#{pane_at_' . s:pane_position_from_direction[a:direction] . '}" "" "' . args . '"'
    endif
    silent call s:TmuxCommand(args)
    if s:NeedsVitalityRedraw()
      redraw!
    endif
    let s:tmux_is_last_pane = 1
  else
    let s:tmux_is_last_pane = 0
  endif
endfunction
