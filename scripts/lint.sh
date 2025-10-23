#!/bin/sh
set -e

# Resolve path relative to this script's directory
SCRIPT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P)"
COMPOSE_FILE="$SCRIPT_DIR/../docker-compose.yml"
HADOLINT_CONFIG_FILE="$SCRIPT_DIR/hadolint.yaml"

# Lint the docker-compose.yml file
docker compose -f "$COMPOSE_FILE" config --quiet
echo "docker-compose.yml linting passed."

# Foreach Dockerfile in the os/ directory, run hadolint
DOCKERFILES=$(find "$SCRIPT_DIR"/../os/ -name Dockerfile*)
for DOCKERFILE in $DOCKERFILES; do
    echo "Linting $DOCKERFILE ..."
    if [ -f "$DOCKERFILE" ]; then
        docker run --rm -i -v "$HADOLINT_CONFIG_FILE:/.config/hadolint.yaml:ro" hadolint/hadolint < "$DOCKERFILE"
        echo "Linted $DOCKERFILE successfully."
    else
        echo "No Dockerfile found at $DOCKERFILE, skipping."
    fi
done
