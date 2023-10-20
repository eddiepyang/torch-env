#!/bin/bash
while getopts :n:f: flag
do
    case "${flag}" in
        n) ENV_NAME=${OPTARG} ;;
        f) ENV_FILE=${OPTARG} ;;   
    esac
done

if [ -z ${x} ]
    then conda env create -f $ENV_FILE -n $ENV_NAME
    else conda env create -f $ENV_FILE
fi
