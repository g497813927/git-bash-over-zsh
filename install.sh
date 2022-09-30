#!/bin/zsh
# Git Bash-like shell settings for zsh
# Description: 
# This is a zsh implementation which looks like Git Bash 
# (
#    Modified from the GitHub Project:
#    fabriziocucci/git-bash-for-mac
#   (https://github.com/fabriziocucci/git-bash-for-mac)
# )
# Author: Jiacheng Zhao (John)
curl -o ~/.git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh

# Add the support file to .zshrc
echo "" >> ~/.zshrc
echo "# Git Bash-like shell settings for zsh" >> ~/.zshrc
echo "source ~/.git-prompt.sh" >> ~/.zshrc
# Add the 
echo "PS1=\"%F{green}\`whoami\`@%m%f %F{yellow}%~%f %F{cyan}\"'\$(__git_ps1 \" (%s)\")'\"%f\"\$'\x5cn'\"\$ \"" >> ~/.zshrc
echo "" >> ~/.zshrc

source ~/.zshrc
