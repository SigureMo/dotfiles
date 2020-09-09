# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"
ENABLE_CORRECTION="true"

plugins=(
    zsh-autosuggestions
    zsh-syntax-highlighting
    autojump
    sudo
)

source $ZSH/oh-my-zsh.sh

# User configuration

DOTFILES_PATH=~/.dotfiles
ZSH_SRC_PATH=$DOTFILES_PATH/zsh

. ${ZSH_SRC_PATH}/aliases.zsh

# OS Specific
release=$(uname -r)
if echo $release | grep -qwi "darwin";then
    # TODO: dosomething
elif echo $release | grep -qwi "manjaro";then
    # TODO: dosomething
elif echo $release | grep -qwi "azure";then
    # TODO: dosomething
else
    echo "Other Linux distribution: $release"
fi

