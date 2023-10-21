#!/bin/bash
CUDA='false'

while getopts :n:f:c: flag
do
    case "${flag}" in
        n) ENV_NAME=${OPTARG} ;;
        f) ENV_FILE=${OPTARG} ;;
        c) CUDA='true' ;;  
        *) echo "UNIMPLEMENTED OPTION -- ${OPTARG}" >&2 
            exit 1 ;;         
    esac
done


if [ ${CUDA} = "true" ]
    then echo "installing cuda-toolkit" 
    conda install -c nvidia cuda-toolkit -n "${ENV_NAME}"
fi

if [ -z "${ENV_NAME}" ]
    then echo "no env_name detected"
    conda env create -f "${ENV_FILE}"
    else echo "using env_name and env_file"
    conda env create -f "${ENV_FILE}" -n "${ENV_NAME}"
fi
