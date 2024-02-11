package main

import (
	"context"
	"crypto/tls"
	"flag"
	"log"

	pb "github.com/GreenTeaProgrammers/WhereChildBus/backend/proto-gen/go/where_child_bus"

	"google.golang.org/grpc"
	"google.golang.org/grpc/credentials"
)

var (
	grpcEndpoint = flag.String("grpc_endpoint", "", "The gRPC Endpoint of the Server")
)

func main() {
	flag.Parse()
	if *grpcEndpoint == "" {
		log.Fatal("[main] unable to start client without gRPC endpoint to server")
	}

	creds := credentials.NewTLS(&tls.Config{
		InsecureSkipVerify: true,
	})

	opts := []grpc.DialOption{
		grpc.WithTransportCredentials(creds),
	}

	log.Printf("Connecting to gRPC Service [%s]", *grpcEndpoint)
	conn, err := grpc.Dial(*grpcEndpoint, opts...)
	if err != nil {
		log.Fatal(err)
	}
	defer conn.Close()

	client := NewClient(conn)
	ctx := context.Background()

	rqst := &pb.PingRequest{
		Name: "Ping",
	}
	resp, err := client.Ping(ctx, rqst)
	if err != nil {
		log.Fatal(err)
	}
	log.Printf("Ping Response: %s", resp.Message)
}

// Client is a struct that implements the pb.CalculatorClient
type Client struct {
	client pb.HealthcheckServiceClient
}

// NewClient returns a new Client
func NewClient(conn *grpc.ClientConn) *Client {
	return &Client{
		client: pb.NewHealthcheckServiceClient(conn),
	}
}

func (c *Client) Ping(ctx context.Context, r *pb.PingRequest) (*pb.PingResponse, error) {
	return c.client.Ping(ctx, r)
}
