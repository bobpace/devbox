FROM ubuntu:latest
MAINTAINER Bob Pace <bob.pace@gmail.com>
RUN locale-gen en_US en_US.UTF-8
RUN apt-get update
RUN apt-get install -y --no-install-recommends curl git vim tmux
CMD ["/bin/bash"]
