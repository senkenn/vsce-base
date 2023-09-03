FROM node:latest

# Change the package server to a mirroring server in Japan
# NOTE: Thils line is not working, by this error -> "sed: can't read /etc/apt/sources.list: No such file or directory"
# RUN sed -i.bak -e "s%http://archive.ubuntu.com/ubuntu/%http://ftp.iij.ad.jp/pub/linux/ubuntu/archive/%g" /etc/apt/sources.list

# install packages
RUN apt-get update -qq
RUN apt-get install -y git

# User and npm setting
ARG USER
USER $USER
ENV NPM_CONFIG_PREFIX=/home/$USER/.npm-global
ENV PATH="/home/${USER}/.npm-global:${PATH}"
RUN npm install -g npm
RUN npm install -g vsce generator-code yo

# Volta
RUN curl https://get.volta.sh | bash

ARG WORKDIR
WORKDIR $WORKDIR

# Excute entrypoint script with root user.
USER root
COPY ./entrypoint.sh /
ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "node" ]
