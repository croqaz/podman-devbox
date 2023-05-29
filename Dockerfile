FROM debian:bullseye

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    apt-transport-https \
    automake \
    build-essential \
    bzip2 \
    ca-certificates \
    coreutils \
    curl \
    fontconfig \
    git \
    gzip \
    libtool \
    locales \
    lsb-release \
    neovim \
    openssh-client \
    patch \
    pkg-config \
    software-properties-common \
    tar \
    tzdata \
    unzip \
    zip \
    wget \
    zsh && \
    rm -rf /var/lib/apt/lists/*

WORKDIR "/root"

ADD scripts /tmp/scripts
RUN chmod -R +rx /tmp/scripts

RUN /tmp/scripts/fix-locales.sh && \
    /tmp/scripts/install-fonts.sh && \
    /tmp/scripts/install-zsh.sh

RUN /tmp/scripts/install-asdf.sh
RUN /tmp/scripts/install-asdf-python.sh
RUN /tmp/scripts/install-asdf-node.sh
RUN /tmp/scripts/install-asdf-aws.sh

RUN rm -rf /tmp/scripts

CMD ["zsh"]

