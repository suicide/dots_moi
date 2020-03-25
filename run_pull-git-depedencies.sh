#!/bin/bash

declare -A repos

repos=( 
	["$HOME/.config/awesome/freedesktop"]="git@github.com:lcpz/awesome-freedesktop.git"
	["$HOME/.config/awesome/lain"]="git@github.com:lcpz/lain.git"
	["$HOME/.bin/jenv"]="https://github.com/jenv/jenv.git"
	)

for path in "${!repos[@]}"; do
	cd $path
	pwd
	git -C $path pull || git clone ${repos[$path]} $path; 
done
