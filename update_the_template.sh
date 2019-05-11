#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

rm -rf public

# Build the project.
hugo # if using a theme, replace with `hugo -t <YOURTHEME>`

#copy public files to the repo path
#xcopy .\public ..\ArtIntNow.github.io  /e/h/y
cp -rf ./* ./AI_Blog_Template/

#cd repo path
cd ./AI_Blog_Template/

# Add changes to git.
git add -A

# Commit changes.
msg="updating template `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master
