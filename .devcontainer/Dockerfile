FROM node:18-slim

# Change the package server to a mirroring server in Japan
RUN sed -i.bak -e "s%http://archive.ubuntu.com/ubuntu/%http://ftp.iij.ad.jp/pub/linux/ubuntu/archive/%g" /etc/apt/sources.list

# install packages
RUN apt-get update -qq &&\
    apt-get install -y git 

# User and npm setting
ARG USER
USER $USER
ENV NPM_CONFIG_PREFIX=/home/$USER/.npm-global
ENV PATH="/home/${USER}/.npm-global:${PATH}"
RUN npm install -g npm && \
    npm install -g vsce generator-code yo

# Volta
RUN curl https://get.volta.sh | bash

ARG WORKDIR
WORKDIR $WORKDIR

# Excute entrypoint script with root user.
USER root
COPY ./entrypoint.sh /
ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "node" ]
