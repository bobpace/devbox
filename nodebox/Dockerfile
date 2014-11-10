FROM bobpace/devbox
MAINTAINER Bob Pace <bob.pace@gmail.com>

USER root

RUN add-apt-repository ppa:chris-lea/node.js-devel \
    && apt-get update \
    && apt-get install -y nodejs=0.11.14-1chl1~trusty1 \
    && rm -rf /var/lib/apt/lists/*

USER devuser

#webpack-dev-server default port
EXPOSE 8080

CMD ["/bin/zsh"]
