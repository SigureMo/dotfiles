# sh -c "$(curl -fsSL https://raw.githubusercontent.com/SigureMo/dotfiles/master/bootstrap.sh)"

# get system type
release=$(uname -r)
if echo $release | grep -qwi "darwin";then
    os_name="macosx"
elif echo $release | grep -qwi "manjaro";then
    os_name="manjaro"
elif echo $release | grep -qwi "azure";then
    os_name="azure"
else
    echo "Other OS: $release"
fi

# init oh my zsh and plugins
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
if [ $os_name == "manjaro" ]; then
    sudo pacman -S autojump
elif [ $os_name == "azure" ]; then
    sudo apt install autojump
fi

# clone this repo
git clone https://github.com/SigureMo/dotfiles ~/.dotfiles

# Source dot files
echo '. ~/.dotfiles/zsh/.zprofile' >> ~/.zprofile
source ~/.zprofile
echo '. ~/.dotfiles/zsh/.zshrc' >> ~/.zshrc
source ~/.zshrc
