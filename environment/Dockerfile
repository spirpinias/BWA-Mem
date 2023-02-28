# hash:sha256:39f864563dcd0c4c77bd804bb789bea25c1dd60f716cdc5fd6a89a700312006a
FROM registry.apps.codeocean.com/codeocean/jupyterlab:3.4.4-miniconda4.12.0-python3.9-ubuntu20.04

ARG DEBIAN_FRONTEND=noninteractive

ARG GIT_ASKPASS
ARG GIT_ACCESS_TOKEN
COPY git-askpass /

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        samtools \
    && rm -rf /var/lib/apt/lists/*

RUN conda install -y --channel=bioconda \
        bwa \
    && conda clean -ya

COPY postInstall /
RUN /postInstall
