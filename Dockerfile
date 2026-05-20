FROM golang:1.23-alpine AS build
WORKDIR /app
COPY . .
RUN go mod tidy && go build -o /app/server .

FROM alpine:3.20
WORKDIR /app
COPY --from=build /app/server /app/server
ENV PORT=80
EXPOSE 80
CMD ["/app/server"]
