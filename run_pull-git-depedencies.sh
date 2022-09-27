#!/bin/bash

declare -A repos

repos=( 
	# ["$HOME/.config/awesome/freedesktop"]="git@github.com:lcpz/awesome-freedesktop.git"
	# ["$HOME/.config/awesome/lain"]="git@github.com:lcpz/lain.git"
	# ["$HOME/.config/nvim"]="git@github.com:suicide/nvim-conf.git"
	# ["$HOME/.config/tree-sitter-solidity"]="git@github.com:suicide/tree-sitter-solidity.git"
	# ["$HOME/.bin/jenv"]="https://github.com/jenv/jenv.git"
	# ["$HOME/.tmux/plugins/tpm"]="https://github.com/tmux-plugins/tpm"
	)

for path in "${!repos[@]}"; do
	cd $path
	pwd
	git -C $path pull || git clone ${repos[$path]} $path; 
done

## create symlinks

# mkdir -p $HOME/.config/nvim/after/queries/solidity
# ln -sf $HOME/.config/tree-sitter-solidity/queries/highlights.scm $HOME/.config/nvim/after/queries/solidity/highlights.scm

## build stuff

# (cd $HOME/.config/tree-sitter-solidity && npm test)
