FROM bobpace/devbox
MAINTAINER Bob Pace <bob.pace@gmail.com>

RUN rm -rf ~/devbox \
    && git clone https://github.com/bobpace/devbox \
    && git clone https://github.com/Shougo/neobundle.vim ~/devbox/dotfiles/.vim/bundle/neobundle.vim \
    && ln -s /usr/local/lib/YouCompleteMe ~/devbox/dotfiles/.vim/bundle/YouCompleteMe \
    && ~/.vim/bundle/neobundle.vim/bin/neoinstall

VOLUME /home/devuser/devbox

CMD ["true"]
