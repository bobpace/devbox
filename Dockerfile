FROM ubuntu:latest
MAINTAINER Bob Pace <bob.pace@gmail.com>
ENV TERM xterm-256color
RUN apt-get update
RUN apt-get install -y --no-install-recommends curl git vim tmux
RUN apt-get install -y --no-install-recommends build-essential cmake python-dev
RUN apt-get install -y --no-install-recommends ca-certificates
RUN git clone https://github.com/bobpace/devbox ~/devbox
RUN mkdir -p ~/.vim/bundle
RUN ln -s /devbox/dotfiles/.vimrc ~/.vimrc
RUN ln -s /devbox/dotfiles/.vim/rc ~/.vim/rc
RUN git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
RUN ~/.vim/bundle/neobundle.vim/bin/neoinstall
RUN ln -s /devbox/dotfiles/.tmux.conf ~/.tmux.conf
CMD ["/bin/bash"]
