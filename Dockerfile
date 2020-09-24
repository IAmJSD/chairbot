FROM golang:alpine AS builder
WORKDIR /go/src/app
COPY . .
RUN go get .
RUN GOOS=linux go build -o app .

FROM alpine
WORKDIR /app
RUN apk --no-cache add ca-certificates
COPY --from=builder /go/src/app/ .
CMD ["./app"]
