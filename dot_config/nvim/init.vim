syntax on

" set line numbers
set number relativenumber

set noerrorbells
set expandtab
set shiftwidth=2
set tabstop=2 softtabstop=2
set autoindent
set smartindent
set scrolloff=3
set nowrap

set clipboard^=unnamed,unnamedplus

set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch

set termguicolors

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" spell checking
set spell
set spelllang=en,en_us


" setup vim-plug

call plug#begin()

" visual git plugin
Plug 'airblade/vim-gitgutter'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'mbbill/undotree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

let g:gitgutter_async=0
let mapleader = " "

" navigate windows
nnoremap <Leader>h :wincmd h<CR>
nnoremap <Leader>j :wincmd j<CR>
nnoremap <Leader>k :wincmd k<CR>
nnoremap <Leader>l :wincmd l<CR>

" Undotree
nnoremap <Leader>u :UndotreeShow<CR>

" fzf
nnoremap <C-p> :Files<CR>

