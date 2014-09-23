FROM bobpace/devbox
MAINTAINER Bob Pace <bob.pace@gmail.com>

# Install Go
RUN sudo mkdir -p /usr/local/go && \
    sudo curl https://storage.googleapis.com/golang/go1.3.1.linux-amd64.tar.gz | \
    sudo tar xvzf - -C /usr/local/go --strip-components=1

# Set environment variables.
ENV GOROOT /usr/local/go
ENV GOPATH $HOME/go
ENV PATH $GOROOT/bin:$GOPATH/bin:$PATH

# Define working directory.
WORKDIR go

CMD ["/bin/zsh"]
