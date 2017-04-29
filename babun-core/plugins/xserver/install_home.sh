#!/bin/bash
set -e -f -o pipefail
source "/usr/local/etc/babun.instance"
# shellcheck source=/usr/local/etc/babun/source/babun-core/tools/script.sh
source "$babun_tools/script.sh"


run() {
    local src="$babun/home/xserver"

    # if XWinrc not installed
    if [ ! -d "$homedir/.XWinrc" ]; then
        # installing XWinrc
        cp -rf "$src/.XWinrc" "$homedir/.XWinrc"
        dos2unix "$homedir/.XWinrc"
    fi

    # if Xresources not installed
    if [ ! -d "$homedir/.Xresources" ]; then
        # installing Xresources
        cp -rf "$src/.Xresources" "$homedir/.Xresources"
        dos2unix "$homedir/.Xresources"
    fi

    # if startxwin not installed
    if [ ! -d "$homedir/.startxwinrc" ]; then
        # installing startxwin
        cp -rf "$src/.startxwinrc" "$homedir/.startxwinrc"
        dos2unix "$homedir/.startxwinrc"
    fi
}

run
