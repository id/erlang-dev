FROM debian:wheezy

MAINTAINER Ivan Dyachkov <ivan@dyachkov.org>

ENV OTP_VERSION 17.5.3
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qq \
    && apt-get install -y \
       build-essential \
       git \
       wget \
       ca-certificates \
       man

RUN wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && \
    dpkg -i erlang-solutions_1.0_all.deb && \
    rm erlang-solutions_1.0_all.deb

RUN apt-get update -qq && apt-get install -y erlang=1:${OTP_VERSION} erlang-base-hipe

