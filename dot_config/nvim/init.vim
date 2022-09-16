
" setup vim-plug

call plug#begin()

" coc
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" lsp stuff
Plug 'neovim/nvim-lspconfig'
"Plug 'kabouzeid/nvim-lspinstall'
Plug 'williamboman/nvim-lsp-installer'
Plug 'hrsh7th/nvim-compe'
"Plug 'hrsh7th/vim-vsnip'
Plug 'simrat39/symbols-outline.nvim'
" replace with https://github.com/stevearc/aerial.nvim ??
Plug 'glepnir/lspsaga.nvim'
" Plug 'mfussenegger/nvim-jdtls'
Plug 'scalameta/nvim-metals'

" dap
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'

" visual git plugin
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'mbbill/undotree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Plug 'sheerun/vim-polyglot'
Plug 'editorconfig/editorconfig-vim'
" Plug 'puremourning/vimspector'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'nvim-treesitter/nvim-treesitter-context'

" Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" telescope stuff
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

Plug 'kamykn/spelunker.vim'

Plug 'vim-airline/vim-airline'
" Plug 'morhetz/gruvbox'
Plug 'gruvbox-community/gruvbox'
Plug 'srcery-colors/srcery-vim'
" Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()


" scala filetype
au BufRead,BufNewFile *.sbt,*.sc set filetype=scala

" let g:gitgutter_async=0
" let g:gitgutter_log=1
let mapleader = " "

" navigate windows
nnoremap <Leader>H gT
nnoremap <Leader>L gt

" Undotree
nnoremap <Leader>u :UndotreeToggle<CR>

" fzf
" nnoremap <C-p> :Files<CR>

" treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    --disable = { "java" },  -- list of language that will be disabled
  },
}
EOF

" move in visual mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" paste without overwriting the register
xnoremap <Leader>p \"_dP

" change the direction of new splits
set splitbelow
set splitright

" vimspector
let g:vimspector_enable_mappings = 'VISUAL_STUDIO'

" freemarker
au BufRead,BufNewFile *.ftl set filetype=html

" solidity
au BufRead,BufNewFile *.sol set filetype=solidity

" markdown syntax highlighting in code
let g:markdown_fenced_languages = ['html', 'python', 'ruby', 'vim']


" lsp config
:lua require'lsp_config'
:lua require'metals_setup'

" augroup jdtls_lsp
"     autocmd!
"     autocmd FileType java lua require'jdtls_setup'.setup()
" augroup end


" treesitter
:lua require'treesitter'
" :lua require'treesitter_solidity'

" NERDtree
" nnoremap <leader>n :NERDTreeFocus<CR>
" nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

let NERDTreeShowHidden=1
let g:NERDTreeWinSize=48
" enable line numbers
let NERDTreeShowLineNumbers=1
" make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber

" reselect pasted text
nnoremap gp `[v`]

set completeopt=menuone,noselect
