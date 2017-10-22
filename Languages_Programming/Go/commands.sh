# Run with docker
docker run -ti --rm --name golang -v $PWD:/d -w /d golang:alpine sh

go run FILE.go
