FROM devbox-base
MAINTAINER Bob Pace <bob.pace@gmail.com>

RUN git clone https://github.com/bobpace/devbox /devbox
RUN ln -s /devbox/dotfiles/.vimrc ~/.vimrc
RUN ln -s /devbox/dotfiles/.vim/rc ~/.vim/rc
RUN ln -s /devbox/dotfiles/.tmux.conf ~/.tmux.conf

RUN git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim && \
	~/.vim/bundle/neobundle.vim/bin/neoinstall

CMD ["/bin/bash"]
