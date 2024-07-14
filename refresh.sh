#!/usr/bin/bash

##Copy Neovim settings to ~/.config directory

echo -e "\n\033[32mCopying Neovin settings to ./config directory...\033[0m\n"

if [ -d "${HOME}/.config/nvim/" ] ; then

  rm -rf "${HOME}/.config/nvim/"

fi

cp -R "./nvim" "${HOME}/.config/"

if [[ $? = '0' ]] ; then
  echo -e "Files successfully copied!\n"
else
  echo -e "\033[0;31mNeovim settings copy failed!\033[0m\n"
fi
