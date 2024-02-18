# First stage: build environment
FROM golang:1.21.5 AS builder

WORKDIR /srv/grpc
COPY . .

# ARGでビルド時の引数を定義
ARG DSN
ARG DB_USER_NAME
ARG DB_PASSWORD
ARG DB_ADDR
ARG DB_NAME
ARG PORT
ARG MODE_DEV
ARG GOOGLE_APPLICATION_CREDENTIALS
ARG STORAGE_BUCKET_NAME
ARG PASSWORD_PEPPER
ARG ML_ADDR

ARG INSIDE_OF_CREDENTIALS

RUN echo "Port is: $PORT" && echo "Mode is: $MODE_DEV"


# .env ファイルを生成
RUN echo "DSN=$DSN" > .env \
    && echo "DB_USER_NAME=$DB_USER_NAME" >> .env \
    && echo "DB_PASSWORD=$DB_PASSWORD" >> .env \
    && echo "DB_ADDR=$DB_ADDR" >> .env \
    && echo "DB_NAME=$DB_NAME" >> .env \
    && echo "PORT=$PORT" >> .env \
    && echo "MODE_DEV=$MODE_DEV" >> .env \
    && echo "GOOGLE_APPLICATION_CREDENTIALS=$GOOGLE_APPLICATION_CREDENTIALS" >> .env \
    && echo "STORAGE_BUCKET_NAME=$STORAGE_BUCKET_NAME" >> .env \
    && echo "PASSWORD_PEPPER=$PASSWORD_PEPPER" >> .env \
    && echo "ML_ADDR=$ML_ADDR" >> .env

# secretsディレクトリのgcp-credentials.jsonを作成
RUN mkdir secrets
RUN touch secrets/gcp-credentials.json
RUN echo "$INSIDE_OF_CREDENTIALS" >> secrets/gcp-credentials.json

RUN go mod download

ARG VERS="3.11.4"
ARG ARCH="linux-x86_64"

RUN CGO_ENABLED=0 GOOS=linux \
    go build -a -installsuffix cgo \
    -o /go/bin/server \
    github.com/GreenTeaProgrammers/WhereChildBus/backend/cmd/server

# Final stage: runtime environment
# CA証明書が必要なので、alpineをベースにする
FROM alpine:latest

# 必要なパッケージをインストール
RUN apk --no-cache add ca-certificates

# ビルドステージからバイナリと.envファイルをコピー
COPY --from=builder /go/bin/server /server
COPY --from=builder /srv/grpc/.env ./.env
COPY --from=builder /srv/grpc/secrets /secrets

# アプリケーションの起動
ENTRYPOINT ["/server"]
