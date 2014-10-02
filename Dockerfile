FROM ubuntu:14.04
MAINTAINER Bob Pace <bob.pace@gmail.com>

ENV TERM xterm-256color
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    build-essential \
    ca-certificates \
    cmake \ 
    curl \
    git \
    locales \
    postgresql-client \
    python-dev \
    python-software-properties \
    silversearcher-ag \
    software-properties-common \
    ssh \
    sudo \
    unzip \
    vim \
    wget \
    zsh \
    && rm -rf /var/lib/apt/lists/*

#"en_US.UTF-8" locale
RUN localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

#tmux 1.9a
RUN add-apt-repository ppa:pi-rho/dev \
    && apt-get update \
    && apt-get install -y tmux=1.9a-1~ppa1~t \
    && rm -rf /var/lib/apt/lists/*

RUN useradd --create-home -G users devuser \
    && chgrp -R devuser /usr/local \
    && find /usr/local -type d | xargs chmod g+w

RUN git clone --recursive https://github.com/Valloric/YouCompleteMe /home/devuser/YouCompleteMe \
    && /home/devuser/YouCompleteMe/install.sh --clang-completer

RUN echo "devuser ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/devuser \
    && echo "Defaults        env_keep+=SSH_AUTH_SOCK" >> /etc/sudoers.d/devuser \
    && chmod 0440 /etc/sudoers.d/devuser

USER devuser
ENV HOME /home/devuser
WORKDIR /home/devuser

#symlinks for dotfiles to be mounted into container via --volumes-from dotfiles
RUN mkdir -p ~/devbox/dotfiles/.vim \
    && ln -s ~/devbox/dotfiles/.vim ~/.vim \
    && touch ~/devbox/dotfiles/.vimrc \
    && ln -s ~/devbox/dotfiles/.vimrc ~/.vimrc \
    && touch ~/devbox/dotfiles/.tmux.conf \
    && ln -s ~/devbox/dotfiles/.tmux.conf ~/.tmux.conf \
    && mkdir -p ~/.oh-my-zsh \
    && git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh \
    && touch ~/devbox/dotfiles/.zshrc \
    && ln -s ~/devbox/dotfiles/.zshrc ~/.zshrc \
    && touch ~/devbox/dotfiles/devbox-scripts.sh \
    && ln -s ~/devbox/dotfiles/devbox-scripts.sh ~/devbox-scripts.sh \
    && touch ~/devbox/dotfiles/.gitconfig \
    && ln -s ~/devbox/dotfiles/.gitconfig ~/.gitconfig

#if you are using boot2docker or otherwise using ssh to a docker host, do it with -A to pass through ssh keys
#check keys with ssh-add -l to see they come through to new containers
RUN mkdir ~/.ssh

#postgres from vim dbext plugin needs this
RUN touch ~/.pgpass && chmod 600 ~/.pgpass

CMD ["/bin/zsh"]
