FROM ubuntu:14.04
MAINTAINER Bob Pace <bob.pace@gmail.com>
ENV TERM xterm-256color
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
    curl git vim tmux sudo\
    build-essential cmake python-dev ca-certificates

RUN useradd --create-home devuser && \
    chgrp -R devuser /usr/local && \
    find /usr/local -type d | xargs chmod g+w && \
    echo "devuser ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/devuser && \
    chmod 0440 /etc/sudoers.d/devuser

USER devuser
ENV HOME /home/devuser
WORKDIR /home/devuser

RUN mkdir -p ~/.vim/bundle && \
    git clone --recursive https://github.com/Valloric/YouCompleteMe ~/.vim/bundle/YouCompleteMe && \
    ~/.vim/bundle/YouCompleteMe/install.sh --clang-completer

CMD ["/bin/bash"]
