# sh -c "$(curl -fsSL https://raw.githubusercontent.com/SigureMo/dotfiles/master/bootstrap.sh)"

# init oh my zsh and plugins
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# TODO: autojump for Manjaro and ubuntu

# clone this repo
git clone https://github.com/SigureMo/dotfiles ~/.dotfiles

# Source dot files
echo '. ~/.dotfiles/zsh/.zprofile' >> ~/.zprofile
source ~/.zprofile
echo '. ~/.dotfiles/zsh/.zshrc' >> ~/.zshrc
source ~/.zshrc