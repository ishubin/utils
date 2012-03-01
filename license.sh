#!/bin/bash

function removeLicenseHeader {
    if [[ -n "$1" ]]; then
        touch temp_file

        isCodeStarted=0
        while IFS= read -r line; do
            #printf '%s\n' "$line"
            if [[ $isCodeStarted == 0 ]]; then
                if [[ -n $line ]]; then
                    # checking if line is part of a comment or not
                    if !( printf '%s' "$line" | grep -Eq "^(\*| *\*|\/\*).*" ) then
                        isCodeStarted=1
                    fi
                fi 
            fi

            if [[ $isCodeStarted == 1 ]]; then
                printf '%s\n' "$line" >> temp_file
            fi
        done < $1
    fi
}

function addLicenseToFile {
    if [[ -n "$1" ]]; then
        removeLicenseHeader $1
        echo "Adding license to $1"
        cat temp_license > $1
        cat temp_file >> $1
        rm temp_file
    fi
}



FILE_TYPE=java

while getopts "t:" OPT
do
    case $OPT in
        t)
            FILE_TYPE=$OPTARG
    esac
done

if [ ! -f .ltpl ]; then
    echo -e "\033[31mYou are missing license template file .ltpl"
    exit 1
fi

touch temp_license
year=`date +%Y`
sed "s/< YEAR >/$year/g" .ltpl > temp_license

#iterating through all files matching specified file type and applying license headers to them 
for file in $(find ./ -name "*.$FILE_TYPE") ; do
    addLicenseToFile $file
done

rm temp_license
