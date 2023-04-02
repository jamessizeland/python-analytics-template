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

    mid_time=$(date +%s%3N)
    
    printf "${GRAY}>>> Running Ruff Code Quality Checker...${NC}\n"
    ruff check .

    end_time=$(date +%s%3N)
    mypy_time=$((mid_time-start_time))
    ruff_time=$((end_time-mid_time))
    runtime=$((end_time-start_time))
    
    printf "${GRAY}>>>${GREEN} Types checked in ${mypy_time} ms${NC}\n"
    printf "${GRAY}>>>${GREEN} Code quality checked in ${ruff_time} ms${NC}\n"
    printf "${GRAY}>>>${GREEN} Total ${runtime} ms${NC}\n"
else
    printf "${RED}Please activate virtualenv first by running venv.sh${NC}\n"
fi


