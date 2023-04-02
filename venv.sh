#!/bin/bash

GRAY='\033[1;30m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Check if virtualenv is already installed
if ! which virtualenv >/dev/null; then
    printf "${GRAY}>>> Installing virtualenv...${NC}\n"
    pip install virtualenv
fi


# Create virtualenv if it doesn't exist
if [ ! -d ".venv" ]; then
    printf "${GRAY}>>> Creating virtualenv...${NC}\n"
    virtualenv .venv
fi

# Get project name
full_path=$(realpath "${BASH_SOURCE:-$0}")
dir_path=$(dirname "$full_path")
project_name=$(basename "$dir_path")

printf ">>> Project name: ${GRAY}$project_name${NC}\n"


# activate virtualenv based on OS (Linux or Windows)
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    source .venv/bin/activate
elif [[ "$OSTYPE" == "msys" ]]; then
    source .venv/Scripts/activate
fi

# if virtualenv is activated upgrade pip, install poetry then install dependencies
if [[ "$VIRTUAL_ENV" != "" ]]; then
    python -m pip install --upgrade pip
    printf "${GRAY}>>> Checking Poetry Package Manager...${NC}\n"
    pip install poetry debugpy
    printf "${GRAY}>>> Checking project dependencies...${NC}\n"
    poetry install
    poetry update
    source lint.sh
fi

