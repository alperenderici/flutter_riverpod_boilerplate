# Flutter Riverpod Boilerplate Makefile
# Provides convenient commands for development workflow

.PHONY: help clean get build test analyze format check generate run-dev run-staging run-prod run-dev-release run-staging-release run-prod-release

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
	@echo "  make run-dev      - Run app in development flavor (debug)"
	@echo "  make run-staging  - Run app in staging flavor (debug)"
	@echo "  make run-prod     - Run app in production flavor (debug)"
	@echo "  make run-dev-release      - Run app in development flavor (release)"
	@echo "  make run-staging-release  - Run app in staging flavor (release)"
	@echo "  make run-prod-release     - Run app in production flavor (release)"
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
	@echo "  make build-android         - Build Android APK (production)"
	@echo "  make build-android-dev     - Build Android APK (development)"
	@echo "  make build-android-staging - Build Android APK (staging)"
	@echo "  make build-ios             - Build iOS app (production)"
	@echo "  make build-ios-dev         - Build iOS app (development)"
	@echo "  make build-ios-staging     - Build iOS app (staging)"
	@echo "  make build-web             - Build web app (production)"
	@echo "  make build-web-dev         - Build web app (development)"
	@echo "  make build-web-staging     - Build web app (staging)"
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

# Development - Flavor-specific run commands
run-dev:
	flutter run --debug --target lib/main_development.dart --flavor development

run-staging:
	flutter run --debug --target lib/main_staging.dart --flavor staging

run-prod:
	flutter run --debug --target lib/main_production.dart --flavor production

run-dev-release:
	flutter run --release --target lib/main_development.dart --flavor development

run-staging-release:
	flutter run --release --target lib/main_staging.dart --flavor staging

run-prod-release:
	flutter run --release --target lib/main_production.dart --flavor production

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

# Build - Flavor-specific build commands
build-android:
	flutter build apk --release --target lib/main_production.dart --flavor production

build-android-dev:
	flutter build apk --release --target lib/main_development.dart --flavor development

build-android-staging:
	flutter build apk --release --target lib/main_staging.dart --flavor staging

build-android-bundle:
	flutter build appbundle --release --target lib/main_production.dart --flavor production

build-android-bundle-dev:
	flutter build appbundle --release --target lib/main_development.dart --flavor development

build-android-bundle-staging:
	flutter build appbundle --release --target lib/main_staging.dart --flavor staging

build-ios:
	flutter build ios --release --target lib/main_production.dart --flavor production

build-ios-dev:
	flutter build ios --release --target lib/main_development.dart --flavor development

build-ios-staging:
	flutter build ios --release --target lib/main_staging.dart --flavor staging

build-web:
	flutter build web --release --target lib/main_production.dart

build-web-dev:
	flutter build web --release --target lib/main_development.dart

build-web-staging:
	flutter build web --release --target lib/main_staging.dart

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
