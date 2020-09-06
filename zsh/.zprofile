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
