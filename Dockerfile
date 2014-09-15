FROM bobpace/devbox-base
MAINTAINER Bob Pace <bob.pace@gmail.com>

RUN git clone https://github.com/bobpace/devbox ~/devbox && \
    ln -s ~/devbox/dotfiles/.vimrc ~/.vimrc && \
    ln -s ~/devbox/dotfiles/.vim/rc ~/.vim/rc && \
    ln -s ~/devbox/dotfiles/.tmux.conf ~/.tmux.conf

RUN git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim && \
    ~/.vim/bundle/neobundle.vim/bin/neoinstall

CMD ["/bin/bash"]
