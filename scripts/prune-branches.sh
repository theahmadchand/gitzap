#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

echo "Enter the rebase with branch name:"
read BRANCH_NAME

if [ -z "$BRANCH_NAME" ]; then
    BRANCH_NAME="main"
fi

echo "> Switching to $BRANCH_NAME branch..."

if git show-ref --verify --quiet refs/heads/$BRANCH_NAME; then
    git switch $BRANCH_NAME
else
    echo "Error: No $BRANCH_NAME branch found."
    exit 1
fi

echo "> Fetching with prune option..."
git fetch -p

echo "> Running pruning of local branches..."
git branch -vv | grep ': gone]' | grep -v '\*' | awk '{ print $1 }' | xargs -r git branch -d

if git rev-parse --abbrev-ref HEAD | grep -q $BRANCH_NAME; then
    echo "> Rebasing current branch from origin/$BRANCH_NAME..."
    git rebase origin/$BRANCH_NAME
else
    echo "> Error: Rebase can only be performed on $BRANCH_NAME branch."
    exit 1
fi
