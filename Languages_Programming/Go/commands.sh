# Run with docker
docker run -ti --rm --name golang -p 8000:8000 -v $PWD:/d -w /d golang:alpine sh
go run FILE.go # Run main file. Great for

godoc fmt Println # Show documentation
go fmt FILE.go # Check go formatting
gofmt -w main.go # Format the file

# Build
cd src/PROJECT_FOLDER
go build
./PROJECT_FOLDER # It will build executable with PROJECT_FOLDER name
