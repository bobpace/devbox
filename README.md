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

Convenience scripts:

    DOCKERSOCK=/var/run/docker.sock
    DOCKERPATH=$(which docker)
    SSHAUTHSOCKDIR=$(dirname $SSH_AUTH_SOCK)

    devbox() {
        docker run -it --rm \
          -v $DOCKERSOCK:$DOCKERSOCK -v $DOCKERPATH:$DOCKERPATH \
          -v $SSHAUTHSOCKDIR:$SSHAUTHSOCKDIR -e SSH_AUTH_SOCK=$SSH_AUTH_SOCK \
          --volumes-from dotfiles $@
    }

    samba() {
      docker run --rm \
        -v $DOCKERSOCK:/docker.sock -v $DOCKERPATH:/docker \
        svendowideit/samba $@
    }

##Folder sharing directions from boot2docker

    # Make a volume container (only need to do this once)
    $ docker run -v /data --name my-data busybox true
    # Share it using Samba (Windows file sharing)
    $ docker run --rm -v /usr/local/bin/docker:/docker -v /var/run/docker.sock:/docker.sock svendowideit/samba my-data
    # then find out the IP address of your Boot2Docker host
    $ boot2docker ip
    192.168.59.103
