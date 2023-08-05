package main

import (
	"fmt"
	"net"

	_ "github.com/lib/pq"

	c "grpc-flutter/backend/controllers"
	db "grpc-flutter/backend/database"
	p "grpc-flutter/backend/generated/grpc"

	"google.golang.org/grpc"
)

func main() {
	db.Connect()
	defer db.DB.Close()

	port := 8080
	listen, err := net.Listen("tcp", fmt.Sprintf("localhost:%d", port))
	if err != nil {
		fmt.Println("failed to listen:", err)
		return
	}

	var opts []grpc.ServerOption
	server := grpc.NewServer(opts...)
	p.RegisterBookServiceServer(server, c.BookServiceServer{})

	fmt.Println("gRPC server listen on port:", port)
	if er := server.Serve(listen); er != nil {
		print("error on grpc server:", err)
	}
}
