FROM ubuntu:16.04
MAINTAINER Alex Gandy <alexgandy@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
  && apt-get install -yq --no-install-recommends \
  libssl-dev \
  libjansson-dev \
  libcurl4-openssl-dev \
  libsqlite3-dev \
  sendemail \
  make \
  gcc \
  g++ \
  && rm -rf /var/lib/apt/lists/*

COPY . /blackbird

WORKDIR /blackbird

RUN cmake -B./build -H. -DCMAKE_BUILD_TYPE=Debug
# RUN make -B
