# hash:sha256:213dcce1ecfac0e70046c31654736829e6234db286c74d4f89b7dd44ee0f73bb
FROM registry.apps.codeocean.com/codeocean/miniconda3:22.11.1

ARG DEBIAN_FRONTEND=noninteractive

ARG GIT_ASKPASS
ARG GIT_ACCESS_TOKEN
COPY git-askpass /

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates=20210119 \
        git=1:2.30.2-1+deb11u2 \
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
