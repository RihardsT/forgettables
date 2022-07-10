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



### Install - a copy from the site
# Get the latest from https://go.dev/
wget https://go.dev/dl/go1.18.3.linux-amd64.tar.gz

sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.18.3.linux-amd64.tar.gz
echo 'export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin' >> ~/.bashrc
# New terminal session
go version
