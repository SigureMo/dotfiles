#!/usr/bin/zsh

if uname -a | grep -qwi "darwin"; then
    os_name="macos"
elif uname -a | grep -qwi "manjaro"; then
    os_name="manjaro"
elif uname -a | grep -qwi "azure"; then
    os_name="codespace"
else
    os_name="unknown"
fi

function donothing() {
    :
}

function install_autojump() {
    case $os_name in
        "macos")
            brew install autojump
            ;;
        "manjaro")
            sudo pacman -S autojump
            ;;
        "codespace")
            sudo apt install autojump
            ;;
        "unknown")
            donothing
            ;;
    esac
}
