package main

import (
	"context"
	"crypto/tls"
	"flag"
	"fmt"
	"io"
	"log"

	pb "github.com/GreenTeaProgrammers/WhereChildBus/backend/proto-gen/go/where_child_bus/v1"

	"github.com/GreenTeaProgrammers/WhereChildBus/backend/config"
	"google.golang.org/api/idtoken"
	"google.golang.org/api/option"
	"google.golang.org/grpc"
	"google.golang.org/grpc/credentials"
)

var (
	grpcEndpoint     = flag.String("grpc_endpoint", "", "The gRPC Endpoint of the Server")
	cloudFunctionURL = "https://us-central1-wherechildbus.cloudfunctions.net/CloudFunctionHealthCheck" // Cloud FunctionのURL
)

func main() {
	flag.Parse()

	// コンフィグレーションを読み込む
	cfg, err := config.New()
	if err != nil {
		log.Fatalf("Failed to load config: %v", err)
	}

	// Cloud Functionに対して認証済みGETリクエストを行う
	if err := makeGetRequest(cfg.GoogleApplicationCredentials, cloudFunctionURL); err != nil {
		log.Fatalf("Failed to make GET request: %v", err)
	}
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

// `makeGetRequest` makes a request to the provided `targetURL`
// with an authenticated client using audience `audience`.
func makeGetRequest(credsPath, targetURL string) error {
	ctx := context.Background()

	// client is a http.Client that automatically adds an "Authorization" header
	// to any requests made.
	client, err := idtoken.NewClient(ctx, targetURL, option.WithCredentialsFile(credsPath))
	if err != nil {
		return fmt.Errorf("idtoken.NewClient: %w", err)
	}

	resp, err := client.Get(targetURL)
	if err != nil {
		return fmt.Errorf("client.Get: %w", err)
	}
	defer resp.Body.Close()

	body, err := io.ReadAll(resp.Body)
	if err != nil {
		return fmt.Errorf("ioutil.ReadAll: %w", err)
	}

	log.Printf("Cloud Function response: %s", string(body))

	return nil
}
