package controllers

import (
	"context"
	"database/sql"
	"fmt"
	db "grpc-flutter/backend/database"
	p "grpc-flutter/backend/generated/grpc"
	"grpc-flutter/backend/utils"

	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

type UserServiceServer struct {
	p.UnimplementedUserServiceServer
}

func (s UserServiceServer) Login(ctx context.Context, params *p.LoginParams) (*p.Token, error) {
	query := "SELECT password FROM public.\"user\" WHERE email = $1"
	rows, err := db.DB().QueryContext(ctx, query, params.Email)
	if err != nil {
		fmt.Println("Error:", err)
		return nil, status.Errorf(codes.Aborted, "%s", err)
	}
	defer rows.Close()

	hashed := utils.Hash(params.Password)
	var password string
	if rows.Next() {
		rows.Scan(&password)
	} else {
		return nil, status.Error(codes.NotFound, "Email/Password not match")
	}

	if password == hashed {
		return &p.Token{Token: "auth-token"}, nil
	} else {
		return nil, status.Error(codes.NotFound, "Email/Password not match")
	}
}

func (s UserServiceServer) Register(ctx context.Context, params *p.User) (*p.RegisterResult, error) {
	tx, err := db.BeginTx(db.BeginTxParams{Ctx: ctx, Opts: &sql.TxOptions{ReadOnly: false}})
	if err != nil {
		fmt.Println("Error Begining Transaction:", err)
		return nil, status.Errorf(codes.Aborted, "%s", err)
	}
	query := "INSERT INTO public.user(name, lastname, email, password) " +
		"VALUES ($1, $2, $3, $4)"

	params.Password = utils.Hash(params.Password)
	_, err = tx.Exec(query, params.Name, params.Lastname, params.Email, params.Password)
	if err != nil {
		fmt.Println("Error Querying:", err.Error())
		return nil, status.Errorf(codes.Aborted, "%s", err)
	}
	if err = tx.Commit(); err != nil {
		fmt.Println("Error Commiting:", err.Error())
		return nil, status.Errorf(codes.Aborted, "%s", err)
	}
	return &p.RegisterResult{Result: true}, nil
}
