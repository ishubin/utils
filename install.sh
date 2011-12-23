#!/bin/sh
# This is the main script which installs the proper oculus environment in the workspace
if [[ -d "utils" && -d "oculus-grid" ]]; then
    utils/create-data-structure.sh
else
    echo "\033[31mThe directory is wrong. You should launch this script in a workspace directory"
fi
