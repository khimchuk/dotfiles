#!/bin/bash

set -e

SCRIPT_DIR=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)

symlink_file() {
    file="$SCRIPT_DIR/$1"

    if [[ ! -e "$file" ]]; then
        echo "[ERROR] File <$1> doesn't exist"
        return
    fi

    target="$HOME/$2/$1"

    mkdir -p $(dirname "$target")

    if [[ -L "$target" ]]; then
        echo "[NOTE] <$1> is already symlinked"
        return 
    elif [[ -e "$target" ]]; then
        echo "[WARNING] <$1> is already exist, but not symlinked"
        return
    fi

    ln -s "$file" "$target"
    echo "[OK] $file -> $target"
}

lay_dots() {
    for line in $(cat $SCRIPT_DIR/$1); do
        if [[ "$line" =~ ^# ]]; then
            continue
        fi

        file=$(echo $line | cut -d "|" -f 1)
        path_to_file=$(echo $line | cut -d "|" -f 2)

        symlink_file $file $path_to_file
    done
}

if [[ -z "$1" ]]; then
    echo "Usage: $0 <LAYOUT>"
    echo "[ERROR] LAYOUT file wasn't provided"
    exit 1
fi

if [[ ! -e "$1" ]]; then
    echo "[ERROR] LAYOUT file <$1> doesn't exist"
    exit 1
fi

lay_dots $1
