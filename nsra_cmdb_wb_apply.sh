#!/bin/bash


echo "RUN APPLY = TYPE APPLY [EXACT FORMAT] to RUN APPLY"
read input
if [[ $input == "APPLY" ]]; then
  cp Jenkinsfile_apply Jenkinsfile
  git pull
  git status
  git add -A
  git commit -m "commit"
  git push  -u origin master
fi
