# sh -c "$(curl -fsSL https://raw.githubusercontent.com/SigureMo/dotfiles/main/bootstrap.sh)"

# clone this repo
git clone https://github.com/SigureMo/dotfiles ~/.dotfiles

# init oh my zsh and plugins
curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh

# Source dot files
echo '. ~/.dotfiles/zsh/.zprofile' >> ~/.zprofile
source ~/.zprofile
echo '. ~/.dotfiles/zsh/.zshrc' >> ~/.zshrc
source ~/.zshrc
echo '. ~/.dotfiles/zsh/.zimrc' > ~/.zimrc
zimfw install
