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


ENDPOINT = http://localhost:8000/generate
PROMPT = "Explain the importance of open source models."

test:
	curl -X POST $(ENDPOINT) \
		-H "Content-Type: application/json" \
		-d '{"prompt": $(PROMPT), "max_tokens": 100, "temperature": 0.7}'