package main

import (
	"context"
	"log"
	"time"

	pb "github.com/GreenTeaProgrammers/WhereChildBus/backend/proto-gen/go/where_child_bus/v1"
	"google.golang.org/grpc"
	"google.golang.org/grpc/credentials"
)

func main() {
	creds := credentials.NewClientTLSFromCert(nil, "")
	conn, err := grpc.Dial("hoicruise-grpc-k3dkun2lpq-uc.a.run.app:443", grpc.WithTransportCredentials(creds))

	if err != nil {
		log.Fatalf("failed to dial: %v", err)
	}
	defer conn.Close()

	MLClient := pb.NewBusServiceClient(conn)

	MLStream, err := MLClient.SendLocationContinuous(context.Background())
	if err != nil {
		log.Fatalf("failed to create a stream: %v", err)
	}

	var Latitude float64 = 34.725052
	var Longitude float64 = 137.719482
	// リクエスト定義

	// リクエストの送信

	for i := 0; i < 100; i++ {
		in := pb.SendLocationContinuousRequest{
			BusId:     "c3c27f87-bad8-4d31-936a-6a43b5335f4b",
			Latitude:  Latitude,
			Longitude: Longitude,
		}
		go func() {
			err := MLStream.Send(&in)
			if err != nil {
				log.Fatalf("failed to send a stream: %v", err)
			}
			// 50メートル移動
			Latitude += 0.00045
			Longitude += 0.00045
		}()
		// 1秒待機
		time.Sleep(1 * time.Second)
		print("send\n")
	}
	MLStream.CloseSend()

}
