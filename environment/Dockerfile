# hash:sha256:60fdbe165d5311768d6d02faa116c178746d6a5e6382f192ce7106eb4cb8b7ce
FROM registry.apps.codeocean.com/codeocean/jupyterlab:3.4.4-miniconda4.12.0-python3.9-ubuntu20.04

ARG DEBIAN_FRONTEND=noninteractive

ARG GIT_ASKPASS
ARG GIT_ACCESS_TOKEN
COPY git-askpass /

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        samtools=1.10-3 \
    && rm -rf /var/lib/apt/lists/*

RUN conda install -y --channel=bioconda \
        bwa==0.7.15 \
    && conda clean -ya

COPY postInstall /
RUN /postInstall
