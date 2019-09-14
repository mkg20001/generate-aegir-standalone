#!/bin/bash

set -e

if [ ! -e aegir ]; then
  git clone https://github.com/ipfs/aegir
else
  git -C aegir pull
fi

rm -rf out

pushd template
npx ncu -u
popd

cp -rp template out
cp ./aegir/src/config/eslintrc.js out/index.js

pushd out
sed -i "s|\"0.0.0|\"$(cat ../aegir/package.json | jq -r .version)|g" package.json
npx yarn install
npx yarn test
popd
