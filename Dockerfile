FROM amd64/ubuntu:latest

ENV CONDA="miniconda" ENV_FILE="torch-env.yaml"
ENV ENV_NAME="test"

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

RUN conda run -n ${ENV_NAME} python -c "import torch; x = torch.rand(5, 3); print(x)"

ENTRYPOINT ["/bin/bash", "--login"]
