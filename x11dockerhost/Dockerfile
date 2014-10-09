FROM bobpace/devbox
MAINTAINER Bob Pace <bob.pace@gmail.com>

RUN curl -w "\n" https://github.com/bobpace.keys >> /home/devuser/.ssh/authorized_keys
    && sudo chmod 600 /home/devuser/.ssh/authorized_keys

#fix problem with launching tmux while under a shell that has stty erase = ^H
#without fix can no longer use the control H key binding inside vim or tmux
RUN echo 'stty ek' >> /home/devuser/.profile

USER root

RUN apt-get update \
    && apt-get install -y \
    openssh-server \
    xauth \
    && mkdir /var/run/sshd \
    && rm -rf /var/lib/apt/lists/*

RUN sed -i \
  -e 's/#PasswordAuthentication yes/PasswordAuthentication no/' \
  /etc/ssh/sshd_config

EXPOSE 22

ENTRYPOINT ["/usr/sbin/sshd"]

CMD ["-D"]
