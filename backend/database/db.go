package database

import (
	"context"
	"database/sql"
	"fmt"
	"os"
)

var _db *sql.DB

func DB() *sql.DB {
	return _db
}

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
	_db = db
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
	return _db.BeginTx(params.Ctx, params.Opts)
}
