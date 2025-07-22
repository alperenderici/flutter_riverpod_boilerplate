# Flutter Riverpod Boilerplate - Setup Guide

## 🚀 Quick Start

This boilerplate is ready to use! Follow these steps to get started:

### 1. Install Dependencies

```bash
flutter pub get
```

### 2. Run Code Generation

```bash
dart run build_runner build --delete-conflicting-outputs
```

### 3. Run the App

```bash
flutter run
```

## 🔧 Configuration

### Backend Services

The boilerplate includes placeholder implementations for:

- **Mock Auth Service** (default) - For development and testing
- **Supabase** (optional) - Uncomment in pubspec.yaml and configure
- **Firebase** (optional) - Uncomment in pubspec.yaml and configure

### Feature Toggles

Configure features in `pubspec.yaml`:

```yaml
flutter_riverpod_boilerplate:
  features:
    auto_route: false    # Use AutoRoute instead of GoRouter
    firebase: false      # Enable Firebase services
    supabase: true       # Enable Supabase services
    localization: true   # Enable multi-language support
    dio_logging: true    # Enable network request logging
```

### Environment Variables

Set environment variables for feature toggles:

```bash
export AUTO_ROUTE=false
export FIREBASE=false
export SUPABASE=true
export LOCALIZATION=true
export DIO_LOGGING=true
```

## 🧪 Testing

Run tests with:

```bash
# All tests
flutter test

# Unit tests only
flutter test test/unit/

# Widget tests only
flutter test test/widget/

# Integration tests
flutter test integration_test/
```

## 🔨 Development Commands

Use the Makefile for common tasks:

```bash
make get              # Get dependencies
make generate         # Run code generation
make run-dev          # Run in debug mode
make test             # Run all tests
make analyze          # Analyze code
make format           # Format code
make check            # Format + analyze
```

## 📱 Demo Credentials

The mock auth service accepts these credentials:

- **Email**: test@example.com
- **Password**: password123

## 🚨 Known Issues

1. Some analysis warnings are expected in the boilerplate template
2. Backend services need configuration before use
3. Generated files may need regeneration after dependency updates

## 🔄 Next Steps

1. Configure your preferred backend service (Supabase/Firebase)
2. Update app branding and theme colors
3. Add your specific business logic
4. Configure CI/CD for your repository
5. Add proper error handling and logging

## 📚 Architecture Overview

```
lib/
├── core/                 # Core functionality
│   ├── constants/        # App constants
│   ├── di/              # Dependency injection
│   ├── errors/          # Error handling
│   ├── network/         # HTTP client
│   ├── router/          # App routing
│   ├── storage/         # Storage services
│   ├── theme/           # App theming
│   └── utils/           # Utilities
├── features/            # Feature modules
│   └── auth/           # Authentication feature
│       ├── data/       # Data layer
│       ├── domain/     # Domain layer
│       └── presentation/ # Presentation layer
├── l10n/               # Localization
├── shared/             # Shared components
└── main.dart           # App entry point
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Run tests and checks
5. Submit a pull request

Happy coding! 🎉
