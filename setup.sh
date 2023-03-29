#!/bin/bash

# Check if virtualenv is already installed
if ! which virtualenv >/dev/null; then
    echo "Installing virtualenv..."
    pip install virtualenv
fi


# Create virtualenv if it doesn't exist
if [ ! -d ".venv" ]; then
    echo "Creating virtualenv..."
    virtualenv .venv
fi

# Get project name
full_path=$(realpath "${BASH_SOURCE:-$0}")
dir_path=$(dirname "$full_path")
project_name=$(basename "$dir_path")

echo "Project name: $project_name"


# activate virtualenv based on OS (Linux or Windows)
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    source .venv/bin/activate
elif [[ "$OSTYPE" == "msys" ]]; then
    source .venv/Scripts/activate
fi

# if virtualenv is activated upgrade pip, install black, mypy, ruff and poetry then install dependencies
if [[ "$VIRTUAL_ENV" != "" ]]; then
    python -m pip install --upgrade pip
    pip install black mypy ruff poetry debugpy
    poetry lock
    poetry install
    ruff
fi

# if I dont have a virtual environment make one and install dependencies based on OS (Linux or Windows)
if [[ "$VIRTUAL_ENV" == "" ]]; then
    if [[ "$OSTYPE" == "linux-gnu" ]]; then
        python3 -m venv .venv
        source .venv/bin/activate
        python -m pip install --upgrade pip
        pip install black mypy ruff poetry debugpy
        poetry lock
        poetry install
        ruff
    elif [[ "$OSTYPE" == "msys" ]]; then
        python3 -m venv .venv
        source .venv/Scripts/activate
        python -m pip install --upgrade pip
        pip install black mypy ruff poetry debugpy
        poetry lock
        poetry install
        ruff
    fi
fi

