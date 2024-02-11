# ビルドステージ
FROM golang:1.21.5 AS builder

WORKDIR /src
COPY ./proto-gen ./proto-gen

WORKDIR /src/
COPY /go.mod /go.sum ./
RUN go mod download

COPY . .
RUN go build \
    -tags timetzdata \
    -o where-my-bus-backend \
    ./cmd/server

# 実行ステージ
FROM ubuntu:22.04

RUN apt-get update && apt-get install -y --no-install-recommends \
        tzdata \
        ca-certificates \
    && rm -rf /var/lib/apt/lists/*
ENV TZ Asia/Tokyo

WORKDIR /app
COPY --from=builder /src/where-my-bus-backend .

# gRPCサービスが使用するポート50051を公開
EXPOSE 50051

ENTRYPOINT [ "/app/where-my-bus-backend" ]
