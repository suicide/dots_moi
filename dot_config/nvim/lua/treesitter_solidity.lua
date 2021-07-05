local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.solidity = {
  install_info = {
    -- url = "https://github.com/JoranHonig/tree-sitter-solidity", -- local path or git repo
    url = "~/.config/tree-sitter-solidity", -- local path or git repo
    files = {"src/parser.c"},
    requires_generate_from_grammar = true,
    generate_requires_npm = true,
  },
  -- filetype = "sol", -- if filetype does not agrees with parser name
}
