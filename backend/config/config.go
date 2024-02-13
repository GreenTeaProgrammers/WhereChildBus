package config

import (
	"log"

	"github.com/joho/godotenv"
	"github.com/kelseyhightower/envconfig"
)

type Config struct {
	DSN                                string `envconfig:"DSN" required:"true"`
	DBUser                             string `envconfig:"DB_USER_NAME" required:"true"`
	DBPassword                         string `envconfig:"DB_PASSWORD" required:"true"`
	DBAddress                          string `envconfig:"DB_ADDR" required:"true"`
	DBName                             string `envconfig:"DB_NAME" required:"true"`
	GrpcPort                           string `envconfig:"PORT" default:"50051"`
	ModeDev                            bool   `envconfig:"MODE_DEV" default:"true"`
	GoogleApplicationCredentials       string `envconfig:"GOOGLE_APPLICATION_CREDENTIALS" required:"true"`
	StorageBucketName                  string `envconfig:"STORAGE_BUCKET_NAME" required:"true"`
	PasswordPepper                     string `envconfig:"PASSWORD_PEPPER" required:"true"`
	EndPointPingRequest                string `default:"https://us-central1-wherechildbus.cloudfunctions.net/CloudFunctionHealthCheck"`
	EndPointCreateChildNotification    string `default:"https://us-central1-wherechildbus.cloudfunctions.net/CloudFunctionCreateChildNotification"`
	EndPointCreateBusNotification      string `default:"https://us-central1-wherechildbus.cloudfunctions.net/CloudFunctionCreateBusNotification"`
	EndPointChildGetOnBusNotification  string `default:"https://us-central1-wherechildbus.cloudfunctions.net/CloudFunctionChildGetOnBusNotification"`
	EndPointChildGetOffBusNotification string `default:"https://us-central1-wherechildbus.cloudfunctions.net/CloudFunctionChildGetOffBusNotification"`
}

func New() (*Config, error) {
	// .env ファイルから環境変数を読み込む
	if err := godotenv.Load(); err != nil {
		log.Println("No .env file found or error loading .env file, continuing with environment variables")
	}

	config := &Config{}
	if err := envconfig.Process("", config); err != nil {
		log.Printf("Error processing env variables: %v", err)
		return nil, err
	}

	// 開発モードが有効な場合にのみデバッグログを出力
	if config.ModeDev {
		log.Println("DSN:", config.DSN)
		log.Println("DB User:", config.DBUser)
		log.Println("DB Address:", config.DBAddress)
		log.Println("DB Name:", config.DBName)
		log.Println("Port:", config.GrpcPort)
	}

	return config, nil
}
