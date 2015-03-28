FROM bobpace/devbox
MAINTAINER Bob Pace <bob.pace@gmail.com>

#MONO
USER root

RUN apt-key adv --keyserver pgp.mit.edu --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF

RUN echo "deb http://download.mono-project.com/repo/debian wheezy/snapshots/3.12.0 main" > /etc/apt/sources.list.d/mono-xamarin.list \
  && apt-get update \
  && apt-get install -y \
  automake \
  ca-certificates-mono \
  fsharp \
  mono-complete \
  nunit-console \
  nuget \
  tree \
  && rm -rf /var/lib/apt/lists/*

# node.js for project scaffolding and front end asset convenience
RUN curl -sL https://deb.nodesource.com/setup_0.12 | bash - \
    && apt-get install -y nodejs \
    && npm install -g grunt-init \
    && rm -rf /var/lib/apt/lists/*

#better stack traces with nunit-console runner
RUN sed -i \
  -e 's/cli/cli --debug --runtime=v4.0/' \
  /usr/bin/nunit-console

#install watchman from facebook
WORKDIR /usr/local/lib
RUN git clone https://github.com/facebook/watchman.git \
    && cd watchman \
    && ./autogen.sh \
    && ./configure \
    && make \
    && make install

WORKDIR /home/devuser
USER devuser

EXPOSE 5004

CMD ["/bin/zsh"]
