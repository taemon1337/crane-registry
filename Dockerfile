FROM alpine/crane:latest AS crane
FROM alpine/helm:latest AS helm
FROM registry:2

VOLUME /var/lib/registry
EXPOSE 5000

WORKDIR /tmp

COPY --from=crane /usr/bin/crane /usr/bin/crane
COPY --from=helm /usr/bin/helm /usr/bin/helm

COPY ./config.yml /etc/docker/registry/config.yml
COPY ./manifests/*.txt .
COPY ./preload .

RUN ./preload
