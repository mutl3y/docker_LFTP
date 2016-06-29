FROM centos:latest
MAINTAINER mutl3y <docker@heynes.biz>
LABEL Description="This image is used to build and install lftp from source"

RUN yum group install -y "Development Tools" && yum install -y ncurses-devel readline-devel gnutls-devel
WORKDIR /data

ARG version=lftp-4.7.1.tar.gz

RUN latest=${version:-`curl --silent ftp://ftp.st.ryukoku.ac.jp/pub/network/ftp/lftp/|awk '{ print $9 }' |grep -e  '.*.gz$'|tail -1` } \
    && curl --silent -OL ftp://ftp.st.ryukoku.ac.jp/pub/network/ftp/lftp/$latest \
    && tar -zxf * && rm -f $latest && cd * \
    && ./configure >/dev/null && make >/dev/null  && make install >/dev/null

# Cleanup
RUN yum group remove -y "Development Tools" && yum remove -y ncurses-devel readline-devel  && yum clean all && rm -rf /data/*

