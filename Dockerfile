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
