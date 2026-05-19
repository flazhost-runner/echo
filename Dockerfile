FROM golang:1.21
WORKDIR /app
COPY . .
RUN go build -o echo main.go
EXPOSE 1323
CMD ["./echo"]
