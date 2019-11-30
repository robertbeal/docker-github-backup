FROM alpine:latest
LABEL maintainer="github.com/robertbeal"

ARG UID=1880
ARG GID=1880

RUN apk add --no-cache \
    git \
    openssh-client \
    python3 \
    && pip3 install --upgrade pip github-backup \
    && addgroup -g $GID github \
    && adduser -s /bin/false -D -G github -u $UID github

WORKDIR /home/github
ENV HOME /home/github
VOLUME /data
USER github
ENTRYPOINT ["/usr/bin/github-backup"]
CMD ["--help"]