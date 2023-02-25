#!/bin/bash

ARCH=$(uname -m)

function install () {
    mkdir -p /${path}
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-${OS}-${ARCH}.sh -O /${path}/miniconda.sh
    bash /${path}/miniconda.sh -b -f -p /${path}
    rm -rf /${path}/miniconda.sh
}

if [ -z "$2" ]
then
      echo "must add path flag with -p"; exit 1;
fi

while getopts p: flag
do
    case "${flag}" in
        p) path=${OPTARG};;
        *) echo "must add path flag with -p"; exit 1;	
    esac
done

echo "using path: $path";
echo "detected architecture: $ARCH"

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        OS="Linux"
elif [[ "$OSTYPE" == "darwin"* ]]; then
        OS="MacOSX"
fi

install
