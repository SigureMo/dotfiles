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

function nya() {
    action=$1
    app=$2
    case $action in
        "clean")
        echo "> clean $app"
        case $app in
            "brew")
            brew autoremove
            ;;
            "pnpm")
            pnpm store prune
            ;;
            "cargo")
            # need `cargo install cargo-cache`
            cargo cache -a
            ;;
            "conda")
            conda clean --all -y
            ;;
            "-A")
            nya clean brew
            nya clean pnpm
            nya clean cargo
            nya clean conda
            ;;
            *)
            echo "Unknown app: $app"
            ;;
        esac
        ;;
        "upgrade")
        echo "> upgrade $app"
        case $app in
            "brew")
            brew autoremove
            ;;
            "pnpm")
            pnpm store prune
            ;;
            "cargo")
            # need `cargo install cargo-update`
            cargo install-update -a
            ;;
            "rustup")
            rustup upgrade
            ;;
            "zimfw")
            zimfw update
            zimfw upgrade
            ;;
            "conda")
            conda update --all -y
            ;;
            "-A")
            nya upgrade brew
            nya upgrade pnpm
            nya upgrade cargo
            nya upgrade rustup
            nya upgrade zimfw
            ;;
            *)
            echo "Unknown app: $app"
            ;;
        esac
        ;;
        "-A")
        nya upgrade -A
        nya clean -A
        ;;
        *)
        echo "Unknown action: $action"
        ;;
    esac
}

