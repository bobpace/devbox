FROM bobpace/devbox
MAINTAINER Bob Pace <bob.pace@gmail.com>

USER root

# Note the new setup script name for Node.js v0.12
RUN curl -sL https://deb.nodesource.com/setup_0.12 | bash - \
    && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*

USER devuser

#webpack-dev-server default port
EXPOSE 8080

CMD ["/bin/zsh"]
