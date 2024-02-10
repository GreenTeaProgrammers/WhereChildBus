# First stage: build environment
FROM golang:1.21.5 AS builder

WORKDIR /srv/grpc
COPY . .
# .env ファイルをイメージ内にコピー
COPY .env /
RUN go mod download

ARG VERS="3.11.4"
ARG ARCH="linux-x86_64"

RUN CGO_ENABLED=0 GOOS=linux \
    go build -a -installsuffix cgo \
    -o /go/bin/server \
    github.com/GreenTeaProgrammers/WhereChildBus/backend/cmd/server

# Final stage: runtime environment
FROM scratch

# Corrected COPY command to use 'builder' instead of 'build'
COPY --from=builder /go/bin/server /server
COPY --from=builder /srv/grpc/.env /


ENTRYPOINT ["/server"]
