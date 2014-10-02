FROM bobpace/devbox
MAINTAINER Bob Pace <bob.pace@gmail.com>

USER root

# Install Go
RUN mkdir -p /usr/local/go \
    && curl https://storage.googleapis.com/golang/go1.3.1.linux-amd64.tar.gz \
    | tar xvzf - -C /usr/local/go --strip-components=1

USER devuser

# Set environment variables.
ENV GOROOT /usr/local/go
ENV GOPATH $HOME/go
ENV PATH $GOROOT/bin:$GOPATH/bin:$PATH

#goconvey port
EXPOSE 8080

CMD ["/bin/zsh"]
