# flutter_riverpod_boilerplate

Fast start to a new Flutter project.

## Getting Started

# 🚀 Flutter Riverpod Boilerplate

A comprehensive, production-ready Flutter boilerplate featuring **Clean Architecture**, **Riverpod** state management, and modern development practices. This template provides a solid foundation for building scalable Flutter applications with industry best practices.

## ✨ Features

### 🏗️ Architecture
- **MVVM + Clean Architecture** with clear separation of concerns
- **Feature-first folder structure** for better organization
- **Domain Driven Design (DDD)** principles
- **Repository pattern** for data abstraction
- **Dependency Injection** with Riverpod

### 🔄 State Management
- **Flutter Riverpod** for reactive state management
- **Hooks Riverpod** for enhanced widget lifecycle
- **@riverpod** code generation for type-safe providers
- **Async state handling** with proper loading/error states

### 🛠️ Code Generation
- **Freezed** for immutable data classes
- **JSON Serializable** for API models
- **Build Runner** for automated code generation
- **Riverpod Generator** for provider generation

### 🧭 Routing
- **GoRouter** for declarative routing (default)
- **AutoRoute** support with feature toggle
- **Type-safe navigation** with route parameters
- **Nested routing** and route guards

### 💾 Backend & Storage
- **Supabase** integration (configurable)
- **Firebase** support (configurable)
- **Hive** for local database
- **SharedPreferences** for simple storage
- **Abstract repository pattern** for easy backend switching

### 🌐 Networking
- **Dio** HTTP client with interceptors
- **Pretty logging** for development
- **Error handling** and retry mechanisms
- **Request/Response transformation**

### 🎨 Theming & Localization
- **Material Design 3** theming
- **Light/Dark mode** support
- **Custom color schemes** and typography
- **Multi-language support** with ARB files
- **Responsive design** utilities

### 🧪 Testing
- **Unit tests** with comprehensive examples
- **Widget tests** for UI components
- **Integration tests** for complete flows
- **Mocking** with Mocktail
- **Test coverage** reporting

### 🔧 Development Tools
- **Very Good Analysis** for strict linting
- **Pre-commit hooks** for code quality
- **Makefile** for common tasks
- **GitHub Actions** CI/CD (optional)
- **Puro** version management support

## 🎯 Flavors

This project supports multiple flavors to manage different environments:

### Available Flavors

| Flavor | Description | App Name | Bundle ID | API Endpoint |
|--------|-------------|----------|-----------|--------------|
| **development** | Local development with debug features | Flutter Riverpod Boilerplate (Dev) | `com.example.flutter_riverpod_boilerplate.dev` | `https://dev-api.example.com` |
| **staging** | Testing environment with production-like settings | Flutter Riverpod Boilerplate (Staging) | `com.example.flutter_riverpod_boilerplate.staging` | `https://staging-api.example.com` |
| **production** | Production release build | Flutter Riverpod Boilerplate | `com.example.flutter_riverpod_boilerplate` | `https://api.example.com` |

### Running Different Flavors

```bash
# Development (default)
make run-dev
flutter run --flavor development --target lib/main_development.dart

# Staging
make run-staging
flutter run --flavor staging --target lib/main_staging.dart

# Production
make run-prod
flutter run --flavor production --target lib/main_production.dart
```

### Flavor Configuration

Each flavor has its own configuration defined in `lib/core/constants/flavor_config.dart`:

- **App Name**: Different app names for easy identification
- **Bundle ID**: Unique bundle identifiers for each flavor
- **API Endpoints**: Different backend URLs for each environment
- **Debug Features**: Development flavor has additional debugging tools
- **Logging**: Different logging levels per flavor

### Default Flavor

When no flavor is specified, the app defaults to the **development** flavor for easier development workflow.

📖 **For detailed flavor documentation, see [docs/FLAVORS.md](docs/FLAVORS.md)**

## 📁 Project Structure

```
lib/
├── core/                          # Core functionality
│   ├── constants/                 # App constants and configuration
│   ├── di/                       # Dependency injection setup
│   ├── errors/                   # Error handling and exceptions
│   ├── network/                  # HTTP client and networking
│   ├── router/                   # App routing configuration
│   ├── storage/                  # Storage services and abstractions
│   ├── theme/                    # App theming and styling
│   └── utils/                    # Utility functions and helpers
├── features/                     # Feature modules
│   └── auth/                     # Authentication feature example
│       ├── data/                 # Data layer (repositories, models, datasources)
│       ├── domain/               # Domain layer (entities, usecases, repositories)
│       └── presentation/         # Presentation layer (pages, providers, widgets)
├── l10n/                        # Localization files
├── shared/                      # Shared widgets and utilities
│   ├── extensions/              # Dart extensions
│   ├── validators/              # Form validators
│   └── widgets/                 # Reusable widgets
└── main.dart                    # App entry point

test/
├── unit/                        # Unit tests
├── widget/                      # Widget tests
└── integration/                 # Integration tests
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (>=3.24.0)
- Dart SDK (>=3.8.1)
- IDE with Flutter support (VS Code, Android Studio, IntelliJ)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/flutter_riverpod_boilerplate.git
   cd flutter_riverpod_boilerplate
   ```

