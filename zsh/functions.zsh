#!/usr/bin/zsh

function donothing() {
    :
}

function colored-echo() {
    CSI="\x1b["
    code=""
    msg=$1
    fore=$2
    back=$3
    # styles=${@:4}
    style=$4
    case $fore in
        "black") code="${code};30";;
        "red") code="${code};31";;
        "green") code="${code};32";;
        "yellow") code="${code};33";;
        "blue") code="${code};34";;
        "magenta") code="${code};35";;
        "cyan") code="${code};36";;
        "white") code="${code};37";;
        "bright_black") code="${code};90";;
        "bright_red") code="${code};91";;
        "bright_green") code="${code};92";;
        "bright_yellow") code="${code};93";;
        "bright_blue") code="${code};94";;
        "bright_magenta") code="${code};95";;
        "bright_cyan") code="${code};96";;
        "bright_white") code="${code};97";;
        "defaultfg") code="${code};39";;
    esac

    case $back in
        "black") code="${code};40";;
        "red") code="${code};41";;
        "green") code="${code};42";;
        "yellow") code="${code};43";;
        "blue") code="${code};44";;
        "magenta") code="${code};45";;
        "cyan") code="${code};46";;
        "white") code="${code};47";;
        "bright_black") code="${code};100";;
        "bright_red") code="${code};101";;
        "bright_green") code="${code};102";;
        "bright_yellow") code="${code};103";;
        "bright_blue") code="${code};104";;
        "bright_magenta") code="${code};105";;
        "bright_cyan") code="${code};106";;
        "bright_white") code="${code};107";;
        "defaultbg") code="${code};49";;
    esac

    case $style in
        "bold") code="${code};1";;
        "italic") code="${code};3";;
        "underline") code="${code};4";;
    esac

    # for style in ${styles[@]}
    # do
    #     echo "${style}"
    # done

    echo "${CSI}${code}m${msg}${CSI}0m"
}

function nya() {
    action=$1
    app=$2
    case $action in
        "clean")
        colored-echo "> clean $app" blue defaultbg bold
        case $app in
            "brew")
            brew autoremove
            brew cleanup --prune=7 -s
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
            "pip")
            pip cache purge
            ;;
            "-A")
            nya clean brew
            nya clean pnpm
            nya clean cargo
            nya clean pip
            nya clean conda
            ;;
            *)
            colored-echo "Unknown app: $app" red
            ;;
        esac
        ;;
        "upgrade")
        colored-echo "> upgrade $app" magenta defaultbg bold
        case $app in
            "brew")
            brew upgrade
            ;;
            "pnpm")
            pnpm -g upgrade
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
            "pip")
            pip install pip -U
            ;;
            "pipx")
            pipx upgrade-all
            ;;
            "-A")
            nya upgrade brew
            nya upgrade pnpm
            nya upgrade cargo
            nya upgrade rustup
            nya upgrade zimfw
            nya upgrade conda
            nya upgrade pip
            nya upgrade pipx
            ;;
            *)
            colored-echo "Unknown app: $app" red
            ;;
        esac
        ;;
        "-A")
        nya upgrade -A
        nya clean -A
        ;;
        *)
        colored-echo "Unknown action: $action" red
        ;;
    esac
}

