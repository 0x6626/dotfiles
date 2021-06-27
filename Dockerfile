FROM ubuntu:18.04
LABEL maintainer "nodeselector@protonmail.com"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -qy apt-utils \
	git \
	ca-certificates \
	curl \
	apt-transport-https \
	lsb-release \
	sudo \
	locales \
	&& apt-get clean autoclean && apt-get autoremove --yes && rm -rf /var/lib/{apt,dpkg,cache,log}/

COPY . /root/.dotfiles

RUN locale-gen en_US.UTF-8
RUN /root/.dotfiles/setup.sh
RUN zsh -c "source ~/.zshrc"

CMD ["zsh"]
