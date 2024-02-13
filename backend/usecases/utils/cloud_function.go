package utils

import (
	"context"
	"fmt"
	"io"
	"net/http"

	"github.com/GreenTeaProgrammers/WhereChildBus/backend/config"
	"google.golang.org/api/idtoken"
	"google.golang.org/api/option"
)

// MakeCloudFunctionRequest makes a request to the provided targetURL
// with an authenticated client using audience. It returns the response body.
func MakeCloudFunctionRequest(targetURL, method string) (string, error) {
	cfg, err := config.New()

	ctx := context.Background()
	client, err := idtoken.NewClient(ctx, targetURL, option.WithCredentialsFile(cfg.GoogleApplicationCredentials))
	if err != nil {
		return "", fmt.Errorf("idtoken.NewClient: %w", err)
	}

	var resp *http.Response
	switch method {
	case "GET":
		resp, err = client.Get(targetURL)
	case "POST":
		resp, err = client.Post(targetURL, "application/json", nil) // Note: In a real scenario, you might want to pass a non-nil body for POST requests.
	default:
		return "", fmt.Errorf("unsupported method: %s", method)
	}

	if err != nil {
		return "", fmt.Errorf("%s request failed: %w", method, err)
	}
	defer resp.Body.Close()

	body, err := io.ReadAll(resp.Body)
	if err != nil {
		return "", fmt.Errorf("reading response body failed: %w", err)
	}

	return string(body), nil
}
