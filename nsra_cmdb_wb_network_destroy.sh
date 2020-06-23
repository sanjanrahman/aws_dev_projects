#!/bin/bash

# PLEASE DO NOT RUN THIS  AFTER  COMPLETE FREEZE
echo "****WARNING!!!!!ARE YOU ABSOLUTELY SURE YOU WANT DESTROY NETWORK? IF YES TYPE = DESTROY [EXACT FORMAT] to RUN DESTROY EC2 RESOURCES"
read input
if [[ $input == "DESTROY" ]]; then
  cp  nsra_cmdb_wb_network_destroy Jenkinsfile
  git pull
  git status
  git add -A
  git commit -m "commit"
  git push  -u origin master
fi
