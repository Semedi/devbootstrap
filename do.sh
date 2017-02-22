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

tempdir=$(mktemp -d)

cd $tempdir

curl -s https://codeload.github.com/jmelis/devbootstrap/tar.gz/master | tar xz

cd devbootstrap-master/files

for file in `find . -mindepth 1`; do
    replace "$file"
done

rm -rf $tempdir
