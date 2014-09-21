FROM ubuntu:14.04
MAINTAINER Bob Pace <bob.pace@gmail.com>

ENV TERM xterm-256color
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
    curl git vim tmux sudo \
    build-essential cmake python-dev ca-certificates

RUN useradd --create-home devuser && \
    chgrp -R devuser /usr/local && \
    find /usr/local -type d | xargs chmod g+w && \
    echo "devuser ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/devuser && \
    chmod 0440 /etc/sudoers.d/devuser

USER devuser
ENV HOME /home/devuser
WORKDIR /home/devuser

RUN git clone --recursive https://github.com/Valloric/YouCompleteMe && \
    ~/YouCompleteMe/install.sh --clang-completer

#symlinks for dotfiles to be mounted into container via --volumes-from home
RUN mkdir -p ~/devbox/home/.vim && \
    touch ~/devbox/home/.vimrc && \
    ln -s ~/devbox/home/.vimrc ~/.vimrc && \
    touch ~/devbox/home/.tmux.conf && \
    ln -s ~/devbox/home/.tmux.conf ~/.tmux.conf && \
    ln -s ~/devbox/home/.vim ~/.vim

CMD ["/bin/bash"]
