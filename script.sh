#!/bin/bash

# Install zsh
sudo pacman -S zsh
sudo chsh -s $(which zsh)

# Install OhMyZsh and Plugins
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cd ~/.oh-my-zsh/custom/plugins
git clone https://github.com/zsh-users/zsh-autosuggestions.git
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git

# Set plugins in zshrc
sed -i 's/plugins=(git)/plugins=(\n    git\n    zsh-autosuggestions\n    zsh-syntax-highlighting\n)/' ~/.zshrc
source ~/.zshrc

# Download MesloLGS fonts
mkdir ~/.local/share/fonts/meslo
wget -P ~/.local/share/fonts/meslo https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf\n
wget -P ~/.local/share/fonts/meslo https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
wget -P ~/.local/share/fonts/meslo https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
wget -P ~/.local/share/fonts/meslo https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf
fc-cache -vf

# Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
sed -i 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc
source ~/.zshrc
