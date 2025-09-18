#!/bin/bash
# Build script for evil1.org
# This script handles the moved configuration files

echo "Building evil1.org site..."

# Set the path to the Gemfile
export BUNDLE_GEMFILE="$(pwd)/configs/Gemfile"

# Build the site
bundle exec jekyll build

echo "Build complete!"
