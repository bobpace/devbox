FROM bobpace/devbox
MAINTAINER Bob Pace <bob.pace@gmail.com>

USER root

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    nodejs \
    npm \
    && ln -s /usr/bin/nodejs /usr/bin/node \
    && rm -rf /var/lib/apt/lists/*

USER devuser

#webpack-dev-server default port
EXPOSE 8080

CMD ["/bin/zsh"]
