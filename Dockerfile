FROM golang:latest as build

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
                libgtk-3-dev \
                libcairo2-dev \
                libglib2.0-dev

RUN mkdir /app 
ADD . /app/ 
WORKDIR /app 

RUN go get github.com/gotk3/gotk3/gtk
RUN go build -o main . 

FROM iron/go
RUN mkdir /app
COPY --from=build /app/main /app/
CMD ["/app/main"]