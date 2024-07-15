#!/bin/bash

# Set the Ctrl-C trap

trap "echo -e \"\nTerminated by user\" ; trap - SIGINT ; exit" SIGINT

# Update and upgrade packages

echo -e "\n\033[32mUpdating and upgrading packages\033[0m\n"

sudo apt update
sudo apt upgrade -y

# Install Neovim dependencies

echo -e "\n\033[32mInstalling Neovim dependencies\033[0m\n"

sudo apt install -y git
sudo apt install -y wget
sudo apt install -y unzip
sudo apt install -y xclip

sudo apt install -y bear
sudo apt install -y fuse
sudo apt install -y ripgrep

sudo apt install -y gdb make cmake  
sudo apt install -y lua5.4 luarocks
sudo apt install -y python3.11 python3.11-venv python3-pip
sudo apt install -y rustc cargo
sudo apt install -y golang
sudo apt install -y openjdk-17-jdk 
sudo apt install -y latexmk texlive-full 

# Install Neovim

echo -e "\n\033[32mInstalling Neovim\033[0m\n"

if [ -f /usr/bin/nvim ] ; then

  echo "Neovim is already installed."

else

  sudo wget -O "/opt/nvim.tar.gz" \
    "https://github.com/neovim/neovim/releases/download/v0.10.0/nvim-linux64.tar.gz"

  sudo tar -xzvf "/opt/nvim.tar.gz" --directory "/opt/"

  sudo rm -f "/opt/nvim.tar.gz"

  sudo ln -s "/opt/nvim-linux64/bin/nvim" "/usr/bin/nvim"

fi

# Copy Neovim settings to ~/.config directory

echo -e "\n\033[32mCopying Neovin settings to ./config directory...\033[0m\n"

if [ -d "${HOME}/.config/nvim/" ] ; then

  rm -rf "${HOME}/.config/nvim/"

fi

if cp -R "./nvim" "${HOME}/.config/" ; then

  echo -e "Files successfully copied!\n"

else

  echo -e "\033[0;31mNeovim settings copy failed!\033[0m\n"

fi
