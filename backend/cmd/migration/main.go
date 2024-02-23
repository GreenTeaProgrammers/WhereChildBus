package main

import (
	"context"
	"log"
	"time"

	"github.com/go-sql-driver/mysql"
	_ "github.com/go-sql-driver/mysql"

	"github.com/GreenTeaProgrammers/WhereChildBus/backend/domain/repository/ent"
)

func main() {
	jst, err := time.LoadLocation("Asia/Tokyo")
	if err != nil {
		log.Fatal(err)
	}
	mysqlConfig := &mysql.Config{
		DBName:    "where_child_bus",
		User:      "root",
		Passwd:    "016be2senpu7f",
		Addr:      "localhost:3306",
		Net:       "tcp",
		ParseTime: true,
		Loc:       jst,
	}
	entClient, err := ent.Open("mysql", mysqlConfig.FormatDSN())
	if err != nil {
		log.Fatal(err)
	}
	defer entClient.Close()
	if err := entClient.Schema.Create(context.Background()); err != nil {
		log.Fatal(err)
	}
}
