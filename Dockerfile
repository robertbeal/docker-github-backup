FROM alpine:latest
LABEL maintainer="github.com/robertbeal"

ARG UID=1880
ARG GID=1880

RUN addgroup -g $GID git \
    && adduser -s /bin/false -D -H -G git -u $UID git \
    && apk add --no-cache python3 \
    && pip3 install--upgrade pip github-backup

USER git
ENTRYPOINT ["/usr/bin/github-backup"]
CMD ["--help"]