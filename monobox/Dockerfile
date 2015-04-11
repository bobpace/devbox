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
  gyp \
  libtool \
  mono-complete \
  nuget \
  nunit-console \
  && rm -rf /var/lib/apt/lists/*

#better stack traces with nunit-console runner
RUN sed -i \
  -e 's/cli \(.*\) /cli --debug --runtime=v4.0 --optimize=-inline \1 -config=Debug /' \
  /usr/bin/nunit-console \
  && ln -s /usr/bin/nunit-console /usr/bin/nunit-console.exe

#xsp to host asp.net mvc projects for development
WORKDIR /usr/local/lib
RUN git clone https://github.com/mono/xsp.git \
  && cd xsp \
  && ./autogen.sh \
  && ./configure --prefix=/usr \
  && make \
  && make install \
  && mkdir /etc/mono/registry \
  && chmod uog+rw /etc/mono/registry

#libuv for roslyn
RUN wget http://dist.libuv.org/dist/v1.0.0-rc1/libuv-v1.0.0-rc1.tar.gz \
  && tar -xvf libuv-v1.0.0-rc1.tar.gz \
  && cd libuv-v1.0.0-rc1/ \
  && ./gyp_uv.py -f make -Duv_library=shared_library \
  && make -C out \
  && cp out/Debug/lib.target/libuv.so /usr/lib/libuv.so.1.0.0-rc1 \
  && ln -s libuv.so.1.0.0-rc1 /usr/lib/libuv.so.1

WORKDIR /home/devuser
USER devuser

CMD ["/bin/zsh"]
