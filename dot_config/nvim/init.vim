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

set hidden

set updatetime=200

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" spell checking
set spell
set spelllang=en,en_us


" setup vim-plug

call plug#begin()

" COC
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" visual git plugin
Plug 'airblade/vim-gitgutter'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'mbbill/undotree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'morhetz/gruvbox'
" Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()

" let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox
set background=dark

" let g:gitgutter_async=0
" let g:gitgutter_log=1
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

" move in visual mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv


" CoC
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Remap keys for gotos
nmap <silent> <Leader>gd <Plug>(coc-definition)
nmap <silent> <Leader>gy <Plug>(coc-type-definition)
nmap <silent> <Leader>gi <Plug>(coc-implementation)
nmap <silent> <Leader>gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> <Leader>K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <Leader>rn <Plug>(coc-rename)
