# Variables
APP_NAME := inventory_service
DOCKER_IMAGE := $(APP_NAME):latest

# Run all tests
test:
    @echo "Running tests..."
    go test ./... -v

# Run linters
lint:
    @echo "Running linters..."
    golangci-lint run ./...

# Build binary
build:
    @echo "Building binary..."
    go build -o $(APP_NAME) ./cmd/$(APP_NAME)/

# Run the service locally
run:
    @echo "Starting the service..."
    go run ./cmd/$(APP_NAME)/

# Build Docker image
docker-build:
    @echo "Building Docker image..."
    docker build -t $(DOCKER_IMAGE) .

# Run Docker container
docker-run:
    @echo "Running Docker container..."
    docker run -p 8080:8080 $(DOCKER_IMAGE)

# Clean up
clean:
    @echo "Cleaning up..."
    rm -f $(APP_NAME)
    docker rmi $(DOCKER_IMAGE)

# Run all steps
all: lint test build docker-build
