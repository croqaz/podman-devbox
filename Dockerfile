FROM ubuntu:22.04

ENV LANG en_US.utf8
ENV LC_ALL en_US.utf8
ENV TZ Europe/London
ENV DEBIAN_FRONTEND noninteractive

RUN echo "Europe/London" > /etc/timezone
RUN apt-get update && apt-get install -y --no-install-recommends \
    automake \
    build-essential \
    bzip2 \
    ca-certificates \
    coreutils \
    curl \
    git \
    gnupg \
    gzip \
    less \
    libtool \
    llvm \
    locales \
    lsb-release \
    openssh-client \
    patch \
    pkg-config \
    tar \
    tzdata \
    unzip \
    zip \
    wget \
    zsh

WORKDIR "/root"

ADD scripts /tmp/scripts
RUN chmod -R +rx /tmp/scripts

RUN /tmp/scripts/fix-locales.sh && \
    /tmp/scripts/install-zsh.sh && \
    /tmp/scripts/install-neovim.sh

RUN /tmp/scripts/install-asdf.sh

RUN /tmp/scripts/install-asdf-python.sh && \
    /tmp/scripts/install-asdf-node.sh
RUN /tmp/scripts/install-asdf-aws.sh && \
    /tmp/scripts/install-asdf-gcloud.sh

# cleanup ?
# RUN rm -rf /tmp/scripts
# RUN rm -rf /var/lib/apt/lists/*

CMD ["zsh"]
