#!/bin/bash
while getopts n: flag
do
    case "${flag}" in
        n) name=${OPTARG};;    
    esac
done


conda create --name $name --file spec-file.txt
