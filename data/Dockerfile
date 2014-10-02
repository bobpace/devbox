FROM busybox
MAINTAINER Bob Pace <bob.pace@gmail.com>

RUN mkdir -p /home/devuser/data \
    && chown -R default /home/devuser/data

VOLUME /home/devuser/data

CMD ["true"]
