#!/bin/bash
set -e

# Specify the base URL
BASE_URL=${1:-"http://localhost:1313"}

echo "Using base URL: $BASE_URL"

# Ensure clean public directory
rm -rf public
mkdir -p public

# Build main site
GIT_HASH=$(git rev-parse --short HEAD)
echo "Building site (commit: $GIT_HASH)"
hugo \
  --minify \
  --themesDir=../.. --source=site \
  --baseURL "$BASE_URL/" \
  --destination=../public

echo "Build completed"
