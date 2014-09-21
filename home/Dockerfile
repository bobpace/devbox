FROM bobpace/devbox-base
MAINTAINER Bob Pace <bob.pace@gmail.com>

RUN rm -rf ~/devbox && \
    git clone https://github.com/bobpace/devbox && \
    git clone https://github.com/Shougo/neobundle.vim ~/devbox/home/.vim/bundle/neobundle.vim && \
    ln -s ~/YouCompleteMe ~/devbox/home/.vim/bundle/YouCompleteMe && \
    ~/.vim/bundle/neobundle.vim/bin/neoinstall

VOLUME /home/devuser/devbox

CMD ["true"]
