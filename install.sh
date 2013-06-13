#!/usr/bin/env bash

CURRENT=`pwd`
# Install zsh
sudo aptitude install zsh

# Change shell for zsh
chsh /bin/zsh

if [ -f ~/.zshrc ] ; then
    cat ~/.zshrc > ~/zshrc.backup
    rm -f ~/.zshrc
    echo "Existing .zshrc > backup in zshrc.backup"
fi

if [ -f ~/.zshrc_aliases ] ; then
    cat ~/.zshrc > ~/zshrc_aliases.backup
    rm -f ~/.zshrc_aliases
    echo "Existing .zshrc_aliases > backup in zshrc_aliases.backup"
fi

# Install oh-my-zsh
echo "Install Oh My Zsh!"
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

if [ -f ~/.zshrc ] ; then
    cat ~/.zshrc > ~/zshrc2.backup
    rm -f ~/.zshrc
    echo "Existing .zshrc > backup in zshrc2.backup (oh-my-zshv)"
fi

ln -s $CURRENT/zshrc ~/.zshrc
ln -s $CURRENT/zshrc ~/.sh_aliases

