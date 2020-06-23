#!/bin/bash


echo "WARNING!!!! YOU ARE GOING TO DESTROY EC2? IF YES THEN RUN EC2 RESOURCE DESTROY = TYPE DESTROY [EXACT FORMAT] to RUN DESTROY"
read input
if [[ $input == "DESTROY" ]]; then
  cp Jenkinsfile_ec2_destroy Jenkinsfile
  git pull
  git status
  git add -A
  git commit -m "commit"
  git push  -u origin master
fi
