# Run with docker
docker run -ti --rm --name golang -p 8000:8000 -v $PWD:/d -w /d golang:alpine sh

go run FILE.go

godoc fmt Println # Show documentation
