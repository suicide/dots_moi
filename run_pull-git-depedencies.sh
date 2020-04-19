#!/bin/bash

declare -A repos

repos=( 
	["$HOME/.config/awesome/freedesktop"]="git@github.com:lcpz/awesome-freedesktop.git"
	["$HOME/.config/awesome/lain"]="git@github.com:lcpz/lain.git"
	["$HOME/.bin/jenv"]="https://github.com/jenv/jenv.git"
	["$HOME/.bin/vim-plug"]="https://github.com/junegunn/vim-plug.git"
	)

for path in "${!repos[@]}"; do
	cd $path
	pwd
	git -C $path pull || git clone ${repos[$path]} $path; 
done

## create symlinks

mkdir -p $HOME/.local/share/nvim/site/autoload
ln -sf $HOME/.bin/vim-plug/plug.vim $HOME/.local/share/nvim/site/autoload/plug.vim

