
FROM ubuntu

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -qq install \
    automake autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev clang git make && \
    rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/zcoinofficial/cpuminer-xzc.git /cpuminer && \
    cd /cpuminer && \
    #./build.sh
    ./autogen.sh && \
    ./configure --with-crypto --with-curl CFLAGS="-O2 -mavx2 -DROW_PREFETCH -Ofast -flto \
    -fuse-linker-plugin -ftree-loop-if-convert-stores -DUSE_ASM -pg" && \
    make

WORKDIR /cpuminer

ENTRYPOINT	["./cpuminer"]

CMD ["--help"]
