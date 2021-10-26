#!/bin/bash
set -e
zsh --version
# symlink config files
if [ -f ~/.zshrc ]; then
    mv ~/.zshrc ~/.zshrc_backup
fi
ln -s ${PWD}/.zshrc ~/.zshrc

if [ -f ~/.p10k.zsh ]; then
    mv ~/.p10k.zsh ~/.p10k.zsh_backup
fi
ln -s ${PWD}/.p10k.zsh ~/.p10k.zsh

# check if oh my zsh is installed
if [ -d ~/.oh-my-zsh ]; then
    echo "oh-my-zsh is installed"
else
    echo "oh-my-zsh is not installed"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# check if powerlevel10l is installed
if [ -d ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k ]; then
    echo "powerlevel10k is installed"
else
    echo "powerlevel10k is not installed"
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

source ${HOME}/.zshrc

echo "done"
