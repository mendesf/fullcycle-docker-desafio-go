FROM golang:1.21.5-alpine3.19 as build
WORKDIR /usr/src/app
COPY go.mod app.go ./
RUN go build -v -ldflags="-s -w" -o /usr/local/bin/app

FROM alpine:latest
COPY --from=build /usr/local/bin/app /usr/local/bin/app
CMD [ "app" ]