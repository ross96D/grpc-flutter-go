protoc --go_out=backend/generated/grpc \
    --go-grpc_out=backend/generated/grpc \
    --go-grpc_opt=paths=source_relative  \
    --go_opt=paths=source_relative \
    protos/*.proto

protoc --dart_out=grpc:frontend/lib/src/generated protos/*.proto