#!/bin/bash

# clear_cache.sh
# Script to clear unimportant cache files on a Linux system

# Define the cache directories to be cleared
CACHE_DIRS=(
    "$HOME/.cache"
    "/var/cache"
    "/tmp"
)

# Check if the script is run as root
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root"
    exit 1
fi

# Function to clear cache
clear_cache() {
    local dir=$1
    if [[ -d $dir ]]; then
        echo "Clearing cache in $dir"
        rm -rf "$dir"/*
    else
        echo "$dir does not exist"
    fi
}

# Iterate over cache directories and clear them
for dir in "${CACHE_DIRS[@]}"; do
    clear_cache "$dir"
done

echo "Cache clearing complete."
