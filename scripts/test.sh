#!/bin/bash
set -e

# Install all dependencies for tests
npm i --production=false

# Setup Env Variables
export DEBUG=-*
export PUPPETEER_DISABLE_HEADLESS_WARNING=true
export NODE_OPTIONS="--loader ts-node/esm"

Xvfb :99 -screen 0 1920x1080x16 -nolisten tcp -nolisten unix &
xvfb=$!
export DISPLAY=:99

# Run the tests
./node_modules/.bin/_mocha --timeout 30000 --slow 10000 --exit $@ && kill -TERM $xvfb
