FROM amd64/ubuntu:latest

ENV conda="miniconda"
ENV env="torch"


SHELL ["/bin/bash", "-c"] 

COPY *.sh /app/
COPY *.txt /app/

WORKDIR /app

RUN apt-get update && apt-get install -y wget
RUN chmod +x conda.sh && chmod +x env.sh

RUN ./conda.sh -p ${conda}
ENV PATH /${conda}/bin:$PATH
RUN source /${conda}/etc/profile.d/conda.sh && conda init bash

RUN ./env.sh -n ${env} 
