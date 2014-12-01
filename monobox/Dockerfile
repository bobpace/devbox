FROM bobpace/devbox
MAINTAINER Bob Pace <bob.pace@gmail.com>

#MONO
USER root

RUN apt-key adv --keyserver pgp.mit.edu --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF

RUN echo "deb http://download.mono-project.com/repo/debian wheezy/snapshots/3.10.0 main" > /etc/apt/sources.list.d/mono-xamarin.list \
  && apt-get update \
  && apt-get install -y mono-devel fsharp mono-vbnc nuget \
  && rm -rf /var/lib/apt/lists/*

# Install libuv for Kestrel from source code
RUN apt-get update && \
    apt-get -qqy install \
    autoconf \
    automake \
    libtool \
    && rm -rf /var/lib/apt/lists/*

RUN LIBUV_VERSION=1.0.0-rc2 \
  && curl -sSL https://github.com/joyent/libuv/archive/v${LIBUV_VERSION}.tar.gz | tar zxfv - -C /usr/local/src \
  && cd /usr/local/src/libuv-$LIBUV_VERSION \
  && sh autogen.sh && ./configure && make && make install \
  && rm -rf /usr/local/src/libuv-$LIBUV_VERSION \
  && ldconfig

USER devuser

RUN mozroots --import --sync

EXPOSE 5004

CMD ["/bin/zsh"]
