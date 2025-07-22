# Flutter Riverpod Boilerplate Makefile
# Provides convenient commands for development workflow

.PHONY: help clean get build test analyze format check generate run-dev run-prod

# Default target
help:
	@echo "Flutter Riverpod Boilerplate - Available Commands:"
	@echo ""
	@echo "Setup & Dependencies:"
	@echo "  make get          - Get dependencies"
	@echo "  make clean        - Clean build files"
	@echo "  make generate     - Run code generation"
	@echo ""
	@echo "Development:"
	@echo "  make run-dev      - Run app in debug mode"
	@echo "  make run-prod     - Run app in release mode"
	@echo "  make format       - Format code"
	@echo "  make analyze      - Analyze code"
	@echo "  make check        - Run format + analyze"
	@echo ""
	@echo "Testing:"
	@echo "  make test         - Run all tests"
	@echo "  make test-unit    - Run unit tests"
	@echo "  make test-widget  - Run widget tests"
	@echo "  make test-integration - Run integration tests"
	@echo "  make test-coverage - Run tests with coverage"
	@echo ""
	@echo "Build:"
	@echo "  make build-android - Build Android APK"
	@echo "  make build-ios     - Build iOS app"
	@echo "  make build-web     - Build web app"
	@echo ""

# Setup & Dependencies
get:
	flutter pub get

clean:
	flutter clean
	flutter pub get

generate:
	flutter packages pub run build_runner build --delete-conflicting-outputs

generate-watch:
	flutter packages pub run build_runner watch --delete-conflicting-outputs

# Development
run-dev:
	flutter run --debug

run-prod:
	flutter run --release

format:
	dart format lib/ test/ --set-exit-if-changed

analyze:
	flutter analyze

check: format analyze

# Testing
test:
	flutter test

test-unit:
	flutter test test/unit/

test-widget:
	flutter test test/widget/

test-integration:
	flutter test integration_test/

test-coverage:
	flutter test --coverage
	genhtml coverage/lcov.info -o coverage/html

# Build
build-android:
	flutter build apk --release

build-android-bundle:
	flutter build appbundle --release

build-ios:
	flutter build ios --release

build-web:
	flutter build web --release

# Utilities
upgrade:
	flutter pub upgrade

outdated:
	flutter pub outdated

doctor:
	flutter doctor

# Git hooks setup
setup-hooks:
	cp scripts/pre-commit .git/hooks/pre-commit
	chmod +x .git/hooks/pre-commit

# Full setup for new developers
setup: clean get generate check test
	@echo "Setup complete! Run 'make run-dev' to start development."
