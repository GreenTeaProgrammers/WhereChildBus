package main

import (
	"context"
	"database/sql"
	"log"
	"net"
	"os"
	"os/signal"
	"syscall"

	"cloud.google.com/go/storage"
	mlv1 "github.com/GreenTeaProgrammers/WhereChildBus/backend/proto-gen/go/machine_learning/v1"
	"github.com/go-sql-driver/mysql"
	_ "github.com/go-sql-driver/mysql"
	"golang.org/x/exp/slog"
	"google.golang.org/grpc"
	"google.golang.org/grpc/credentials/insecure"

	"github.com/GreenTeaProgrammers/WhereChildBus/backend/config"
	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent"
	grpc_server "github.com/GreenTeaProgrammers/WhereChildBus/backend/gprc_server"
)

func main() {
	// コンフィグを読み込む
	config, _ := config.New()

	// MySQLへの接続をテスト
	db, err := sql.Open("mysql", config.DSN)
	if err != nil {
		log.Fatal("failed to open db connection", err)
	}

	// PlanetScaleへの接続をテスト
	if err := db.Ping(); err != nil {
		log.Fatalf("Failed to ping PlanetScale: %v", err)
	}

	// PlanetScaleへの接続を開始
	log.Println("Connecting to PlanetScale...")

	mysqlConfig := &mysql.Config{
		User:                 config.DBUser,
		Passwd:               config.DBPassword,
		Net:                  "tcp",
		Addr:                 config.DBAddress,
		DBName:               config.DBName,
		ParseTime:            true,
		TLSConfig:            "true", // この行は必要に応じて調整してください。
		AllowNativePasswords: true,
		InterpolateParams:    true,
	}

	entClient, err := ent.Open("mysql", mysqlConfig.FormatDSN())
	if err != nil {
		log.Fatal(err)
	}

	log.Println("Successfully connected to PlanetScale!")

	// マイグレーションを実行
	log.Println("Running migration...")
	defer entClient.Close()
	if err := entClient.Schema.Create(context.Background()); err != nil {
		log.Println("Migration failed!")
		log.Fatal(err)
	}

	log.Println("Migration done!")

	// Cloud Storageへの接続を開始
	log.Println("Connecting to Cloud Storage...")
	ctx := context.Background()
	storageClient, err := storage.NewClient(ctx)
	if err != nil {
		log.Fatalf("Failed to create Cloud Storage client: %v", err)
	}
	defer storageClient.Close()

	log.Println("Connected to Cloud Storage!")

	// 機械学習gRPCサーバーへの接続を開始
	log.Println("Connecting to ML gRPC server...")
	conn, err := grpc.Dial(config.MLAddress, grpc.WithTransportCredentials(insecure.NewCredentials()))
	if err != nil {
		log.Fatal(err)
	}
	defer conn.Close()
	mlClient := mlv1.NewMachineLearningServiceClient(conn)

	// loggerを作成
	logger := slog.Default()

	// gRPCサーバーを起動
	srv := grpc_server.New(
		grpc_server.WithLogger(logger),
		grpc_server.WithEntClient(entClient),
		grpc_server.WithReflection(config.ModeDev),
		grpc_server.WithStorageClient(storageClient),
		grpc_server.WithBucketName(config.StorageBucketName),
		grpc_server.WithMLClient(mlClient),
	)
	lsnr, err := net.Listen("tcp", ":"+config.GrpcPort)
	if err != nil {
		log.Fatal(err)
	}
	defer lsnr.Close()
	go func() {
		logger.Info("server launched")
		if err := srv.Serve(lsnr); err != nil {
			log.Fatal(err)
		}
	}()
	sigCh := make(chan os.Signal, 1)
	signal.Notify(sigCh, os.Interrupt, syscall.SIGTERM)
	<-sigCh
	logger.Info("server is being stopped")
	srv.GracefulStop()
}
