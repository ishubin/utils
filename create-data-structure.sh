#!/bin/sh
set -e

echo 'Creating data directory'    
mkdir -p data 

utils/create-sample-grid-server-storage.sh
