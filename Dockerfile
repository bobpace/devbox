FROM ubuntu:14.04
MAINTAINER Bob Pace <bob.pace@gmail.com>

ENV TERM xterm-256color
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
    curl git vim tmux zsh sudo \
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

#symlinks for dotfiles to be mounted into container via --volumes-from dotfiles
RUN mkdir -p ~/devbox/dotfiles/.vim && \
    ln -s ~/devbox/dotfiles/.vim ~/.vim && \
    touch ~/devbox/dotfiles/.vimrc && \
    ln -s ~/devbox/dotfiles/.vimrc ~/.vimrc && \
    touch ~/devbox/dotfiles/.tmux.conf && \
    ln -s ~/devbox/dotfiles/.tmux.conf ~/.tmux.conf && \
    mkdir -p ~/.oh-my-zsh && \
    git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh && \
    touch ~/devbox/dotfiles/.zshrc && \
    ln -s ~/devbox/dotfiles/.zshrc ~/.zshrc

CMD ["/bin/zsh"]
