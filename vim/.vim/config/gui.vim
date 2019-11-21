" sdothum - 2016 (c) wtfpppl

" GUI
" ══════════════════════════════════════════════════════════════════════════════

" Behaviour ____________________________________________________________________

" ........................................................................ Setup
augroup gui | autocmd! | augroup END

let g:ruler             = 0  " colorcolumn mode, see theme.vim
let g:wrap_highlighting = 0  " wrap highlighting (0) off (1) on

" ................................................................... Toggle gui
nnoremap <silent><S-F12>      :ToggleGui<CR>
inoremap <silent><S-F12> <C-o>:ToggleGui<CR>
vnoremap <silent><S-F12> :<C-u>ToggleGui<CR>

" ................................................................... Redraw gui
if has('gui_running')  " initial refresh to fill window
  autocmd gui VimEnter * RedrawGui
endif

nnoremap <silent><F12>      :RedrawGui<CR>
inoremap <silent><F12> <C-o>:RedrawGui<CR>
vnoremap <silent><F12> :<C-u>RedrawGui<CR>

" Display ______________________________________________________________________

" .................................................................... Scrolling
set sidescroll=1  " smooth scrolling by 1 column
set sidescrolloff=1

" horizontal scrolling
noremap <C-S-Left>  zL
noremap <C-S-Right> zH

" ......................................................... Save cursor position
" only works for simple :buffer actions (not plugin pane selection)
autocmd gui BufWinLeave * let b:winview = winsaveview()
autocmd gui BufWinEnter * if exists('b:winview') | call winrestview(b:winview) | endif

" Terminal _____________________________________________________________________

" ......................................................................... Font
scriptencoding utf-8
set encoding=utf-8      " necessary to show unicode glyphs
set ambiwidth="double"  " for double width glyph handling

" ....................................................................... Cursor
set cursorline          " highlight current line
" set cursorlineopt=screenline  " waiting on v8.1 patch

set guicursor=a:block   " mode aware cursors
set guicursor+=o:hor50-Cursor
set guicursor+=n:Cursor
set guicursor+=i-ci-sm:ver25-InsertCursor
set guicursor+=r-cr:hor15-ReplaceCursor
set guicursor+=c:CommandCursor
set guicursor+=v-ve:VisualCursor
set guicursor+=a:blinkon0

" ................................... Gvim Options (make it look like terminal!)
set guioptions+=LlRrb  " hide scrollbars
set guioptions-=LlRrb
set guioptions-=m      " no menubar
set guioptions-=T      " no toolbar

" Look _________________________________________________________________________

" ............................................................... Column margins
set colorcolumn=0  " highlight column

nmap <silent><Bar> :ToggleColumn<CR>

" .......................................................... Line wrap highlight
nmap <silent><F8>      :ToggleColumnWrap<CR>
imap <silent><F8> <C-o>:ToggleColumnWrap<CR>

" ................................................................. Line numbers
set number
set numberwidth=10
set relativenumber

" toggle relative/line number
nmap <silent># :ToggleNumber<CR>

" ....................................................... Status / command lines
set laststatus=2  " always show status line
set ruler         " show cursor position in status line
set noshowcmd     " show incomplete cmds in command line
set noshowmode    " show current mode in command line

" Window actions _______________________________________________________________

" .............................................................. Window handling
" kill (close) current window
noremap <leader>q  <C-w>q
" close all other windows
noremap <leader>Q  <C-w>o

" ................................................................ Split windows
" horizontal / vertical split
noremap <leader>Z  <C-w>v<C-w>l
noremap <leader>z  <C-w>s<C-w>l
" maximize left:right / top:bottom
noremap <leader>ZZ <C-w><Bar>
noremap <leader>zz <C-w>_
" adjust all splits to the same size
noremap <leader>=  <C-w>=

nnoremap <C-Up>    :resize +5<CR>
nnoremap <C-Down>  :resize -5<CR>
nnoremap <C-Left>  :vertical resize -5<CR>
nnoremap <C-Right> :vertical resize +5<CR>

" ............................................................... Switch windows
" switch to left / right split
noremap <Left>     <C-w>h
noremap <Right>    <C-w>l
" switch to top / bottom split
noremap <Up>       <C-w>k
noremap <Down>     <C-w>j
" " switch windows
" noremap <C-w>    <C-w><C-w>

" gui.vim
