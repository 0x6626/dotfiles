FROM ubuntu:18.04
FROM --platform=arm64 ubuntu:18.04
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
	gnupg \
	apt-get clean autoclean && apt-get autoremove --yes && rm -rf /var/lib/{apt,dpkg,cache,log}/

RUN curl -sL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | tee /etc/apt/trusted.gpg.d/microsoft.gpg >/dev/null
RUN echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $(lsb_release -cs)  main" | sudo tee /etc/apt/sources.list.d/azure-cli.list

RUN apt-get update && apt-get install -qy azure-cli \
	apt-get clean autoclean && apt-get autoremove --yes && rm -rf /var/lib/{apt,dpkg,cache,log}/

COPY . /root/.dotfiles

RUN locale-gen en_US.UTF-8
RUN /root/.dotfiles/setup.sh
RUN zsh -c "source ~/.zshrc"

CMD ["zsh"]
