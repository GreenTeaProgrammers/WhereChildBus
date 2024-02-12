package grpc_server

import (
	"cloud.google.com/go/storage"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent"
	"golang.org/x/exp/slog"
)

type option struct {
	logger        *slog.Logger
	entClient     *ent.Client
	storageClient *storage.Client
	bucketName    string
	useReflection bool
}

func defaultOption() *option {
	return &option{
		logger: slog.Default(),
	}
}

type optionFunc func(*option)

func WithLogger(logger *slog.Logger) optionFunc {
	return func(o *option) {
		o.logger = logger
	}
}

// publish grpc server information(method, service, etc.)
func WithReflection(b bool) optionFunc {
	return func(o *option) {
		o.useReflection = b
	}
}

func WithEntClient(c *ent.Client) optionFunc {
	return func(o *option) {
		o.entClient = c
	}
}

func WithStorageClient(s *storage.Client) optionFunc {
	return func(o *option) {
		o.storageClient = s
	}
}

func WithBucketName(b string) optionFunc {
	return func(o *option) {
		o.bucketName = b
	}
}
