#!/bin/bash

GRAY='\033[1;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# if virtualenv is activated run mypy and ruff
if [[ "$VIRTUAL_ENV" != "" ]]; then
    start_time=$(date +%s%3N)
    printf "${GRAY}>>> Running MyPy Type Checker...${NC}\n"
    mypy .
    printf "${GRAY}>>> Running Ruff Code Quality Checker...${NC}\n"
    ruff check .
    # print runtime in milliseconds

    end_time=$(date +%s%3N)
    runtime=$((end_time-start_time))
    printf "${GRAY}>>>${GREEN} Checked project in ${runtime} ms${NC}\n"
else
    printf "${RED}Please activate virtualenv first by running venv.sh${NC}\n"
fi


