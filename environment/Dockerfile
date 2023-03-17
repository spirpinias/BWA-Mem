# hash:sha256:b16ebe42e9f57a73c91b5d834c4b127073ae6c6cc5705f4e9f9f1e946bcf0025
FROM registry.apps.codeocean.com/codeocean/mambaforge3:22.11.1-4-python3.10-ubuntu22.04

ARG DEBIAN_FRONTEND=noninteractive

ARG GIT_ASKPASS
ARG GIT_ACCESS_TOKEN
COPY git-askpass /

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates=20211016ubuntu0.22.04.1 \
        samtools=1.13-4 \
    && rm -rf /var/lib/apt/lists/*

RUN conda install -y --channel=bioconda \
        bwa==0.7.17 \
    && conda clean -ya

COPY postInstall /
RUN /postInstall
