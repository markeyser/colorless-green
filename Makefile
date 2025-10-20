SHELL := /bin/bash
.ONESHELL:
.DEFAULT_GOAL=help

#-----------------------------------------------------------------------
# Create docs
#-----------------------------------------------------------------------
docs_new: # Create a new project
	@mkdocs new {{cookiecutter.project_slug}}

docs_serve: # Start the live-reloading docs server
	@mkdocs serve

docs_serve_alt_port: # Start the live-reloading docs server on an alternative port (macOS)
	@mkdocs serve --dev-addr=127.0.0.1:8001

docs_kill_port: # Kill the process occupying port 8000 (macOS)
	@lsof -ti :8000 | xargs kill -9

docs_build: # Build the documentation site
	@mkdocs build

docs_deploy: # Deploy Your Documentation to GitHub
	@mkdocs gh-deploy

#-----------------------------------------------------------------------
# Help
#-----------------------------------------------------------------------
help: # Show this help
	@egrep -h '\s#\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?# "}; \
	{printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
