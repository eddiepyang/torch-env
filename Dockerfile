FROM amd64/ubuntu:latest

ENV CONDA="/miniconda" ENV_NAME="torch" ENV_FILE="torch-env.yaml"

SHELL ["bash", "-c"] 

COPY *.sh *.txt *.yaml /app/

WORKDIR /app

RUN apt-get update \
    && apt-get install -y wget \
    && chmod +x conda.sh \
    && chmod +x env.sh

RUN ./conda.sh -p ${CONDA}

ENV PATH ${CONDA}/bin:$PATH
RUN ./env.sh -n ${ENV_NAME} -f ${ENV_FILE}
