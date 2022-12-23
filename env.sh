#!/bin/bash
echo write desired env name into prompt:
read envName
echo creating conda env named $envName

conda create --name $envName --file spec-file.txt
