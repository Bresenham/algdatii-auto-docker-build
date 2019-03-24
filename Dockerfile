FROM golang:alpine
ARG GOLANGCI_LINT_VERSION=1.15.0
RUN adduser -u 1000 -D jenkins && \
  wget -O - -q https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh \
  | ash -s v$GOLANGCI_LINT_VERSION && \
  apk add --no-cache make git && \
  mkdir /.cache && chmod -R 777 /.cache $GOPATH
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    libgtk-3-dev \
    libcairo2-dev \
    libglib2.0-dev