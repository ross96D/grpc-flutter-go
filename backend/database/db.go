package database

import (
	"context"
	"database/sql"
	"fmt"
	"os"
)

var DB *sql.DB

// This functions exit program on fail
func Connect() {
	db, err := sql.Open(
		"postgres",
		"user=postgres password=postgre dbname=book-store sslmode=disable",
	)
	if err != nil {
		fmt.Println("Connection to database failed", err)
		os.Exit(1)
	}
	DB = db
}

type BeginTxParams struct {
	Ctx  context.Context
	Opts *sql.TxOptions
}

func BeginTx(params BeginTxParams) (*sql.Tx, error) {
	if params.Opts == nil {
		params.Opts = &sql.TxOptions{
			Isolation: sql.LevelReadCommitted,
			ReadOnly:  true,
		}
	}
	return DB.BeginTx(params.Ctx, params.Opts)
}
