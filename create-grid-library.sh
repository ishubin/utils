#!/bin/sh
set -e

mkdir -p data/grid-library
cd oculus-grid
mvn assembly:assembly -DskipTests=true > temp.log

GREPSTR=`grep "\\[INFO\\] BUILD SUCCESSFUL" temp.log`
if [ -n "$GREPSTR" ]; then
    rm temp.log
 else
    echo "\033[31mThere were errors during assembling oculus-grid\033[37m"
    cat temp.log
    rm temp.log
    exit 1
fi

cd ..
cp oculus-grid/target/oculus-grid-jar-with-dependencies.jar data/grid-library/oculus-grid.jar
echo "\033[32mGrid project was assembled successfully\033[37m"

