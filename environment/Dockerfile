# hash:sha256:9a70c806dd3778d6a2eecae271621247f52a98e50adfab9b44574d4330da83b9
FROM registry.apps.codeocean.com/codeocean/miniconda3:22.11.1

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
