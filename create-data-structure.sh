#!/bin/sh
set -e

echo 'Creating data directory'    
mkdir -p data 
mkdir -p data/logs

utils/create-sample-grid-server-storage.sh
