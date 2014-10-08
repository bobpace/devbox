FROM bobpace/devbox
MAINTAINER Bob Pace <bob.pace@gmail.com>

RUN curl -o /home/devuser/.ssh/authorized_keys https://github.com/bobpace.keys \
    && sudo chmod 700 /home/devuser/.ssh \
    && sudo chmod 600 /home/devuser/.ssh/authorized_keys

#fix problem with launching tmux while under a shell that has stty erase = ^H
#without fix can no longer use the control H key binding inside vim or tmux
RUN echo 'stty ek' >> /home/devuser/.profile

USER root

#set zsh as default shell
RUN chsh -s /bin/zsh devuser

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
