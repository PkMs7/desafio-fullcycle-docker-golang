FROM golang:alpine AS builder

WORKDIR /app

COPY /hello .

RUN go build --trimpath main.go

FROM scratch

COPY --from=builder /app .

CMD [ "/main" ]