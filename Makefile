SHELL := /bin/bash
.ONESHELL:
.DEFAULT_GOAL=help

# ==============================================================================
# DOCS MANAGEMENT (MkDocs)
# ==============================================================================

docs-serve: # Start the live-reloading docs server on port 8000
	@echo "Starting live-reloading docs server at http://127.0.0.1:8000"
	@poetry run mkdocs serve

docs-serve-alt: # Start the live-reloading docs server on an alternative port (8001)
	@echo "Starting live-reloading docs server at http://127.0.0.1:8001"
	@poetry run mkdocs serve --dev-addr=127.0.0.1:8001

docs-kill: # Kill the process occupying port 8000 (macOS/Linux)
	@echo "Attempting to kill any process on port 8000..."
	@lsof -ti :8000 | xargs kill -9 || echo "No process found on port 8000."

docs-build: # Build the static documentation site to the 'site' directory
	@echo "Building the documentation site..."
	@poetry run mkdocs build

# Note: Automatic deployment is now handled by GitHub Actions.
# The `mkdocs gh-deploy` command is generally not needed for this workflow.

# ==============================================================================
# CODE QUALITY (pre-commit)
# ==============================================================================

lint-install: # Install the pre-commit hooks into your .git/ directory
	@echo "Installing pre-commit hooks..."
	@poetry run pre-commit install

lint-run-all: # Run all pre-commit hooks on every file in the repository
	@echo "Running all pre-commit hooks on all files..."
	@poetry run pre-commit run --all-files

lint-run-staged: # Run pre-commit hooks on staged files (same as what runs on commit)
	@echo "Running pre-commit hooks on staged files..."
	@poetry run pre-commit run

lint-update: # Update all pre-commit hooks to their latest versions
	@echo "Updating pre-commit hook versions..."
	@poetry run pre-commit autoupdate

# ==============================================================================
# ENVIRONMENT
# ==============================================================================

env-use: # Recreate Poetry virtualenv using the current pyenv interpreter
	@echo "Pointing Poetry at $(shell pyenv which python)"
	@poetry env use "$(shell pyenv which python)"

# ==============================================================================
# HELP
# ==============================================================================

help: # Show this help
	@echo "Available commands:"
	@egrep -h '\s#\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?# "}; \
	{printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2}'
