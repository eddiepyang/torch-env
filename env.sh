#!/bin/bash
while getopts :n:f: flag
do
    case "${flag}" in
        n) ENV_NAME=${OPTARG} ;;
        f) ENV_FILE=${OPTARG} ;;   
    esac
done


conda env create -f $ENV_FILE -n $ENV_NAME
