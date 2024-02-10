package grpc_server

import (
	"context"

	grpc_interfaces "github.com/GreenTeaProgrammers/WhereChildBus/backend/interfaces"
	pb "github.com/GreenTeaProgrammers/WhereChildBus/backend/proto-gen/go/where_child_bus"
	"github.com/grpc-ecosystem/go-grpc-middleware/v2/interceptors/logging"
	"golang.org/x/exp/slog"
	"google.golang.org/grpc"
	"google.golang.org/grpc/reflection"
)

func New(opts ...optionFunc) *grpc.Server {
	opt := defaultOption()
	for _, f := range opts {
		f(opt)
	}

	serverOptions := make([]grpc.ServerOption, 0)
	// set logging interceptor
	serverOptions = append(serverOptions,
		grpc.ChainUnaryInterceptor(logging.UnaryServerInterceptor(interceptorLogger(opt.logger))),
		grpc.ChainStreamInterceptor(logging.StreamServerInterceptor(interceptorLogger(opt.logger))),
	)

	srv := grpc.NewServer(serverOptions...)
	if opt.useReflection {
		reflection.Register(srv)
	}
	healthcheckSrv := grpc_interfaces.NewHealthcheckServiceServer()
	pb.RegisterHealthcheckServiceServer(srv, healthcheckSrv)

	return srv
}

func interceptorLogger(l *slog.Logger) logging.Logger {
	return logging.LoggerFunc(func(ctx context.Context, lvl logging.Level, msg string, fields ...any) {
		l.Log(ctx, slog.Level(lvl), msg, fields...)
	})
}