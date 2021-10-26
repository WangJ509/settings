#!/bin/bash
set -e
zsh --version
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

# copy config files
cp ./.zshrc ${HOME}
cp ./.p10k.zsh ${HOME}

echo "done"
