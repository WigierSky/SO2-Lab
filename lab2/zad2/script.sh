#!/bin/bash -eu

set +u
if [[ -z ${1} ]] || [[ -z ${2} ]] ; then
    echo "Nie podano argumentow!"
    exit 1
fi
set -u

DIRECTORY1=${1}
FILEBAK=${2}


if [[ ! -d ${DIRECTORY1} ]] || [[ ! -f ${FILEBAK} ]]; then 
    echo "Directiories not exising!"
    exit 1
fi

chmod -w ${FILEBAK}

chmod -x ${DIRECTORY1}
chmod o+x ${DIRECTORY1}

chmod +t *.tmp

chmod a-rwx *.txt
chmod u+r *.txt
chmod g+w *.txt
chmod o+x *.txt

chmod a+x *.exe