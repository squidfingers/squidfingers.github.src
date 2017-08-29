#!/bin/bash

echo "Removing existing files"
cd ../squidfingers.github.io
find . -path ./.git -prune -o -exec rm -rf {} \; 2> /dev/null

echo "Generating site"
cd ../squidfingers.github.src
hugo

echo "Adding files to Git"
cd ../squidfingers.github.io
git add .
git commit -m "rebuilding site `date`"

echo "Deploying"
git push origin master

cd ../squidfingers.github.src
echo "Done."
