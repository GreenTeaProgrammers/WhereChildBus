package grpc_server

import (
	"context"

	grpc_interfaces "github.com/GreenTeaProgrammers/WhereChildBus/backend/interfaces"
	pb "github.com/GreenTeaProgrammers/WhereChildBus/backend/proto-gen/go/where_child_bus/v1"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/usecases/bus"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/usecases/busroute"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/usecases/child"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/usecases/guardian"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/usecases/nursery"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/usecases/station"
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

	// set maximum message sizes
	maxMsgSize := 100 * 1024 * 1024 // 100MB
	serverOptions = append(serverOptions, grpc.MaxRecvMsgSize(maxMsgSize), grpc.MaxSendMsgSize(maxMsgSize))

	srv := grpc.NewServer(serverOptions...)
	if opt.useReflection {
		reflection.Register(srv)
	}

	busInteractor := bus.NewInteractor(opt.entClient, opt.logger, opt.MLClient)
	busSrv := grpc_interfaces.NewBusServiceServer(busInteractor)
	pb.RegisterBusServiceServer(srv, busSrv)

	busRouteInteractor := busroute.NewInteractor(opt.entClient, opt.logger, opt.MLClient)
	busRouteSrv := grpc_interfaces.NewBusRouteServiceServer(busRouteInteractor)
	pb.RegisterBusRouteServiceServer(srv, busRouteSrv)

	childInteractor := child.NewInteractor(opt.entClient, opt.logger, opt.storageClient, opt.MLClient, opt.bucketName) // NOTE: GCSを使うのでstorageClientとbucketNameを渡す
	childSrv := grpc_interfaces.NewChildServiceServer(childInteractor)
	pb.RegisterChildServiceServer(srv, childSrv)

	guardianInteractor := guardian.NewInteractor(opt.entClient, opt.logger)
	guardianSrv := grpc_interfaces.NewGuardianServiceServer(guardianInteractor)
	pb.RegisterGuardianServiceServer(srv, guardianSrv)

	healthcheckSrv := grpc_interfaces.NewHealthcheckServiceServer()
	pb.RegisterHealthcheckServiceServer(srv, healthcheckSrv)

	nurseryInteractor := nursery.NewInteractor(opt.entClient, opt.logger)
	nurserySrv := grpc_interfaces.NewNurseryServiceServer(nurseryInteractor)
	pb.RegisterNurseryServiceServer(srv, nurserySrv)

	stationInteractor := station.NewInteractor(opt.entClient, opt.logger)
	stationSrv := grpc_interfaces.NewStationServiceServer(stationInteractor)
	pb.RegisterStationServiceServer(srv, stationSrv)

	return srv
}

func interceptorLogger(l *slog.Logger) logging.Logger {
	return logging.LoggerFunc(func(ctx context.Context, lvl logging.Level, msg string, fields ...any) {
		l.Log(ctx, slog.Level(lvl), msg, fields...)
	})
}
