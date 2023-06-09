FROM ubuntu:22.04

ENV LANG en_US.utf8
ENV LC_ALL en_US.utf8
ENV TZ Europe/London
RUN echo "Europe/London" > /etc/timezone

# Regular libraries
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    automake \
    build-essential \
    bzip2 \
    ca-certificates \
    coreutils \
    curl \
    direnv \
    git \
    gnupg \
    gzip \
    less \
    libtool \
    llvm \
    locales \
    lsb-release \
    make \
    openssh-client \
    patch \
    pinentry-tty \
    pkg-config \
    tar \
    tzdata \
    unzip \
    wget \
    xz-utils \
    zip \
    zsh

# DEV libraries
RUN DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends \
    libbz2-dev \
    libffi-dev \
    libfreetype6-dev \
    libgdbm-dev \
    libjpeg-dev \
    liblzma-dev \
    libncurses5-dev \
    libnss3-dev \
    libopenblas-dev \
    libreadline-dev \
    libsqlite3-dev \
    libssl-dev \
    libtool \
    libxml2-dev \
    libxmlsec1-dev \
    libxslt1-dev \
    zlib1g-dev

RUN DEBIAN_FRONTEND=noninteractive apt remove python3 --yes && \
    rm -rf /usr/lib/python3

RUN apt autoclean && \
    apt autoremove --yes

# make sure to mount PWD like: -v `pwd`:/root/PWD
WORKDIR "/root/PWD"

ADD scripts /tmp/scripts
RUN chmod -R +rx /tmp/scripts

RUN /tmp/scripts/fix-locales.sh && \
    /tmp/scripts/install-neovim.sh

RUN rm -rf /var/lib/apt/lists/*

CMD ["zsh"]
