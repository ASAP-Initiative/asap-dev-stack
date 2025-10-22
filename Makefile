# Makefile for ASAP Dev Stack linting and validation

.PHONY: help lint lint-dockerfiles lint-compose install-linters clean

# Default target - show help
help:
	@echo "Available targets:"
	@echo "  make lint             - Run all linters (Dockerfiles and docker-compose)"
	@echo "  make lint-dockerfiles - Lint all Dockerfiles"
	@echo "  make lint-compose     - Lint docker-compose.yml"
	@echo "  make install-linters  - Install required linting tools"
	@echo "  make clean            - Clean temporary files"

# Install linting tools
install-linters:
	@echo "Installing linting tools..."
	@command -v hadolint >/dev/null 2>&1 || { \
		echo "Installing hadolint..."; \
		wget -qO /tmp/hadolint https://github.com/hadolint/hadolint/releases/latest/download/hadolint-Linux-x86_64 && \
		chmod +x /tmp/hadolint && \
		sudo mv /tmp/hadolint /usr/local/bin/hadolint; \
	}
	@command -v yamllint >/dev/null 2>&1 || { \
		echo "Installing yamllint..."; \
		pip install --user yamllint; \
	}
	@echo "Linting tools installed successfully!"

# Lint all Dockerfiles
lint-dockerfiles:
	@echo "Linting Dockerfiles..."
	@hadolint -c .hadolint.yaml asap-cli/Dockerfile
	@hadolint -c .hadolint.yaml os/debian/Dockerfile.debian11
	@hadolint -c .hadolint.yaml os/debian/Dockerfile.debian12
	@hadolint -c .hadolint.yaml os/debian/Dockerfile.debian13
	@hadolint -c .hadolint.yaml os/fedora/Dockerfile.fedora39
	@hadolint -c .hadolint.yaml os/fedora/Dockerfile.fedora40
	@hadolint -c .hadolint.yaml os/fedora/Dockerfile.fedora41
	@hadolint -c .hadolint.yaml os/fedora/Dockerfile.fedora42
	@hadolint -c .hadolint.yaml os/ubuntu/Dockerfile.ubuntu1804
	@hadolint -c .hadolint.yaml os/ubuntu/Dockerfile.ubuntu2004
	@hadolint -c .hadolint.yaml os/ubuntu/Dockerfile.ubuntu2204
	@hadolint -c .hadolint.yaml os/ubuntu/Dockerfile.ubuntu2404
	@echo "All Dockerfiles passed linting!"

# Lint docker-compose.yml
lint-compose:
	@echo "Linting docker-compose.yml..."
	@yamllint -c .yamllint.yaml docker-compose.yml
	@echo "docker-compose.yml passed linting!"

# Run all linters
lint: lint-dockerfiles lint-compose
	@echo "All linting checks passed!"

# Clean temporary files
clean:
	@echo "Cleaning temporary files..."
	@find . -type f -name "*.pyc" -delete
	@find . -type d -name "__pycache__" -delete
	@echo "Clean complete!"
