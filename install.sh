#!/bin/sh
# This is the main script which installs the proper oculus environment in the workspace
set -e

if [[ -d "utils" && -d "oculus-grid" && -d "oculus-sample-project"  ]]; then
    utils/create-data-structure.sh
else
    echo "\033[31mThe directory is wrong. You should launch this script in a workspace directory"
    exit 1
fi

utils/create-grid-library.sh

echo "\033[32mOculus environment is installed properly"


