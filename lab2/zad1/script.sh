#!/bin/bash -eu

set +u
if [[ -z ${1} ]] || [[ -z ${2} ]] ; then
    echo "Nie podano argumentow!"
    exit 1
fi

set -u
DIRECTORY1=${1}
DIRECTORY2=${2}

if [[ ! -d ${DIRECTORY1} ]] || [[ ! -d ${DIRECTORY2} ]]; then 
    echo "Directiories not exising!"
    exit 1
fi

# ls ./${DIRECTORY_1}/

ITEMS=$(ls ./${DIRECTORY1}/)

for ITEM in ${ITEMS} ; do
    if [[ -d ./${DIRECTORY1}/${ITEM} ]] ; then
        echo "${ITEM} is a directory"
        if [[ -L ./{$DIRECTORY2}/${ITEM^^}_ln ]]; then
            ln -s ./${DIRECTORY1}/${ITEM} ./${DIRECTORY2}/${ITEM^^}_ln
        fi
    elif [[ -L ./${DIRECTORY1}/${ITEM} ]] ; then
        echo "${ITEM} is a symlink"
    elif [[ -f ./${DIRECTORY1}/${ITEM} ]] ; then
        echo "${ITEM} is a regular file"
        if [[ -L ./{$DIRECTORY2}/${ITEM^^}_ln ]]; then
            ln -s ./${DIRECTORY1}/${ITEM} ./${DIRECTORY2}/${ITEM^^}_ln
        fi
    fi
done