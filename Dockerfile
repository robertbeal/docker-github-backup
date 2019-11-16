FROM alpine:latest
LABEL maintainer="github.com/robertbeal"

ARG UID=1880
ARG GID=1880

RUN addgroup -g $GID github \
    && adduser -s /bin/false -D -H -G github -u $UID github \
    && apk add --no-cache git python3 \
    && pip3 install --upgrade pip github-backup

VOLUME /data
USER github
ENTRYPOINT ["/usr/bin/github-backup"]
CMD ["--help"]