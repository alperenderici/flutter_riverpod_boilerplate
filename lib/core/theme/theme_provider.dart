import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../constants/app_constants.dart';
import '../di/injection.dart';

part 'theme_provider.g.dart';

/// Theme mode provider
@Riverpod(keepAlive: true)
class ThemeMode extends _$ThemeMode {
  @override
  Future<ThemeMode> build() async {
    final storage = await ref.watch(localStorageServiceProvider.future);
    final savedTheme = storage.getString(AppConstants.themeKey);
    
    switch (savedTheme) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      case 'system':
      default:
        return ThemeMode.system;
    }
  }
  
  /// Set theme mode
  Future<void> setThemeMode(ThemeMode mode) async {
    final storage = await ref.read(localStorageServiceProvider.future);
    
    String themeString;
    switch (mode) {
      case ThemeMode.light:
        themeString = 'light';
        break;
      case ThemeMode.dark:
        themeString = 'dark';
        break;
      case ThemeMode.system:
        themeString = 'system';
        break;
    }
    
    await storage.setString(AppConstants.themeKey, themeString);
    state = AsyncValue.data(mode);
  }
  
  /// Toggle between light and dark theme
  Future<void> toggleTheme() async {
    final currentTheme = await future;
    final newTheme = currentTheme == ThemeMode.light 
        ? ThemeMode.dark 
        : ThemeMode.light;
    await setThemeMode(newTheme);
  }
}

/// Helper provider to check if current theme is dark
@riverpod
bool isDarkMode(IsDarkModeRef ref) {
  final themeMode = ref.watch(themeModeProvider);
  return themeMode.when(
    data: (mode) {
      switch (mode) {
        case ThemeMode.light:
          return false;
        case ThemeMode.dark:
          return true;
        case ThemeMode.system:
          // This would need to be enhanced to check system theme
          return false;
      }
    },
    loading: () => false,
    error: (_, __) => false,
  );
}
