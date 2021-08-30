FROM golang:1.7-alpine

WORKDIR /go/src/app
COPY main.go .
RUN go get -d -v ./...
RUN go install -v ./...
RUN go build -ldflags "-s -w"

FROM scratch
WORKDIR /
COPY --from=0 /go/src/app .
CMD ["./app"] 
