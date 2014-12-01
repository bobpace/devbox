#!/bin/sh

#Docker
DOCKERSOCK=/var/run/docker.sock
DOCKERPATH=$(which docker)
SSHAUTHSOCKDIR=$(dirname $SSH_AUTH_SOCK)

devbox() {
  docker run -it --rm \
    -v $DOCKERSOCK:$DOCKERSOCK -v $DOCKERPATH:$DOCKERPATH \
    -v $SSHAUTHSOCKDIR:$SSHAUTHSOCKDIR -e SSH_AUTH_SOCK=$SSH_AUTH_SOCK \
    -e DISPLAY=$DISPLAY \
    --volumes-from home \
    --volumes-from dotfiles \
    --volumes-from data \
    --link x11dockerhost:x11dockerhost \
    -P $@
}

#mount /tmp so that ssh agent sockets created directly on x11dockerhost 
#will actually exist at /tmp where the docker service is running 
#so that the -v $SSHAUTHSOCKDIR mounting to forward the agent to containers can work
x11dockerhost() {
  docker run -d \
    -v $DOCKERSOCK:$DOCKERSOCK -v $DOCKERPATH:$DOCKERPATH \
    -v /tmp:/tmp \
    --volumes-from home \
    --volumes-from dotfiles \
    --volumes-from data \
    -p 2222:22 \
    -h x11dockerhost \
    --name x11dockerhost \
    $@ bobpace/x11dockerhost
}

killx11() {
  docker stop x11dockerhost && docker rm x11dockerhost
}

nodebox() {
  devbox \
    -h nodebox \
    --name nodebox \
    $@ bobpace/nodebox
}

scalabox() {
  devbox \
    --volumes-from sbtcache \
    -h scalabox \
    --name scalabox \
    $@ bobpace/scalabox
}

gobox() {
  devbox \
    --volumes-from gopath \
    -w /home/devuser/go \
    -h gobox \
    --name gobox \
    $@ bobpace/gobox
}

samba() {
  docker run --rm \
    -v $DOCKERSOCK:/docker.sock -v $DOCKERPATH:/docker \
    svendowideit/samba $@
}

rmiuntagged() {
  docker rmi $(docker images -q --filter "dangling=true")
}

rmlast() {
  docker rm $(docker ps -lq)
}

#Typesafe activator
runactivator() {
  activator ui -Dhttp.address=0.0.0.0
}

#X11
testxclip() {
  echo Xclip works! | xclip && xclip -o | xargs echo
}

#fixes time drift on boot2docker vm
fixtime() {
  sudo ntpclient -s -h pool.ntp.org
}
