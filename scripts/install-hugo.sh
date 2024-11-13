#!/bin/bash

##############################################################
# Automate installing Hugo from Github.                      #
#                                                            #
# Schedule auto-updates by adding this line to your crontab: #
#   0 0 * * * /path/to/install-hugo.sh                       #
##############################################################

## Fetch the latest release tag from GitHub API
LATEST_VERSION=$(curl -s https://api.github.com/repos/gohugoio/hugo/releases/latest | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')

## Remove the 'v' prefix from the version (e.g., 'v0.138.0' -> '0.138.0')
VERSION_NO_PREFIX=${LATEST_VERSION#v}

## Define the correct download URL (v prefix in the tag path, but not in the filename)
DOWNLOAD_URL="https://github.com/gohugoio/hugo/releases/download/${LATEST_VERSION}/hugo_${VERSION_NO_PREFIX}_Linux-64bit.tar.gz"

## Check if the URL is valid
if curl --output /dev/null --silent --head --fail "$DOWNLOAD_URL"; then
    FINAL_URL=$DOWNLOAD_URL
else
    echo "Error: No valid download URL found for version $LATEST_VERSION."
    exit 1
fi

## Download the release archive
wget $FINAL_URL -O hugo.tar.gz

## Extract the tar.gz file
tar -xzf hugo.tar.gz

## Move the Hugo binary to /usr/local/bin (or a directory in your PATH)
sudo mv hugo /usr/local/bin/

## Clean up
rm hugo.tar.gz

## Confirm installation
hugo version

## Check if git is installed
if ! command -v git &> /dev/null; then
    echo "[WARNING] git is not installed. Make sure to install it before working with Hugo."
fi

## Check if Go is installed
if ! command -v go &> /dev/null; then
    echo "[WARNING] Go is not installed. The go language is required for Hugo modules. Installation instructions: https://go.dev/doc/install"
fi
