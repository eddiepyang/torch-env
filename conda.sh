#!/bin/bash

ARCH=$(uname -m)

function install () {
    mkdir -p "${CONDA_PATH}"
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-"${OS}"-"${ARCH}".sh -O "${CONDA_PATH}"/miniconda.sh
    bash "${CONDA_PATH}"/miniconda.sh -b -f -p "${CONDA_PATH}"
    rm -rf "${CONDA_PATH}"/miniconda.sh
}

if [ -z "$2" ]
then
      echo "must add CONDA_PATH flag with -p"; exit 1;
fi

while getopts p: flag
do
    case "${flag}" in
        p) CONDA_PATH=${OPTARG};;
        *) echo "must add CONDA_PATH flag with -p"; exit 1;	
    esac
done

echo "using CONDA_PATH: $CONDA_PATH";
echo "detected architecture: $ARCH";

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        OS="Linux"
        SHELL="${CONDA_PATH}/bin/conda init bash"
elif [[ "$OSTYPE" == "darwin"* ]]; then
        OS="MacOSX"
        SHELL="${CONDA_PATH}/bin/conda init zsh"
fi

install

eval "${SHELL}"