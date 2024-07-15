#!/usr/bin/env bash

# Uninstall Neovim

echo -e "\n\033[32mUninstalling Neovim\033[0m\n"

rm -rf "${HOME}/.config/nvim/"
rm -rf "${HOME}/.local/share/nvim/"
sudo rm -rf /opt/nvim-linux64/
sudo rm -f /usr/bin/nvim

echo -e "Neovim has been removed.\n"
