FROM ubuntu:20.04
LABEL maintainer "nodeselector@protonmail.com"

ENV DEBIAN_FRONTEND noninteractive

COPY . /root/.dotfiles

RUN /root/.dotfiles/script/bootstrap

CMD ["fish"]
