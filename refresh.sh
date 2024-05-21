#!/usr/bin/bash

##Copy Neovim settings to ~/.config directory

echo -e "\n\033[32mCopying Neovin settings to ./config directory...\033[0m\n"

rm -r "${HOME}/.config/nvim/"
cp -R "./nvim" "${HOME}/.config/"

if [[ $? = '0' ]] ; then
  echo -e "Files successfully copied!"
else
  echo -e "\033[0;31mNeovim settings copy failed!\033[0m"
fi
