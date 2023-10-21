# pytorch environments
After setting up conda and a pytorch environment for the nth time, it felt like time to automate the process. Miniconda is the system environment manager being used as it allows for multiple versions of cuda not tied the linux environment itself.

The scripts can be used separately with `conda.sh` and `env.sh` installing miniconda required pytorch files. Input your desired variables for $VARs below:
```
chmod +x conda.sh env.sh. 
./conda.sh -p $PATH && ./env.sh -f $ENV_FILE -n $ENV_NAME
```  