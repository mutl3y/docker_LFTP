FROM centos:latest
MAINTAINER mutl3y <docker@heynes.biz>
LABEL Description="This image is used to build and install lftp from source"

RUN yum group install -y "Development Tools" && yum install -y ncurses-devel readline-devel gnutls-devel git
WORKDIR /data

ARG version

RUN git clone https://github.com/lavv17/lftp.git \
    && cd * \
    && ./configure >/dev/null && make >/dev/null  && make install >/dev/null

# Cleanup
RUN yum group remove -y "Development Tools" && yum remove -y ncurses-devel readline-devel  && yum clean all && rm -rf /data/*

