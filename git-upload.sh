#!/usr/bin/env bash

printf "Where to create repository?\n"
read path

cd "$path"
git init

printf "\nWhere is the gitignore located (path to it)?\n"
read gitignorePath

cp "$gitignorePath/.gitignore" .

printf "\nWhat's the path of the remote repository (HTTPS/SSH)?\n"
read remote

git remote add origin "$remote"
git add .

printf "\nWhat should the initial commit message be?\n"
read commitMsg

git commit -m "$commitMsg"

printf "\nReady to push (y/n)?\n"
read push

if [[ $push = "Y" || $push = "y" ]]; then
  git push origin master
  echo "\nPush successful"
else
  echo "\nPush aborted"
fi
