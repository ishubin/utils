#!/bin/sh
set -e

cd oculus-sample-project
touch temp.log
echo "Assembling oculus-sample-project"
mvn assembly:assembly > temp.log

GREPSTR=`grep "\\[INFO\\] BUILD SUCCESSFUL" temp.log`
if [ -n "$GREPSTR" ]; then
    echo "\033[32mSample project was assembled successfully\033[37m"
    rm temp.log
else
    echo "\033[31mThere were errors during assembling oculus-sample-project\033[37m"
    cat temp.log
    rm temp.log
    exit 1
fi

