FROM bobpace/devbox-dotfiles
MAINTAINER Bob Pace <bob.pace@gmail.com>

# Install Go
RUN sudo mkdir -p /goroot && \
    sudo curl https://storage.googleapis.com/golang/go1.3.1.linux-amd64.tar.gz | sudo tar xvzf - -C /goroot --strip-components=1

# Set environment variables.
ENV GOROOT /goroot
ENV GOPATH /gopath
ENV PATH $GOROOT/bin:$GOPATH/bin:$PATH

# Define working directory.
WORKDIR /gopath

CMD ["/bin/bash"]
