#!/bin/bash

while getopts p: flag
do
    case "${flag}" in
        p) path=${OPTARG};;     
    esac
done
echo "path: $path";

mkdir -p /${path}
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /${path}/miniconda.sh
bash /${path}/miniconda.sh -b -f -p /${path}
rm -rf /${path}/miniconda.sh
