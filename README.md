# devbox

## Installation

```
make
```

Run a volume container for home, dotfiles, and data:

    docker run --name home bobpace/home
    docker run --name dotfiles bobpace/dotfiles
    docker run --name data bobpace/data

Use the shell scripts in devbox-scripts.sh, they will handle passing along the docker socket, ssh agent, and X11 forwarding.

##Ssh keys for working with git

Get ssh-agent working with your keys

    eval `ssh-agent -s`
    ssh-add ~/.ssh/*_rsa

If you are using boot2docker or otherwise using ssh to a docker host, do it with -A to pass through ssh keys and -X for clipboard support through X11.

##Folder sharing directions from boot2docker

    # Make a volume container (only need to do this once)
    $ docker run -v /data --name my-data busybox true
    # Share it using Samba (Windows file sharing)
    $ docker run --rm -v /usr/local/bin/docker:/docker -v /var/run/docker.sock:/docker.sock svendowideit/samba my-data
    # then find out the IP address of your Boot2Docker host
    $ boot2docker ip
    192.168.59.103

##Postgres and dbext.vim plugin usage

Start a postgres instance:

    docker run --name some-postgres -d postgres

Run a box with --link some-postgres:postgres

There is a profile set up for dbext.vim that has the postgres connection information for use with a linked postgres container
