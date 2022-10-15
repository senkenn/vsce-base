FROM node:17-slim AS root

# パッケージインストール
RUN apt-get update -qq \
    && apt-get install -y git zsh curl

# ZSH設定
RUN zsh
ENV SHELL /usr/bin/zsh
RUN sed -i.bak "s|$HOME:|$HOME:$SHELL|" /etc/passwd

#=======================End of layer: root  =================

FROM root AS home

# ユーザー設定
ARG USER="node"
USER $USER

# ホームディレクトリ設定
ARG HOME="/home/${USER}"
WORKDIR ${HOME}

# ZSH用の拡張機能(prezto)
RUN git clone --recursive https://github.com/sorin-ionescu/prezto.git $HOME/.zprezto
RUN ln -s $HOME/.zprezto/runcoms/zlogin    $HOME/.zlogin \
 && ln -s $HOME/.zprezto/runcoms/zlogout   $HOME/.zlogout \
 && ln -s $HOME/.zprezto/runcoms/zpreztorc $HOME/.zpreztorc \
 && ln -s $HOME/.zprezto/runcoms/zprofile  $HOME/.zprofile \
 && ln -s $HOME/.zprezto/runcoms/zshenv    $HOME/.zshenv \
 && ln -s $HOME/.zprezto/runcoms/zshrc     $HOME/.zshrc
RUN echo "zstyle ':prezto:module:prompt' theme 'powerlevel10k'" >> $HOME/.zpreztorc

# p10kの設定ファイルを適用
COPY ./.p10k.zsh ${HOME}/.p10k.zsh

#=======================End of layer: home  =================

FROM home AS workspace

# ワークスペース設定
WORKDIR /workspace

ENV NPM_CONFIG_PREFIX=/home/$USER/.npm-global
ENV PATH="/home/${USER}/.npm-global:${PATH}"

# ライブラリインストール
RUN npm install -g npm \
    && npm install -g vsce generator-code yo

#=======================End of layer: workspace  =================
