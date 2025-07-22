# Troubleshooting Guide

This document contains solutions to common issues you might encounter while working with the Flutter Riverpod Boilerplate.

## Android Build Issues

### Issue: Gradle Plugin Error with Puro Flutter Manager

**Error Message:**
```
Failed to apply plugin 'dev.flutter.flutter-gradle-plugin'.
> /Users/username/.puro/envs/stable/flutter/bin/cache/engine.realm (No such file or directory)
```

**Cause:** This issue occurs when using Puro Flutter version manager and the Flutter cache is incomplete or corrupted.

**Solutions:**

#### Solution 1: Rebuild Flutter Cache
```bash
flutter precache --android
flutter clean
flutter pub get
dart run build_runner build --delete-conflicting-outputs
```

#### Solution 2: Switch to Official Flutter Installation
If you're using Puro, consider switching to the official Flutter installation:

1. Install Flutter from [flutter.dev](https://flutter.dev/docs/get-started/install)
2. Update your PATH to use the official Flutter installation
3. Run `flutter doctor` to verify the installation
4. Clean and rebuild your project

#### Solution 3: Force Cache Rebuild
```bash
# Remove Flutter cache
rm -rf ~/.puro/envs/stable/flutter/bin/cache

# Rebuild cache
flutter precache --android --force
```

### Issue: Android SDK Issues

**Error Message:**
```
Android SDK not found
```

**Solution:**
1. Install Android Studio
2. Open Android Studio and install Android SDK
3. Set ANDROID_HOME environment variable:
   ```bash
   export ANDROID_HOME=$HOME/Library/Android/sdk
   export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
   ```
4. Run `flutter doctor` to verify

## iOS Build Issues

### Issue: CocoaPods Issues

**Error Message:**
```
CocoaPods not installed or not in PATH
```

**Solution:**
```bash
# Install CocoaPods
sudo gem install cocoapods

# If using Apple Silicon Mac and getting issues:
sudo gem install ffi
sudo gem install cocoapods
```

### Issue: Xcode Version Compatibility

**Error Message:**
```
Xcode version not compatible
```

**Solution:**
1. Update Xcode to the latest version
2. Run `sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer`
3. Accept Xcode license: `sudo xcodebuild -license accept`

## Code Generation Issues

### Issue: Build Runner Fails

**Error Message:**
```
Build runner failed with exit code 1
```

**Solutions:**

#### Solution 1: Clean and Regenerate
```bash
flutter packages pub run build_runner clean
dart run build_runner build --delete-conflicting-outputs
```

#### Solution 2: Check for Conflicting Files
Remove any manually created `.g.dart` or `.freezed.dart` files and regenerate:
```bash
find . -name "*.g.dart" -delete
find . -name "*.freezed.dart" -delete
dart run build_runner build --delete-conflicting-outputs
```

### Issue: Import Errors After Code Generation

**Error Message:**
```
Target of URI doesn't exist: 'package:app/file.g.dart'
```

**Solution:**
1. Ensure all required annotations are present
2. Run code generation: `dart run build_runner build`
3. Restart your IDE
4. Run `flutter clean && flutter pub get`

## State Management Issues

### Issue: Provider Not Found

**Error Message:**
```
ProviderNotFoundException: No provider found for [Provider]
```

**Solution:**
1. Ensure the provider is properly annotated with `@riverpod`
2. Run code generation to create the provider
3. Check that the provider is imported in the consuming widget
4. Verify the provider is accessible in the widget tree

### Issue: Circular Dependencies

**Error Message:**
```
Circular dependency detected
```

**Solution:**
1. Review your provider dependencies
2. Use `ref.read()` instead of `ref.watch()` for one-time reads
3. Consider breaking the circular dependency by introducing an intermediate provider

## Performance Issues

### Issue: Slow Hot Reload

**Symptoms:** Hot reload takes a long time or fails frequently

**Solutions:**
1. Reduce the number of providers being watched
2. Use `select` to watch specific parts of state
3. Implement proper `==` and `hashCode` for data classes
4. Use `@freezed` for immutable data classes

### Issue: Memory Leaks

**Symptoms:** App memory usage keeps increasing

**Solutions:**
1. Dispose of controllers and streams properly
2. Use `autoDispose` for providers that should be cleaned up
3. Avoid keeping references to BuildContext outside of build methods
4. Use Flutter Inspector to identify memory leaks

## Testing Issues

### Issue: Provider Tests Failing

**Error Message:**
```
Bad state: No ProviderScope found
```

**Solution:**
Wrap your test widgets with ProviderScope:
```dart
testWidgets('test description', (tester) async {
  await tester.pumpWidget(
    ProviderScope(
      child: MaterialApp(
        home: YourWidget(),
      ),
    ),
  );
});
```

### Issue: Mock Providers Not Working

**Solution:**
Use `overrides` in ProviderScope:
```dart
ProviderScope(
  overrides: [
    yourProvider.overrideWith((ref) => mockValue),
  ],
  child: YourWidget(),
)
```

## Development Environment Issues

### Issue: VS Code Extensions Not Working

**Solution:**
1. Install required extensions:
   - Flutter
   - Dart
   - Riverpod Snippets
2. Restart VS Code
3. Run `Flutter: Reload` command

### Issue: Android Studio Issues

**Solution:**
1. Install Flutter and Dart plugins
2. Set Flutter SDK path in settings
3. Invalidate caches and restart: `File > Invalidate Caches and Restart`

## Network Issues

### Issue: HTTP Requests Failing on Android

**Error Message:**
```
SocketException: OS Error: Connection refused
```

**Solution:**
Add network security config for development:

1. Create `android/app/src/main/res/xml/network_security_config.xml`:
```xml
<?xml version="1.0" encoding="utf-8"?>
<network-security-config>
    <domain-config cleartextTrafficPermitted="true">
        <domain includeSubdomains="true">localhost</domain>
        <domain includeSubdomains="true">10.0.2.2</domain>
        <domain includeSubdomains="true">your-api-domain.com</domain>
    </domain-config>
</network-security-config>
```

2. Update `android/app/src/main/AndroidManifest.xml`:
```xml
<application
    android:networkSecurityConfig="@xml/network_security_config"
    ...>
```

## Getting Help

If you're still experiencing issues:

1. **Check the logs:** Use `flutter logs` to see detailed error messages
2. **Search existing issues:** Check the project's GitHub issues
3. **Flutter Doctor:** Run `flutter doctor -v` for detailed environment info
4. **Clean rebuild:** Try `flutter clean && flutter pub get && dart run build_runner build`
5. **Create an issue:** If the problem persists, create a detailed issue report

### Creating a Good Issue Report

Include the following information:
- Flutter version (`flutter --version`)
- Dart version
- Operating system
- Device/emulator details
- Complete error message
- Steps to reproduce
- Expected vs actual behavior

## Useful Commands

```bash
# Check Flutter installation
flutter doctor -v

# Clean project
flutter clean

# Get dependencies
flutter pub get

# Run code generation
dart run build_runner build --delete-conflicting-outputs

# Check for outdated packages
flutter pub outdated

# Analyze code
flutter analyze

# Run tests
flutter test

# Build for release
flutter build apk --release  # Android
flutter build ios --release  # iOS
```
