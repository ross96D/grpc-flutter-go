package main

import (
	"context"
	"fmt"
	"net"

	// "net"
	p "grpc-flutter/backend/generated/grpc/protos"

	"google.golang.org/grpc"
)

func main() {
	port := 8080
	listen, err := net.Listen("tcp", fmt.Sprintf("localhost:%d", port))
	if err != nil {
		fmt.Println("failed to listen:", err)
		return
	}
	var opts []grpc.ServerOption

	server := grpc.NewServer(opts...)
	p.RegisterBookServiceServer(server, bookServiceServer{})
	fmt.Println("gRPC server listen on port:", port)
	if er := server.Serve(listen); er != nil {
		print("error on grpc server:", err)
	}

}

type bookServiceServer struct {
	p.UnimplementedBookServiceServer
}

func (bookServiceServer) GetAllBooks(params *p.GetAllBooksParams, w p.BookService_GetAllBooksServer) error {
	for i := 0; i < 10; i++ {

		if err := w.Send(&p.Book{
			Id:       int32(i),
			Author:   "Ross" + fmt.Sprint(i),
			CoverUrl: "NO TIENE",
		}); err != nil {
			print("ERROR JUST HAPPENS:", err)
			return err
		}
	}
	return nil
}

func (bookServiceServer) GetBook(ctx context.Context, params *p.GetBookParams) (*p.Book, error) {
	return &p.Book{Id: 1, Author: "ASA"}, nil
}

func (bookServiceServer) SearchBooks(params *p.SearchBooksParams, w p.BookService_SearchBooksServer) error {
	for i := 0; i < 10; i++ {
		if err := w.Send(&p.Book{
			Id:       int32(i),
			Author:   "SRoss" + fmt.Sprint(i),
			CoverUrl: "NO TIENE",
		}); err != nil {
			return err
		}
	}
	return nil
}
