#!/bin/bash

DATE=$(date '+%Y%m%d%H%M')

replace() {
    source="$1"
    target="$HOME/$1"

    if [ -e "$target" ]; then
        mv "$target" "${target}.${DATE}"
    fi

    cp "$source" "$target"
}

curl https://codeload.github.com/jmelis/devbootstrap/tar.gz/master | tar xz

cd devbootstrap-master

for file in `find . -mindepth 1`; do
    replace "$file"
done
