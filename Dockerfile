FROM openjdk:8 as chisel3_bootcamp

RUN \
  apt-get update && \
  apt-get -y install python3 python3-pip

RUN \
  pip3 install jupyter --ignore-installed

ENV SCALA_VERSION 2.11.12
ENV ALMOND_VERSION 0.1.9

RUN \
    git clone -b v0.1.9 https://github.com/almond-sh/almond.git && \
    cd almond

WORKDIR /almond

RUN \
    curl -L -o coursier https://git.io/coursier && \
    chmod +x coursier

RUN \
    ./coursier bootstrap -i user -I user:sh.almond:scala-kernel-api_$SCALA_VERSION:$ALMOND_VERSION sh.almond:scala-kernel_$SCALA_VERSION:$ALMOND_VERSION -o almond && \
    ./almond --install
