package controllers

import (
	"context"
	"database/sql"
	"errors"
	"fmt"
	db "grpc-flutter/backend/database"
	p "grpc-flutter/backend/generated/grpc"
	"grpc-flutter/backend/utils"
)

type UserServiceServer struct {
	p.UnimplementedUserServiceServer
}

func (s UserServiceServer) Login(ctx context.Context, params *p.LoginParams) (*p.Token, error) {
	query := "SELECT password FROM user WHERE email = ?"
	rows, err := db.DB().QueryContext(ctx, query, params.Email)
	if err != nil {
		fmt.Println("Error:", err)
		return nil, errors.New("Authentication Error")
	}
	hashed := utils.Hash(params.Password)
	var password string
	rows.Scan(password)
	if password == hashed {
		return &p.Token{Token: "auth-token"}, nil
	} else {
		return nil, errors.New("Authentication Error")
	}
}

func (s UserServiceServer) Register(ctx context.Context, params *p.User) (*p.RegisterResult, error) {
	tx, err := db.BeginTx(db.BeginTxParams{Ctx: ctx, Opts: &sql.TxOptions{ReadOnly: false}})
	if err != nil {
		fmt.Println("Error Begining Transaction:", err)
		return nil, err
	}
	query := "INSERT INTO public.user(name, lastname, email, password) " +
		"VALUES ($1, $2, $3, $4)"

	_, err = tx.Exec(query, params.Name, params.Lastname, params.Email, params.Password)
	if err != nil {
		fmt.Println("Error Querying:", err.Error())
		return nil, err
	}
	if err = tx.Commit(); err != nil {
		fmt.Println("Error Commiting:", err.Error())
		return nil, err
	}
	return &p.RegisterResult{Result: true}, nil
}
