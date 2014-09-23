# devbox

## Installation

```
make
```

Run a volume container for the dotfiles:

    docker run --name dotfiles bobpace/devbox-dotfiles

Run one of the other dev boxes with --volumes-from dotfiles

    docker run -it --rm --volumes-from dotfiles bobpace/devbox-node

Get ssh-agent working with your keys:

    eval `ssh-agent -s`
    ssh-add ~/.ssh/*_rsa

Convenience script to run devbox:

    DOCKERSOCK=/var/run/docker.sock
    DOCKERPATH=$(which docker)
    SSHAUTHSOCKDIR=$(dirname $SSH_AUTH_SOCK)

    devbox() {
        docker run -it --rm \
          -v $DOCKERSOCK:$DOCKERSOCK -v $DOCKERPATH:$DOCKERPATH \
          -v $SSHAUTHSOCKDIR:$SSHAUTHSOCKDIR -e SSH_AUTH_SOCK=$SSH_AUTH_SOCK \
          --volumes-from dotfiles $@
    }
