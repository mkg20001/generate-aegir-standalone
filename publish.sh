#!/bin/bash

TMP=$(mktemp -d)
git clone git@github.com:mkg20001/eslint-config-aegir-standalone "$TMP"
mv "$TMP/.git" "out"
rm -rf "$TMP"

VER=$(cat ./aegir/package.json | jq -r .version)

cd out
git add .
git commit -m "Update to $VER"
git tag "v$VER"
git push --tags
git push

npm publish

