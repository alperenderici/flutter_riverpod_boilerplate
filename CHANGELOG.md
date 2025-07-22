# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- Responsive design system with breakpoint-based layouts
- AppText widget system for consistent typography
- Context extensions for responsive spacing and theming
- Comprehensive responsive utilities

### Changed
- Updated to support iOS and Android platforms only
- Removed web, desktop, macOS, Linux, and Windows platform support
- Updated .gitignore to exclude removed platforms
- Improved theme system with Material 3 design
- Enhanced error handling and user experience

### Fixed
- Theme provider naming conflicts resolved
- Deprecated API usage updated to latest Flutter standards
- Build configuration issues resolved
- Font loading issues fixed by using Google Fonts

### Removed
- Web platform support and related files
- Desktop platform support (Windows, macOS, Linux)
- Local font files (now using Google Fonts)

## [1.0.0] - 2024-01-XX

### Added
- Initial project setup with Flutter Riverpod boilerplate
- Clean Architecture implementation
- Riverpod state management with code generation
- Authentication feature with mock service
- Material 3 theming system
- Local storage with Hive and SharedPreferences
- Network layer with Dio HTTP client
- Comprehensive testing setup
- CI/CD pipeline with GitHub Actions
- Code quality tools (linting, formatting, analysis)
- Internationalization support
- Error handling and logging
- Dependency injection system
- Router configuration with GoRouter

### Features
- **Authentication**: Complete auth flow with login/signup
- **State Management**: Type-safe Riverpod providers
- **Storage**: Local data persistence
- **Networking**: HTTP client with interceptors
- **Testing**: Unit, widget, and integration tests
- **Theming**: Dark/light theme support
- **Navigation**: Declarative routing
- **Code Generation**: Automated code generation for models and providers

### Technical Details
- Flutter SDK: >=3.19.0
- Dart SDK: >=3.3.0
- Clean Architecture with feature-first structure
- MVVM pattern implementation
- Repository pattern for data abstraction
- Use case pattern for business logic
- Provider pattern for dependency injection

---

## Version History

- **v1.0.0**: Initial release with full boilerplate setup
- **v1.1.0**: Added responsive design system and mobile-first approach

## Migration Guide

### From v1.0.0 to v1.1.0

If you're upgrading from the previous version:

1. **Platform Support**: This version only supports iOS and Android. Remove any web/desktop specific code.

2. **Responsive Design**: Update your UI components to use the new responsive system:
   ```dart
   // Old
   Padding(padding: EdgeInsets.all(16))
   
   // New
   Padding(padding: context.responsivePadding)
   ```

3. **Text Widgets**: Replace Text widgets with AppTextStyles:
   ```dart
   // Old
   Text('Hello', style: Theme.of(context).textTheme.headlineMedium)
   
   // New
   AppTextStyles.headlineMedium('Hello')
   ```

4. **Theme Provider**: Update theme provider references:
   ```dart
   // Old
   ref.watch(themeModeProvider)
   
   // New
   ref.watch(appThemeModeProvider)
   ```

## Contributing

When contributing to this project, please:

1. Update this CHANGELOG.md file with your changes
2. Follow the [Keep a Changelog](https://keepachangelog.com/en/1.0.0/) format
3. Add entries under the "Unreleased" section
4. Move entries to a new version section when releasing

### Categories

- **Added** for new features
- **Changed** for changes in existing functionality
- **Deprecated** for soon-to-be removed features
- **Removed** for now removed features
- **Fixed** for any bug fixes
- **Security** for vulnerability fixes
