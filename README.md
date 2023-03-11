# pytorch environments
After setting up a cuda pytorch environment for the nth time, it felt like time to automate the process. 
Miniconda is the system environment manager being used as it allows for multiple versions of cuda not tied the linux environment itself.

The scripts can be used separately with `conda.sh` installing miniconda and env.sh installing pytorch and cuda files.
```
chmod +x conda.sh env.sh. 
./conda.sh -p ${path} && ./env.sh -n ${env}
```
