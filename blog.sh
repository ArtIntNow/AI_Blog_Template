#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

rm -rf public

# Build the project.
hugo # if using a theme, replace with `hugo -t <YOURTHEME>`

#copy public files to the repo path
#xcopy .\public ..\ArtIntNow.github.io  /e/h/y
cp -rf ./public/* ../ArtIntNow.github.io/

#cd repo path
cd ../ArtIntNow.github.io/

# Add changes to git.
git add -A

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master
