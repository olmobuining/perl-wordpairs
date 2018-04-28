FROM alpine:3.4

RUN \
   apk add --update build-base wget perl perl-dev && \
   cpan Text::Ngrams

RUN mkdir -p /app
WORKDIR /app
