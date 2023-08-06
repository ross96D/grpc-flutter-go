package controllers

import (
	"context"
	"errors"
	"fmt"
	db "grpc-flutter/backend/database"
	p "grpc-flutter/backend/generated/grpc"
	"grpc-flutter/backend/utils"
)

type UserServiceServer struct {
	p.UnimplementedUserServiceServer
}

func (s UserServiceServer) Login(ctx context.Context, params *p.LoginParams) (*p.User, error) {
	query := "SELECT password FROM user WHERE email = ?"
	rows, err := db.DB().QueryContext(ctx, query, params.Email)
	if err != nil {
		fmt.Println("Error:", err)
		return nil, errors.New("Authentication Error")
	}
	hashed := utils.Hash(params.Password)
	var user p.User
	rows.Scan(user.Id, user.Name, user.Lastname, user.Email, user.Password)
	if user.Password == hashed {
		return &user, nil
	} else {
		return nil, errors.New("Authentication Error")
	}
}
