" This is Venomade's vimrc

" Install Vim Plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" PLUGins
call plug#begin('~/.vim/plugged')

" Maybe replace with fzf in future
Plug 'ctrlpvim/ctrlp.vim'

" Getting Gruuvy
Plug 'dracula/vim', { 'as': 'dracula' }

" Space then... ummm
Plug 'liuchengxu/vim-which-key'

" Ahhh a lovely #00ff00 field
Plug 'chrisbra/Colorizer'

"          \("^_^")/
Plug 'LunarWatcher/auto-pairs'

" So take me back in time!!!
Plug 'farmergreg/vim-lastplace'

" One  please! Oooh and a   too!
" Plug 'ryanoasis/vim-devicons'

call plug#end()

" Colorscheme
colorscheme dracula

" Undo History
set undofile
set undodir=~/.vim/undodir

" Common Settings
syntax on
filetype plugin indent on
set ts=2 sts=2 sw=4 et ai si
set nu rnu
set nowrap
set formatoptions-=cro
set splitbelow splitright
set encoding=UTF-8
set shell=zsh
set ignorecase
set smartcase
set incsearch

" Cursor Shapes
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

" Terminal Title
autocmd BufEnter * let &titlestring = '' . expand("%:t")
set title

" Color Highlighting
set termguicolors
let g:colorizer_auto_color = 1

" AutoPairs
let g:AutoPairsMapBS = 1

" Recentre view on slow move
nnoremap j jzz
nnoremap k kzz

" Same for mouse
set mouse=a
map <ScrollWheelDown> 2jzz
map <ScrollWheelUp> 2kzz

" Leader Key
let mapleader = " "

" WhichKey
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

" Quick split movement
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Terminal Buffer
map <leader>t :term<CR>

" Fuzzy Find
map <leader>ff :CtrlP<CR>
map <leader>fb :CtrlPBuffer<CR>
map <leader>fa :CtrlPMixed<CR>

" Copy and Paste from System Clipboard
noremap <Leader>y "*y
noremap <Leader>p "*p

" Quick Add/Remove Semicolon
map <leader>; :s/\v(.)$/\=submatch(1)==';' ? '' : submatch(1).';'<CR>

" Buffers
map <leader>bk :bd<CR>
map <leader>bn :bn<CR>
map <leader>bp :bp<CR>

" Remove Trailing Whitespaces on Save
autocmd BufWritePre * %s/\s\+$//e

" Needs to be here for whatever reason
" hi Normal guibg=NONE ctermbg=NONE
