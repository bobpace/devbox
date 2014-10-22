FROM bobpace/devbox
MAINTAINER Bob Pace <bob.pace@gmail.com>

USER root

RUN add-apt-repository ppa:webupd8team/java

RUN wget http://apt.typesafe.com/repo-deb-build-0002.deb \
    && dpkg -i repo-deb-build-0002.deb \
    && rm -f repo-deb-build-0002.deb

RUN apt-get update \
    && apt-get install -y openjdk-7-jre libjansi-java \
    && wget http://www.scala-lang.org/files/archive/scala-2.11.1.deb \
    && dpkg -i scala-2.11.1.deb \
    && rm -f scala-2.11.1.deb \
    && rm -rf /var/lib/apt/lists/*

RUN echo 'debconf shared/accepted-oracle-license-v1-1 select true' | debconf-set-selections
RUN apt-get update \
    && apt-get install -y oracle-java7-set-default \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update \
    && apt-get install -y sbt \
    && wget http://dl.bintray.com/sbt/debian/sbt-0.13.5.deb \
    && dpkg -i sbt-0.13.5.deb \
    && rm -f sbt-0.13.5.deb \
    && rm -rf /var/lib/apt/lists/*

USER devuser

RUN mkdir ~/.ivy2

RUN wget http://downloads.typesafe.com/typesafe-activator/1.2.10/typesafe-activator-1.2.10.zip \
    && unzip typesafe-activator-1.2.10.zip -d /usr/local/lib \
    && rm -f typesafe-activator-1.2.10.zip \
    && ln -s /usr/local/lib/activator-1.2.10/activator /usr/local/bin/activator

ADD sbtopts /usr/share/sbt-launcher-packaging/conf/sbtopts

#activator and default play port
EXPOSE 8888 9000

CMD ["/bin/zsh"]
