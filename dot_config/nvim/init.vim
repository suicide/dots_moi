
" setup vim-plug

call plug#begin()

" coc
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" lsp stuff
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'hrsh7th/nvim-compe'
"Plug 'hrsh7th/vim-vsnip'
Plug 'simrat39/symbols-outline.nvim'
Plug 'glepnir/lspsaga.nvim'
Plug 'mfussenegger/nvim-jdtls'
Plug 'scalameta/nvim-metals', {'branch': 'next'}

" visual git plugin
Plug 'airblade/vim-gitgutter'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'mbbill/undotree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Plug 'sheerun/vim-polyglot'
Plug 'editorconfig/editorconfig-vim'
Plug 'puremourning/vimspector'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

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
nnoremap <Leader>u :UndotreeShow<CR>

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



" vimspector
let g:vimspector_enable_mappings = 'VISUAL_STUDIO'

" freemarker
au BufRead,BufNewFile *.ftl set filetype=html

" markdown syntax highlighting in code
let g:markdown_fenced_languages = ['html', 'python', 'ruby', 'vim']


" lsp config
:lua require'lsp_config'
:lua require'metals_setup'

augroup jdtls_lsp
    autocmd!
    autocmd FileType java lua require'jdtls_setup'.setup()
augroup end
