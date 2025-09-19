#!/bin/bash

BRANCH_NAME=$1

read -p "Do you want to delete the branch '$BRANCH_NAME' locally? (y/n): " answer

if [[ "$answer" == "y" || "$answer" == "Y" ]]; then
   git branch --delete "$BRANCH_NAME"
   echo "Branch '$BRANCH_NAME' deleted locally."
else 
   echo "Branch '$BRANCH_NAME' NOT deleted."
fi
   
echo "Have a great day!"
