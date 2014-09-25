# devbox

## Installation

By default makes only devbox and dotfiles

```
make
```

Make others if wanted

```
make nodebox
make scalabox
make gobox
```

Run a volume container for the dotfiles:

    docker run --name dotfiles bobpace/dotfiles

Run one of [devbox nodebox scalabox gobox] with --volumes-from dotfiles

##Ssh keys for working with git

Get ssh-agent working with your keys

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
