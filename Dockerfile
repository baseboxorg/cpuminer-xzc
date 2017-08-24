FROM ubuntu

#ENV URL xzc.suprnova.cc:1598
#ENV USERNAME xzc
#ENV PASSWORD x

#Install required packages
RUN apt-get update && apt-get install -y \
                git \
                automake \
                autoconf \
                pkg-config \
                libcurl4-openssl-dev \
                libjansson-dev \
                libssl-dev \
                libgmp-dev \
                && rm -rf /var/lib/apt/lists/*

WORKDIR /opt

#Clone the repo
RUN git clone https://github.com/zcoinofficial/cpuminer-xzc

WORKDIR  /opt/cpuminer-xzc

#Build the miner
RUN ./autogen.sh && ./configure CFLAGS="-march=native" --with-crypto --with-curl && make

ENTRYPOINT	["./opt/cpuminer-xzc"]

CMD ["--help"]
#CMD -a lyra2z  -o stratum+tcp://$URL  -u $USERNAME -p $PASSWORD
