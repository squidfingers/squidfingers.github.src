#!/bin/bash

echo -e "\033[0;32mDeploying site to GitHub...\033[0m"
hugo
cd ../squidfingers.github.io
git add .
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"
git push origin master
cd ../squidfingers.github.src
