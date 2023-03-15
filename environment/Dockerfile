# hash:sha256:bdac4e1b3267a703e8812560e130c89a80f688eb7a5c8dacba5c75a9327661dd
FROM registry.apps.codeocean.com/codeocean/mambaforge:22.9.0-3

ARG DEBIAN_FRONTEND=noninteractive

ARG GIT_ASKPASS
ARG GIT_ACCESS_TOKEN
COPY git-askpass /

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates=20210119 \
        samtools=1.11-1 \
    && rm -rf /var/lib/apt/lists/*

RUN conda install -y \
        conda==23.1.0 \
    && conda clean -ya
RUN conda install -y --channel=bioconda \
        bwa==0.7.17 \
    && conda clean -ya

COPY postInstall /
RUN /postInstall
