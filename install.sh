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

# Check if git is installed
if ! type "git" > /dev/null; then
    # Prompt user to install git
    echo -e "\033[31;1m\"Git\" is not installed. Please install \"Git\" first before you run this program. \033[m"
    echo -e "\033[4mHint:\033[m"
    echo -e "1. Install \"Git\" by running the following command (if you have \033[4mHomebrew\033[m installed):"
    echo -e "   \033[47mbrew install git\033[m"
    echo -e "2. Install \"Git\" by running the following command (if you have \033[4mMacPorts\033[m installed):"
    echo -e "   \033[47msudo port install git\033[m"
    echo -e "3. Build and install \"Git\" from source code"
    echo -e "   (you can find the tourial on \033[4mhttps://github.com/git/git/blob/master/INSTALL\033[m)"
    echo -e "4. Download and install the binary from \033[4mhttps://git-scm.com/downloads\033[m"
    exit 1
fi

# Download the support script from GitHub
curl -o ~/.git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh

# Add the support file to .zshrc
echo "" >> ~/.zshrc
echo "# Git Bash-like shell settings for zsh" >> ~/.zshrc
echo "source ~/.git-prompt.sh" >> ~/.zshrc
# Add the customization to .zshrc
echo "PS1=\"%F{green}\`whoami\`@%m%f %F{yellow}%~%f %F{cyan}\"'\$(__git_ps1 \" (%s)\")'\"%f\"\$'\x5cn'\"\$ \"" >> ~/.zshrc
echo "" >> ~/.zshrc
