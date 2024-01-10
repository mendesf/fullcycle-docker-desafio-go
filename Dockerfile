FROM golang:1.21.5 as build

WORKDIR /go/src/app
COPY go.mod app.go ./

RUN CGO_ENABLED=0 go build -ldflags="-s -w" -o /go/bin/app

FROM scratch
COPY --from=build /go/bin/app /
CMD ["/app"]
