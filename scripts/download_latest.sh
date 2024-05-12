#!/bin/bash

# clean the dist directory
cd fastoche/static/fastoche/
rm dist/* -rf

# Get the latest release
latest_release="$(
curl -s https://api.github.com/repos/GouvernementFR/fastoche/releases/latest \
| grep browser_download_url \
| sed -re 's/.*: "([^"]+)".*/\1/' \
)"

curl -Lo latest_release.zip $latest_release

# Unzip dist folder and clean
unzip latest_release.zip "dist/*"
rm latest_release.zip
