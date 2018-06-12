#!/bin/bash

dotfiles=(".zshrc")
dir="${HOME}/Documents/dotfiles"

for dotfile in "${dotfiles[@]}";do
	ln -sf "${dotfile}" "${dir}"
done
