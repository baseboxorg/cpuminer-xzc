FROM		ubuntu:16.04
MAINTAINER	Baseboxorg

RUN		apt-get update -qq

RUN		apt-get install -qy automake autoconf pkg-config libcurl4-openssl-dev libssl-dev libjansson-dev libgmp-dev make g++ git

RUN		git clone https://github.com/zcoinofficial/cpuminer -b linux

RUN		cd cpuminer && ./build.sh

WORKDIR		/cpuminer
ENTRYPOINT	["./cpuminer"]