2. **Install dependencies**
   ```bash
   make get
   # or
   flutter pub get
   ```

3. **Generate code**
   ```bash
   make generate
   # or
   flutter packages pub run build_runner build --delete-conflicting-outputs
   ```

4. **Run the app**
   ```bash
   # Development flavor
   make run-dev
   # or
   flutter run --flavor development --target lib/main_development.dart

   # Staging flavor
   make run-staging
   # or
   flutter run --flavor staging --target lib/main_staging.dart

   # Production flavor
   make run-prod
   # or
   flutter run --flavor production --target lib/main_production.dart
   ```

## ⚙️ Configuration

### Flavors

This boilerplate supports three flavors for different environments:

- **Development** (`development`): For local development with debug features enabled
- **Staging** (`staging`): For testing with production-like settings
- **Production** (`production`): For release builds with optimized settings

Each flavor has its own:
- App name and bundle identifier
- API endpoints
- Feature flags and debug settings
- Build configurations

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

### Backend Configuration

#### Supabase Setup
1. Create a Supabase project at [supabase.com](https://supabase.com)
2. Update `lib/core/storage/supabase_service.dart` with your credentials:
   ```dart
   await sb.Supabase.initialize(
     url: 'YOUR_SUPABASE_URL',
     anonKey: 'YOUR_SUPABASE_ANON_KEY',
   );
   ```

#### Firebase Setup
1. Create a Firebase project at [console.firebase.google.com](https://console.firebase.google.com)
2. Follow the [FlutterFire setup guide](https://firebase.flutter.dev/docs/overview)
3. Enable the `firebase` feature toggle in `pubspec.yaml`

### Environment Variables

Set environment variables for feature toggles:

```bash
export AUTO_ROUTE=false
export FIREBASE=false
export SUPABASE=true
export LOCALIZATION=true
export DIO_LOGGING=true
```

## 🛠️ Development Workflow

### Available Commands

```bash
# Setup & Dependencies
make get              # Get dependencies
make clean            # Clean build files
make generate         # Run code generation
make generate-watch   # Watch for changes and generate

# Development
make run-dev          # Run in debug mode
make run-prod         # Run in release mode
make format           # Format code
make analyze          # Analyze code
make check            # Format + analyze

# Testing
make test             # Run all tests
make test-unit        # Run unit tests
make test-widget      # Run widget tests
make test-integration # Run integration tests
make test-coverage    # Run tests with coverage

# Build
make build-android    # Build Android APK
make build-ios        # Build iOS app
make build-web        # Build web app
```

### Code Generation

This project uses code generation for:
- **Freezed** classes (`.freezed.dart`)
- **JSON serialization** (`.g.dart`)
- **Riverpod providers** (`.g.dart`)
- **AutoRoute** routes (`.gr.dart`)

Run generation after making changes:
```bash
make generate
```

For continuous generation during development:
```bash
make generate-watch
```

## 🏗️ Adding New Features

### 1. Create Feature Structure

```bash
mkdir -p lib/features/your_feature/{data,domain,presentation}
mkdir -p lib/features/your_feature/data/{datasources,models,repositories}
mkdir -p lib/features/your_feature/domain/{entities,repositories,usecases}
mkdir -p lib/features/your_feature/presentation/{pages,providers,widgets}
```

### 2. Follow the Pattern

Use the `auth` feature as a reference:

1. **Domain Layer**: Define entities, repository interfaces, and use cases
2. **Data Layer**: Implement repositories, models, and data sources
3. **Presentation Layer**: Create pages, providers, and widgets

### 3. Register Dependencies

Add your providers to the appropriate files and ensure proper dependency injection.

## 🧪 Testing Strategy

### Unit Tests
- Test business logic and use cases
- Mock external dependencies
- Focus on edge cases and error handling

### Widget Tests
- Test UI components in isolation
- Verify user interactions
- Test different states (loading, error, success)

### Integration Tests
- Test complete user flows
- Verify navigation and state changes
- Test with real or mock backends

### Example Test Structure

```dart
// Unit Test
group('SignInUseCase', () {
  late SignInUseCase useCase;
  late MockAuthRepository mockRepository;

  setUp(() {
    mockRepository = MockAuthRepository();
    useCase = SignInUseCase(mockRepository);
  });

  test('should return user when credentials are valid', () async {
    // Arrange, Act, Assert
  });
});
```

## 🎨 Theming Guide

### Custom Colors

Modify `lib/core/theme/app_colors.dart`:

```dart
static const Color primaryColor = Color(0xFF6366F1);
static const Color secondaryColor = Color(0xFF10B981);
```

### Typography

Update `lib/core/theme/app_text_styles.dart`:

```dart
static const TextStyle headlineLarge = TextStyle(
  fontFamily: fontFamily,
  fontSize: 32,
  fontWeight: FontWeight.w400,
);
```

### Theme Switching

The app supports automatic theme switching based on:
- User preference (stored in local storage)
- System theme (when set to system mode)

## 🌍 Localization

### Adding New Languages

1. Create new ARB file: `lib/l10n/app_[locale].arb`
2. Add translations following the existing pattern
3. Update supported locales in `main.dart`

### Using Translations

```dart
// In widgets
Text(context.l10n.welcome)

// With parameters
Text(context.l10n.passwordTooShort(8))
```

## 🔧 Customization

### Backend Services

Switch between backends by updating feature toggles:

```yaml
flutter_riverpod_boilerplate:
  features:
    firebase: true     # Enable Firebase
    supabase: false    # Disable Supabase
```

### Routing

Switch between GoRouter and AutoRoute:

```yaml
flutter_riverpod_boilerplate:
  features:
    auto_route: true   # Use AutoRoute
```

### Network Logging

Control network request logging:

```yaml
flutter_riverpod_boilerplate:
  features:
    dio_logging: false # Disable in production
```

## 📱 Platform Support

This boilerplate supports:
- ✅ **Android** (API 21+)
- ✅ **iOS** (iOS 12+)
- ✅ **Web** (Chrome, Firefox, Safari, Edge)
- ✅ **macOS** (macOS 10.14+)
- ✅ **Windows** (Windows 10+)
- ✅ **Linux** (Ubuntu 18.04+)

## 🚀 Deployment

### Android

Build APKs for different flavors:
```bash
# Development
make build-android-dev
# or
flutter build apk --flavor development --target lib/main_development.dart

# Staging
make build-android-staging
# or
flutter build apk --flavor staging --target lib/main_staging.dart

# Production
make build-android        # Default production build
# or
flutter build apk --flavor production --target lib/main_production.dart
```

Build App Bundles (recommended for Play Store):
```bash
# Development
make build-android-bundle-dev

# Staging
make build-android-bundle-staging

# Production
make build-android-bundle
```

### iOS

Build for different flavors:
```bash
# Development
make build-ios-dev
# or
flutter build ios --flavor development --target lib/main_development.dart

# Staging
make build-ios-staging
# or
flutter build ios --flavor staging --target lib/main_staging.dart

# Production
make build-ios           # Default production build
# or
flutter build ios --flavor production --target lib/main_production.dart
```

**Note**: For iOS flavors to work properly, you need to configure Xcode schemes. Run the configuration script:
```bash
./scripts/configure_ios_flavors.sh
```

### Web

Build for different flavors:
```bash
# Development
make build-web-dev

# Staging
make build-web-staging

# Production
make build-web           # Default production build
```

## 🤝 Contributing

We welcome contributions! Please follow these guidelines:

### Development Setup

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/amazing-feature`
3. Install dependencies: `make get`
4. Run code generation: `make generate`
5. Make your changes
6. Run tests: `make test`
7. Run quality checks: `make check`
8. Commit your changes: `git commit -m 'Add amazing feature'`
9. Push to the branch: `git push origin feature/amazing-feature`
10. Open a Pull Request

### Code Style

- Follow the [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style)
- Use the provided linting rules
- Write tests for new features
- Document public APIs
- Use meaningful commit messages

### Pull Request Process

1. Ensure all tests pass
2. Update documentation if needed
3. Add tests for new functionality
4. Follow the existing code patterns
5. Request review from maintainers

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [Flutter](https://flutter.dev/) - The amazing UI toolkit
- [Riverpod](https://riverpod.dev/) - Reactive state management
- [Freezed](https://pub.dev/packages/freezed) - Code generation for data classes
- [GoRouter](https://pub.dev/packages/go_router) - Declarative routing
- [Very Good Analysis](https://pub.dev/packages/very_good_analysis) - Strict linting rules

## 📞 Support

- 📧 **Email**: alialperenderici@gmail.com
- 🐛 **Issues**: [GitHub Issues](https://github.com/yourusername/flutter_riverpod_boilerplate/issues)
- 💬 **Discussions**: [GitHub Discussions](https://github.com/yourusername/flutter_riverpod_boilerplate/discussions)
- 📖 **Documentation**: [Wiki](https://github.com/yourusername/flutter_riverpod_boilerplate/wiki)

---

**Happy Coding! 🎉**

Made with ❤️ by the Flutter community
