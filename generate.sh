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
npx yarn install
npx yarn test
popd
