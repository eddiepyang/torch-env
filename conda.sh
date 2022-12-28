#!/bin/bash

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

echo "path: $path";

mkdir -p /${path}
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /${path}/miniconda.sh
bash /${path}/miniconda.sh -b -f -p /${path}
rm -rf /${path}/miniconda.sh
