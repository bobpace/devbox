# devbox

## Installation

make devbox dotfiles and data

```
make
```

Make others if wanted

```
make nodebox

make scalabox
make sbtcache

make gobox
```

Run a volume container for the dotfiles:

    docker run --name dotfiles bobpace/dotfiles

Run one of [devbox nodebox scalabox gobox] with --volumes-from dotfiles.

For convenience, you can use the scripts in devbox-scripts.sh to run containers with support to sudo docker commands and pass along any ssh keys you have added.

##Ssh keys for working with git

Get ssh-agent working with your keys

    eval `ssh-agent -s`
    ssh-add ~/.ssh/*_rsa

If you are using boot2docker or otherwise using ssh to a docker host, do it with -A to pass through ssh keys

##Folder sharing directions from boot2docker

    # Make a volume container (only need to do this once)
    $ docker run -v /data --name my-data busybox true
    # Share it using Samba (Windows file sharing)
    $ docker run --rm -v /usr/local/bin/docker:/docker -v /var/run/docker.sock:/docker.sock svendowideit/samba my-data
    # then find out the IP address of your Boot2Docker host
    $ boot2docker ip
    192.168.59.103
