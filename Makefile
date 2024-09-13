# Variables
VENV = .venv
PYTHON = $(VENV)/bin/python
PIP = $(VENV)/bin/pip
UVICORN = $(VENV)/bin/uvicorn

ifeq ($(shell uname), Darwin)  # Detect macOS (Darwin)
    ifeq ($(shell test -d $(VENV)/bin && echo exists),)
        PYTHON = $(VENV)/Scripts/python
        PIP = $(VENV)/Scripts/pip
        UVICORN = $(VENV)/Scripts/uvicorn
    endif
endif

# Targets
.PHONY: help setup install run lint test clean

help:
	@echo "Available commands:"
	@echo "  make setup       Create virtual environment and install dependencies"
	@echo "  make install     Install dependencies from requirements.txt"
	@echo "  make run         Run the FastAPI application"
	@echo "  make lint        Run code linting (flake8)"
	@echo "  make test        Run tests (pytest)"
	@echo "  make clean       Clean up the project"

# Create virtual environment and install dependencies
setup:
	python3 -m venv $(VENV)
	$(PIP) install -r requirements.txt

# Install dependencies
install:
	$(PIP) install -r requirements.txt

# Run the FastAPI application
run:
	$(UVICORN) app.main:app --reload

# Lint the codebase using flake8
lint:
	$(VENV)/bin/flake8 app

# Run tests using pytest
test:
	$(VENV)/bin/pytest

# Clean the project (remove virtual environment and pyc files)
clean:
	rm -rf $(VENV)
	find . -name "*.pyc" -delete
	find . -name "__pycache__" -delete
