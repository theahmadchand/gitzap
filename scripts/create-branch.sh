#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

ticket_types=("feat" "chore" "docs" "fix" "refactor" "style" "test")

if ! command -v fzf >/dev/null 2>&1; then
    echo -e "${YELLOW}fzf is not installed. Do you want to install it? (y/n)${NC}"
    read -r INSTALL_FZF
    if [[ "$INSTALL_FZF" == "y" || "$INSTALL_FZF" == "Y" ]]; then
        if command -v brew >/dev/null 2>&1; then
            brew install fzf
        elif command -v apt-get >/dev/null 2>&1; then
            sudo apt-get update && sudo apt-get install -y fzf
        elif command -v yum >/dev/null 2>&1; then
            sudo yum install -y fzf
        else
            echo -e "${RED}No supported package manager found. Please install fzf manually.${NC}"
        fi
    fi
fi

if command -v fzf >/dev/null 2>&1; then
    TICKET_TYPE=$(printf '%s\n' "${ticket_types[@]}" | fzf --prompt="Select ticket type: ")
fi

if [ -z "$TICKET_TYPE" ]; then
    echo -e "${YELLOW}fzf not used or ticket type not selected. Enter ticket type manually (feat/fix/chore):${NC}"
    read TICKET_TYPE
fi

if [ -n "$TICKET_TYPE" ]; then
    echo -e "${BLUE}Enter the ticket name:${NC}"
    read TICKET_ID
    echo -e "${BLUE}Enter short description:${NC}"
    read PREFIX

    TICKET_ID=${TICKET_ID// /-}
    PREFIX=${PREFIX// /-}

    if [ -n "$PREFIX" ]; then
        NEW_BRANCH_NAME="$TICKET_TYPE/$TICKET_ID/$PREFIX"
    else
        NEW_BRANCH_NAME="$TICKET_TYPE/$TICKET_ID"
    fi

    echo -e "${CYAN}> Creating branch: ${GREEN}$NEW_BRANCH_NAME${NC}"

    PRUNE_SCRIPT_PATH="$HOME/.gitzap/prune-branches.sh"
    if [ -f "$PRUNE_SCRIPT_PATH" ]; then
        bash "$PRUNE_SCRIPT_PATH"
    else
        echo -e "${RED}Error: prune-branches.sh not found at $PRUNE_SCRIPT_PATH${NC}"
        exit 1
    fi
    
    git switch -c "$NEW_BRANCH_NAME"
else
    echo -e "${RED}Branch not created...${NC}"
    return 1
fi