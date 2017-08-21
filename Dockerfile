FROM ubuntu

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -qqy install --no-install-recommends \
    automake autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev clang git make && \
    rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/zcoinofficial/cpuminer-xzc.git /cpuminer && \
    cd /cpuminer && \
    ./build.sh

WORKDIR /cpuminer

ENTRYPOINT	["./cpuminer"]

CMD ["--help"]



FROM alpine

RUN apk add --no-cache --virtual=build-dependencies git cmake make gcc g++ libc-dev boost-dev && \
    git clone --recursive -b kost https://github.com/kost/nheqminer.git /nheqminer && \
    mkdir -p /nheqminer/nheqminer/build && \
    cd /nheqminer/nheqminer/build && \
    cmake -DSTATIC_BUILD=1 -DXENON=2 -DMARCH="-m64" .. && \
    make && \
    apk del --purge build-dependencies
 automake autoconf pkgconf
 
libcurl jansson zlib gmp
