#!/bin/bash

##Set the Ctrl-C trap

trap "echo -e \"\nTerminated by user\" ; trap - SIGINT ; exit" SIGINT

##Update and upgrade packages

echo -e "\n\033[32mUpdating and upgrading packages\033[0m\n"

sudo apt update
sudo apt upgrade -y

##Install Neovim dependencies

echo -e "\n\033[32mInstalling Neovim dependencies\033[0m\n"

sudo apt install -y snap git curl unzip luarocks npm cargo golang gdb

readarray -t lua_versions < \
  <(apt list lua* | grep -oP "lua[\d\.]+(?=/)" | sort -r)

readarray -t python_versions < \
  <(apt list python* | grep -oP "python[\d\.]+(?=/)" | sort -r)

readarray -t python_venv_versions < \
  <(apt list python*-venv | grep -oP "python[\d\.]+-venv(?=/)" | sort -r)

sudo apt install -y "${lua_versions[0]}"
sudo apt install -y "${python_versions[0]}"
sudo apt install -y "${python_venv_versions[0]}"

##Refresh Snap

echo -e "\n\033[32mRefreshing Snap\033[0m\n"

sudo snap refresh

##Install Neovim

echo -e "\n\033[32mInstalling Neovim\033[0m\n"

sudo snap install nvim --classic

##Create an alias for Neovim

echo -e "\n\033[32mCreating an alias for Neovim\033[0m\n"

nvim_path=$(which nvim)

echo "alias nvim=\"${nvim_path}\"" > .bashrc

localFileContent=$(cat ./.bashrc)
homeFileContent=$(cat ~/.bashrc)

if ! [[ ${homeFileContent} = *${localFileContent}* ]] ; then
	cat ./.bashrc >> ~/.bashrc
fi

cat ./.bashrc

##Create an symbolic link for Neovim 

echo -e "\n\033[32mCreating a symbolic link for Neovim\033[0m\n"

sudo ln -s "${nvim_path}" "/usr/bin/nvim"

##Install a Nerd Font

echo -e "\n\033[32mInstalling a nerd font\033[0m\n"

echo -e "Scanning /ryanoasis/nerd-fonts repo..."

readarray -t endpoints 	< \
 	<(curl -s 'https://github.com/ryanoasis/nerd-fonts/releases' |\
  grep -oP '\"/ryanoasis/nerd-fonts/releases/tag/[\w\d\/\.]+\"')

latest_version="$(echo "${endpoints[0]}" | grep -oP '(?<=tag/)v[\d\.]+')"

if [[ -z ${endpoints} ]] ; then
  echo -e "\033[0;31mLatest version not found.\033[0m"
  exit 
else
  echo -e "Latest version found: ${latest_version}"
fi

echo -e "Getting nerd fonts download links..."

readarray -t download_links < \
	<(curl -s "https://github.com/ryanoasis/nerd-fonts/releases/expanded_assets/${latest_version}" |\
  grep -oP "\"/ryanoasis/nerd-fonts/releases/download/${latest_version}/[\\w\\d\\.]+\"")

if [[ -z ${download_links} ]] ; then
  echo -e "\033[0;31mLinks not found.\033[0m"
  exit
else
  echo "Fonts found:"
fi

declare -A fonts
for link in "${download_links[@]}" ; do
	font_name=$(echo "${link}" | grep -oP '(?<=/)[\w\d]+(?=\.[\w\d\.]+")')
	fonts["${font_name}"]="$(echo ${link} | tr -d '"')"
done

keys="${!fonts[@]}"
sorted_keys=$(echo -e "${keys// /\\n}" | sort)

PS3="Insert font number: "
select font in ${sorted_keys} ; do
	
	if [[ -z "${fonts[${font}]}" ]] ; then
		echo -e "\033[0;31mInvalid input!\033[0m"
	else	
	  selected_font="https://github.com${fonts[${font}]}"
    break
	fi

done

downloads_dirpath="/tmp/nvim-nerdfonts/"
compacted_filename="$(echo "${selected_font}" | grep -oP '(?<=/)[\w\d\.]+(?=$)')"
compacted_filepath="${downloads_dirpath}${compacted_filename}"

echo -e "Downloading ${selected_font}..."

mkdir "${downloads_dirpath}"
wget_error="$(wget -O "${compacted_filepath}" "${selected_font}" 2>&1 | grep -oP 'ERROR[\s\S]+')"
wait $!

if [[ ${wget_error} ]] ; then
  echo -e "\033[0;31mDownload failed! ${wget_error}\033[0m"
  exit
fi

compacted_file_extention="$(echo "${selected_font}" | grep -oP '(?<=\.)[\w\d\.]+(?=$)')"
fonts_dirpath="${HOME}/.local/share/fonts/$(echo "${compacted_filename}" | grep -oP '[\w\d]+(?=\.)')"

mkdir "${HOME}/.local/share/fonts/"

if [[ ${compacted_file_extention} = 'tar' ]] ; then
	tar -xf "${compacted_filepath}" -C "${fonts_dirpath}"
elif [[ ${compacted_file_extention} = 'tar.'* ]] ; then
	tar -xf "${compacted_filepath}" -C "${fonts_dirpath}"
elif [[ ${compacted_file_extention} = 'zip' ]] ; then
	unzip "${compacted_filepath}" -d "${fonts_dirpath}"
fi

##Copy Neovim settings to ~/.config directory

echo -e "\n\033[32mCopying Neovin settings to ./config directory...\033[0m\n"

rm -r "${HOME}/.config/nvim/"
cp -R "./nvim" "${HOME}/.config/"

if [[ $? = '0' ]] ; then
  echo -e "Files successfully copied!"
else
  echo -e "\033[0;31mNeovim settings copy failed!\033[0m"
fi
