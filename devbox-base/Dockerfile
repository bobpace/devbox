FROM ubuntu:14.04
MAINTAINER Bob Pace <bob.pace@gmail.com>
ENV TERM xterm-256color
RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y --no-install-recommends \
	curl git vim tmux \
  build-essential cmake python-dev ca-certificates

RUN mkdir -p ~/.vim/bundle && \
	git clone --recursive https://github.com/Valloric/YouCompleteMe ~/.vim/bundle/YouCompleteMe && \
	~/.vim/bundle/YouCompleteMe/install.sh --clang-completer

CMD ["/bin/bash"]
