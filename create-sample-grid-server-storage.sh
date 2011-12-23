#!/bin/sh
set -e

mkdir -p data/storage-server
mkdir -p data/storage-agent-1

utils/assemble-sample-project.sh

echo 'Creating project zip archive'
mkdir data/temp-archive
cp oculus-sample-project/target/oculus-sample-project-jar-with-dependencies.jar data/temp-archive/sample-project-current.jar
cp oculus-sample-project/src/main/resources/* data/temp-archive/
cd data/temp-archive
zip -R sample-project-current.zip *
cd ../../

echo 'Creating basic sample project'
cd data/storage-server
mkdir -p sample-project/current
cd sample-project/current
cp ../../../temp-archive/sample-project-current.zip ./

touch .gridproject
echo "" > .gridproject
echo "project.name = sample-project" >> .gridproject
echo "project.version = current" >> .gridproject
echo "control.key = iamacontrolkey" >> .gridproject
echo "upload.date = 01.01.2011 12:34:56" >> .gridproject
echo "upload.user = johny" >> .gridproject

cd ../../../../

rm -rf data/temp-archive
