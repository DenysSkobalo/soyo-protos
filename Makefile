GEN_FILES := gen/go/soyo/soyo.pb.go gen/go/soyo/soyo_grpc.pb.go
PROTO_FILES := $(wildcard proto/*.proto)

.PHONY: generate

generate: $(GEN_FILES)

$(GEN_FILES): $(PROTO_FILES)
	protoc -I proto proto/*.proto \
		--go_out=./gen/go \
		--go_opt=paths=source_relative \
		--go-grpc_out=./gen/go \
		--go-grpc_opt=paths=source_relative