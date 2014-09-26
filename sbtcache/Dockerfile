FROM busybox
MAINTAINER Bob Pace <bob.pace@gmail.com>

RUN mkdir -p /home/devuser/.sbt/.boot && \
    mkdir /home/devuser/.sbt/.iv2 && \
    chown -R default /home/devuser/.sbt

VOLUME /home/devuser/.sbt

CMD ["true"]
