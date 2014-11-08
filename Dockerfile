FROM ubuntu:14.04
MAINTAINER Bob Pace <bob.pace@gmail.com>

ENV TERM xterm-256color
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    build-essential \
    ca-certificates \
    cmake \ 
    curl \
    git \
    locales \
    postgresql-client \
    libpq-dev \
    python-dev \
    python-software-properties \
    silversearcher-ag \
    software-properties-common \
    ssh \
    sudo \
    unzip \
    vim-gtk \
    wget \
    xauth \
    xclip \
    zsh \
    && rm -rf /var/lib/apt/lists/*

#Timezone
run cp /usr/share/zoneinfo/US/Mountain /etc/localtime

#UTF-8
RUN dpkg-reconfigure locales \
    && locale-gen en_US.UTF-8 \
    && /usr/sbin/update-locale LANG=en_US.UTF-8

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

#tmux 1.9a
RUN add-apt-repository ppa:pi-rho/dev \
    && apt-get update \
    && apt-get install -y tmux=1.9a-1~ppa1~t \
    && rm -rf /var/lib/apt/lists/*

RUN git clone --recursive https://github.com/Valloric/YouCompleteMe /usr/local/lib/YouCompleteMe \
    && /usr/local/lib/YouCompleteMe/install.sh --clang-completer

RUN useradd --create-home -G users devuser \
    && chgrp -R devuser /usr/local \
    && find /usr/local -type d | grep -v YouCompleteMe | xargs chmod g+w \
    && chsh -s /bin/zsh devuser

RUN echo "devuser ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/devuser \
    && echo "Defaults        env_keep+=SSH_AUTH_SOCK" >> /etc/sudoers.d/devuser \
    && chmod 0440 /etc/sudoers.d/devuser

USER devuser
ENV HOME /home/devuser
WORKDIR /home/devuser

CMD ["/bin/zsh"]
