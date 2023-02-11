#!/bin/bash

GREEN="\033[0;32m"
RED='\033[0;31m'
NC="\033[0m" 

echo -e "${GREEN}Updating and Upgrading Ubuntu...${NC}"

sudo apt-get update && sudo apt-get upgrade -y

echo -e "${GREEN}Ensuring basics installed...${NC}"

sudo apt-get install -y \
	curl \
	git \
  ripgrep \
  zip
	

echo -e "${GREEN}Installing Neovim...${NC}"

sudo apt-get install -y software-properties-common
sudo add-apt-repository -y ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install -y python3-dev python3-pip
sudo apt-get install -y neovim
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
sudo update-alternatives --config editor

echo -e "${GREEN}Installing zsh...${NC}"

sudo apt-get install -y zsh fzf
chsh -s $(which zsh)

echo -e "${GREEN}Setting up oh-my-zsh...${NC}"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo -e "${GREEN}Installing Nerdfont...${NC}"

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/Meslo.zip
mkdir -p ~/.fonts || true
unzip -o Meslo.zip -d ~/.fonts 
rm Meslo.zip

echo -e "${GREEN}Installing node and npm...${NC}"

export PROFILE="/dev/null" # Dont append nvm sources to rc
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm install 16
nvm install 18
nvm use 16

echo -e "${GREEN}Installing tree-sitter-cli...${NC}"
sudo npm install tree-sitter-cli -g




echo -e "${GREEN}Installing and setting up RCM...${NC}"

sudo apt install -y rcm
rcup




