FROM golang:alpine as builder

WORKDIR /go/src/app

COPY . .

RUN go build -o /app hello-world.go

FROM scratch

COPY --from=builder /app /app

CMD ["/app"]