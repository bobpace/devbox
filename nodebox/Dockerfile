FROM bobpace/devbox
MAINTAINER Bob Pace <bob.pace@gmail.com>

RUN sudo apt-get install -y --no-install-recommends nodejs npm && \
    sudo ln -s /usr/bin/nodejs /usr/bin/node

#webpack-dev-server default port
EXPOSE 8080

CMD ["/bin/zsh"]
