FROM ubuntu:latest

RUN apt-get update && apt-get -y install wget zsh git procps
RUN git clone https://github.com/WangJ509/settings.git /usr/src/settings
WORKDIR /usr/src/settings
RUN ./setup.sh

WORKDIR /root

CMD [ "zsh" ]