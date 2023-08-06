package main

import (
	"context"
	"fmt"
	"net"
	"strings"

	_ "github.com/lib/pq"

	c "grpc-flutter/backend/controllers"
	db "grpc-flutter/backend/database"
	p "grpc-flutter/backend/generated/grpc"

	"google.golang.org/grpc"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/metadata"
	"google.golang.org/grpc/status"
)

var (
	errMissingMetadata = status.Errorf(codes.InvalidArgument, "missing metadata")
	errInvalidToken    = status.Errorf(codes.Unauthenticated, "invalid token")
)

func main() {
	db.Connect()
	defer db.DB().Close()

	port := 8080
	listen, err := net.Listen("tcp", fmt.Sprintf("localhost:%d", port))
	if err != nil {
		fmt.Println("failed to listen:", err)
		return
	}
	opts := []grpc.ServerOption{
		grpc.UnaryInterceptor(ensureValidTokenUnary),
		grpc.StreamInterceptor(ensureValidTokenStream),
	}
	server := grpc.NewServer(opts...)
	p.RegisterBookServiceServer(server, c.BookServiceServer{})
	p.RegisterUserServiceServer(server, c.UserServiceServer{})

	fmt.Println("gRPC server listen on port:", port)
	if er := server.Serve(listen); er != nil {
		print("error on grpc server:", err)
	}
}

func ensureValidTokenUnary(ctx context.Context, req interface{}, info *grpc.UnaryServerInfo, handler grpc.UnaryHandler) (interface{}, error) {
	fmt.Println("RPC CALL:", info.FullMethod)
	if strings.Contains(info.FullMethod, "Login") {
		return handler(ctx, req)
	}
	if strings.Contains(info.FullMethod, "Register") {
		return handler(ctx, req)
	}

	md, ok := metadata.FromIncomingContext(ctx)
	if !ok {
		return nil, errMissingMetadata
	}
	// The keys within metadata.MD are normalized to lowercase.
	// See: https://godoc.org/google.golang.org/grpc/metadata#New
	if !valid(md["authorization"]) {
		return nil, errInvalidToken
	}
	// Continue execution of handler after ensuring a valid token.
	return handler(ctx, req)
}

func ensureValidTokenStream(srv interface{}, ss grpc.ServerStream, info *grpc.StreamServerInfo, handler grpc.StreamHandler) error {
	fmt.Println("RPC CALL:", info.FullMethod)
	if strings.Contains(info.FullMethod, "Login") {
		return handler(srv, ss)
	}
	if strings.Contains(info.FullMethod, "Register") {
		return handler(srv, ss)
	}

	md, ok := metadata.FromIncomingContext(ss.Context())
	if !ok {
		return errMissingMetadata
	}
	// The keys within metadata.MD are normalized to lowercase.
	// See: https://godoc.org/google.golang.org/grpc/metadata#New
	if !valid(md["authorization"]) {
		println("unauthorized")
		return errInvalidToken
	}
	// Continue execution of handler after ensuring a valid token.
	return handler(srv, ss)
}

func valid(authorization []string) bool {
	if len(authorization) < 1 {
		return false
	}
	token := strings.TrimPrefix(authorization[0], "Bearer ")
	// Perform the token validation here. For the sake of this example, the code
	// here forgoes any of the usual OAuth2 token validation and instead checks
	// for a token matching an arbitrary string.
	return token == "auth-token"
}
