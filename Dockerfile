FROM alpine/crane:latest

VOLUME /var/lib/registry
EXPOSE 5000

WORKDIR /tmp

COPY ./*.txt .
COPY ./preload .

RUN ./preload

ENTRYPOINT ["crane", "registry", "serve"]
CMD ["--address", ":5000", "--disk", "/var/lib/registry", "--insecure"]
