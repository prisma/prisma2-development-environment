#!/bin/bash

set -ex

if [ "$DEVELOPMENT_ENVIRONMENT_COMMIT" ]; then
  git checkout $DEVELOPMENT_ENVIRONMENT_COMMIT
fi

npm i -g pnpm@next
npm i -g yarn || echo "Ok"
yarn --version || echo "Ok"
pnpm i

pnpm run setup

pnpm run test


echo "//registry.npmjs.org/:_authToken=${NPM_TOKEN}" > ~/.npmrc


pnpm run publish-all