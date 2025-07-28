# Flutter Flavors Guide

This document explains how to use and configure flavors in the Flutter Riverpod Boilerplate project.

## Overview

Flavors allow you to create different versions of your app for different environments (development, staging, production) with different configurations, app names, bundle identifiers, and API endpoints.

## Available Flavors

### Development
- **Purpose**: Local development and debugging
- **App Name**: Flutter Riverpod Boilerplate (Dev)
- **Bundle ID**: `com.example.flutter_riverpod_boilerplate.dev`
- **API Endpoint**: `https://dev-api.example.com`
- **Features**: Debug features enabled, verbose logging, mock data

### Staging
- **Purpose**: Testing and QA environment
- **App Name**: Flutter Riverpod Boilerplate (Staging)
- **Bundle ID**: `com.example.flutter_riverpod_boilerplate.staging`
- **API Endpoint**: `https://staging-api.example.com`
- **Features**: Production-like settings, info logging, no debug features

### Production
- **Purpose**: Release builds for app stores
- **App Name**: Flutter Riverpod Boilerplate
- **Bundle ID**: `com.example.flutter_riverpod_boilerplate`
- **API Endpoint**: `https://api.example.com`
- **Features**: Optimized for performance, error-only logging, no debug features

## Running Flavors

### Using Make Commands (Recommended)

```bash
# Development
make run-dev

# Staging
make run-staging

# Production
make run-prod
```

### Using Flutter Commands

```bash
# Development
flutter run --flavor development --target lib/main_development.dart

# Staging
flutter run --flavor staging --target lib/main_staging.dart

# Production
flutter run --flavor production --target lib/main_production.dart
```

## Building Flavors

### Android

```bash
# APK builds
make build-android-dev      # Development APK
make build-android-staging  # Staging APK
make build-android          # Production APK

# App Bundle builds (recommended for Play Store)
make build-android-bundle-dev      # Development Bundle
make build-android-bundle-staging  # Staging Bundle
make build-android-bundle          # Production Bundle
```

### iOS

```bash
make build-ios-dev      # Development
make build-ios-staging  # Staging
make build-ios          # Production
```

**Note**: iOS flavors require additional Xcode configuration. Run the setup script:
```bash
./scripts/configure_ios_flavors.sh
```

### Web

```bash
make build-web-dev      # Development
make build-web-staging  # Staging
make build-web          # Production
```

## Flavor Configuration

### Main Entry Points

Each flavor has its own main entry point:
- `lib/main_development.dart` - Development flavor
- `lib/main_staging.dart` - Staging flavor
- `lib/main_production.dart` - Production flavor
- `lib/main.dart` - Default entry (falls back to development)

### Configuration Class

The `FlavorConfig` class in `lib/core/constants/flavor_config.dart` manages flavor-specific settings:

```dart
// Access current flavor
FlavorConfig.instance.flavor
FlavorConfig.instance.appName
FlavorConfig.instance.baseUrl
FlavorConfig.instance.bundleId

// Check current flavor
FlavorConfig.instance.isDevelopment
FlavorConfig.instance.isStaging
FlavorConfig.instance.isProduction

// Get additional config
FlavorConfig.instance.getConfig<bool>('enableMockData')
```

### App Constants

The `AppConstants` class automatically uses flavor-specific values:

```dart
AppConstants.appName        // Flavor-specific app name
AppConstants.baseUrl        // Flavor-specific API endpoint
AppConstants.bundleId       // Flavor-specific bundle ID
AppConstants.isDevelopment  // Boolean checks
AppConstants.isStaging
AppConstants.isProduction
```

## Customizing Flavors

### Adding New Configuration

To add new flavor-specific configuration:

1. Update `FlavorConfig.initializeForFlavor()` in `flavor_config.dart`
2. Add the new config to the `additionalConfig` map
3. Access it using `FlavorConfig.instance.getConfig<T>('key')`

### Modifying Existing Flavors

To modify flavor settings:

1. Edit the flavor initialization in `FlavorConfig.initializeForFlavor()`
2. Update API endpoints, app names, or feature flags as needed
3. Rebuild the app with the desired flavor

### Adding New Flavors

To add a new flavor (e.g., "beta"):

1. Add the new flavor to the `Flavor` enum in `flavor_config.dart`
2. Create a new case in `FlavorConfig.initializeForFlavor()`
3. Create a new main entry point: `lib/main_beta.dart`
4. Update Android `build.gradle.kts` to add the new product flavor
5. Create iOS configuration files and update Xcode schemes
6. Add new make commands to the `Makefile`

## Troubleshooting

### Common Issues

1. **Flavor not found error**: Ensure you're using the correct flavor name and target file
2. **iOS build issues**: Make sure Xcode schemes are properly configured
3. **Wrong configuration**: Check that `FlavorConfig` is initialized before use

### Debugging

To debug flavor issues:

1. Check current flavor: `print(FlavorConfig.instance.flavorName)`
2. Verify configuration: `print(FlavorConfig.instance.toString())`
3. Ensure proper initialization in main entry points

## Best Practices

1. **Always specify flavor**: Use flavor-specific commands instead of generic `flutter run`
2. **Test all flavors**: Ensure all flavors build and run correctly
3. **Environment-specific configs**: Keep sensitive data in environment variables
4. **Consistent naming**: Use consistent naming conventions across platforms
5. **Documentation**: Update this guide when adding new flavors or configurations
