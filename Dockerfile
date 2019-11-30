FROM alpine:latest
LABEL maintainer="github.com/robertbeal"

ARG UID=1880
ARG GID=1880

RUN addgroup -g $GID github \
    && adduser -s /bin/false -D -G github -u $UID github \
    && mkdir -p /home/github/.ssh \
    # stop interactive prompt to allow github.com fingerprint
    && ssh-keyscan github.com >> /home/github/.ssh/known_hosts \
    && apk add --no-cache \
    git \
    openssh-client \
    python3 \
    && pip3 install --upgrade pip github-backup

ENV HOME /home/github
VOLUME /data
USER github
ENTRYPOINT ["/usr/bin/github-backup"]
CMD ["--help"]