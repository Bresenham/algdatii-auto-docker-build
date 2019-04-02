FROM golang:alpine
ARG GOLANGCI_LINT_VERSION=1.15.0
RUN adduser -u 1000 -D jenkins && \
  wget -O - -q https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh \
  | ash -s v$GOLANGCI_LINT_VERSION && \
  apk add --no-cache make git gcc musl-dev glib-dev cairo  gtk+3.0-dev && \
mkdir /.cache && chmod -R 777 /.cache $GOPATH
RUN chown 1000 /go/pkg/mod
RUN go get github.com/gotk3/gotk3/gtk
