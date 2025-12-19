.PHONY: build run clean

# Build the docker image
build:
	docker compose build

# Run the container
run:
	docker compose up

# Remove images and containers
clean:
	docker compose down --rmi all

rebuild:
	@$(MAKE) clean
	@$(MAKE) build
	@$(MAKE) run