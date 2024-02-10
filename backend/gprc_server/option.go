package grpc_server

import (
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent"
	"golang.org/x/exp/slog"
)

type option struct {
	logger        *slog.Logger
	entClient     *ent.Client
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
