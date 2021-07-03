lua << EOF
require('telescope').setup{
  defaults = {
    file_sorter = require('telescope.sorters').get_fzy_sorter,
    layout_strategy = "horizontal",
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    }
  }
}

require('telescope').load_extension('fzy_native')
EOF


nnoremap <leader>fs :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <Leader>fgg :lua require('telescope.builtin').git_files()<CR>
nnoremap <C-p> :lua require('telescope.builtin').find_files()<CR>
nnoremap <Leader>ff :lua require('telescope.builtin').find_files()<CR>

nnoremap <leader>fw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<CR>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<CR>
