FROM bobpace/devbox-base
MAINTAINER Bob Pace <bob.pace@gmail.com>

# install add-apt-repository tool
# install wget for downloading files
# Java 7 apt repository
RUN sudo apt-get install -y \
    software-properties-common python-software-properties wget && \
    sudo add-apt-repository ppa:webupd8team/java

# Typesafe repo (contains old versions but they have all dependencies we need later on)
RUN sudo wget http://apt.typesafe.com/repo-deb-build-0002.deb && \
    sudo dpkg -i repo-deb-build-0002.deb && \
    sudo rm -f repo-deb-build-0002.deb

# update apt repositories
# install Scala 2.10.3, requires OpenJDK 1.6
# 1) first install prerequisites
# 2) finally install Scala 2.10.3
RUN sudo apt-get update && \
    sudo apt-get install -y openjdk-6-jre libjansi-java && \
    sudo wget http://www.scala-lang.org/files/archive/scala-2.10.3.deb && \
    sudo dpkg -i scala-2.10.3.deb && \
    sudo rm -f scala-2.10.3.deb

# upgrade Java to latest 1.7.x
RUN echo 'debconf shared/accepted-oracle-license-v1-1 select true' | sudo debconf-set-selections
RUN sudo apt-get install -y oracle-java7-set-default

# 1) first install old sbt 0.11.3 from typesafe (old one but comes with all dependencies)
# 2) now that we have sbt we can upgrade it to 0.13.6
RUN sudo apt-get install -y sbt && \
    sudo wget http://dl.bintray.com/sbt/debian/sbt-0.13.6.deb && \
    sudo dpkg -i sbt-0.13.6.deb && \
    sudo rm -f sbt-0.13.6.deb && \
    sudo sbt version

CMD ["/bin/zsh"]
