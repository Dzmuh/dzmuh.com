# Dockerfile
FROM ubuntu:24.04
RUN apt-get update && \
    apt-get install -y hugo
ADD . /src
RUN hugo -d /src/public
