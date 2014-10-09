#!/bin/sh

DOCKERSOCK=/var/run/docker.sock
DOCKERPATH=$(which docker)
SSHAUTHSOCKDIR=$(dirname $SSH_AUTH_SOCK)

devbox() {
  docker run -it --rm \
    -v $DOCKERSOCK:$DOCKERSOCK -v $DOCKERPATH:$DOCKERPATH \
    -v $SSHAUTHSOCKDIR:$SSHAUTHSOCKDIR -e SSH_AUTH_SOCK=$SSH_AUTH_SOCK \
    -e DISPLAY=$DISPLAY \
    --volumes-from dotfiles --volumes-from data -P $@
}

x11dockerhost() {
  docker run -d \
    -v $DOCKERSOCK:$DOCKERSOCK -v $DOCKERPATH:$DOCKERPATH \
    #mount /tmp so that ssh agent sockets created directly on x11dockerhost 
    #will actually exist at /tmp where the docker service is running 
    #so that the -v $SSHAUTHSOCKDIR mounting to forward the agent to containers can work
    -v /tmp:/tmp \
    --volumes-from dotfiles --volumes-from data -p 2222:22 \
    --name x11dockerhost $@ bobpace/x11dockerhost
}

nodebox() {
  devbox --name nodebox $@ bobpace/nodebox
}

scalabox() {
  devbox --volumes-from sbtcache --name scalabox $@ bobpace/scalabox
}

gobox() {
  devbox --volumes-from gopath --name gobox -w /home/devuser/go $@ bobpace/gobox
}

samba() {
  docker run --rm \
    -v $DOCKERSOCK:/docker.sock -v $DOCKERPATH:/docker \
    svendowideit/samba $@
}

runactivator() {
  if [ -f ~/bin/activator ];
  then
    activator ui -Dhttp.address=0.0.0.0
  fi
}

rmiuntagged() {
  docker rmi $(docker images -q --filter "dangling=true")
}

rmlast() {
  docker rm $(docker ps -lq)
}
