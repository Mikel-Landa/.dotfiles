#!/bin/bash

GREEN="\n\033[0;32m"
RED='\n\033[0;31m'
NC="\033[0m" 

echo -e "${GREEN}Updating and Upgrading Ubuntu...${NC}"

sudo apt-get update && sudo apt-get upgrade -y

echo -e "${GREEN}Ensuring basics installed...${NC}"

sudo apt-get install -y \
	curl \
	git \
  ripgrep \
  zip \
  autojump \
  pass \
  gpg

echo -e "${GREEN}Installing Neovim...${NC}"

sudo apt-get install -y software-properties-common
sudo add-apt-repository -y ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install -y python3-dev python3-pip
sudo apt-get install -y neovim
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --set vi /usr/bin/nvim 
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --set vim /usr/bin/nvim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
sudo update-alternatives --set editor /usr/bin/nvim
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

echo -e "${GREEN}Installing zsh...${NC}"

sudo apt-get install -y zsh fzf
sudo chsh -s $(which zsh) $USER

echo -e "${GREEN}Setting up oh-my-zsh...${NC}"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo -e "${GREEN}Installing Nerdfont...${NC}"

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/Meslo.zip
sudo unzip -o Meslo.zip -d /usr/local/share/fonts
rm Meslo.zip
sudo fc-cache -fv

echo -e "${GREEN}Installing node and npm...${NC}"

export PROFILE="/dev/null" # Dont append nvm sources to rc
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm install 16
nvm install 18
sudo apt-get install -y npm
nvm use 16

echo -e "${GREEN}Installing tree-sitter-cli...${NC}"
sudo npm install tree-sitter-cli -g




echo -e "${GREEN}Installing and setting up RCM...${NC}"

sudo apt install -y rcm
rcup

echo -e "${GREEN}Installing and setting up Git Credential Manager...${NC}"
curl -Ls https://aka.ms/gcm/linux-install-source.sh | bash -s && git-credential-manager configure
sudo rm -rf git-credential-manager


echo -e "${RED}In case microsoft repos break apt upgrade find solution: https://bugs.launchpad.net/ubuntu/+source/unixodbc/+bug/2007288${NC}"
