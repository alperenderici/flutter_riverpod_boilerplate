import 'package:flutter/material.dart' as material;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../constants/app_constants.dart';
import '../di/injection.dart';

part 'theme_provider.g.dart';

/// Theme mode provider
@Riverpod(keepAlive: true)
class AppThemeMode extends _$AppThemeMode {
  @override
  Future<material.ThemeMode> build() async {
    final storage = await ref.watch(localStorageServiceProvider.future);
    final savedTheme = storage.getString(AppConstants.themeKey);

    switch (savedTheme) {
      case 'light':
        return material.ThemeMode.light;
      case 'dark':
        return material.ThemeMode.dark;
      case 'system':
      default:
        return material.ThemeMode.system;
    }
  }

  /// Set theme mode
  Future<void> setThemeMode(material.ThemeMode mode) async {
    final storage = await ref.read(localStorageServiceProvider.future);

    final themeString = switch (mode) {
      material.ThemeMode.light => 'light',
      material.ThemeMode.dark => 'dark',
      material.ThemeMode.system => 'system',
    };

    await storage.setString(AppConstants.themeKey, themeString);
    state = AsyncValue.data(mode);
  }

  /// Toggle between light and dark theme
  Future<void> toggleTheme() async {
    final currentTheme = await future;
    final newTheme = currentTheme == material.ThemeMode.light
        ? material.ThemeMode.dark
        : material.ThemeMode.light;
    await setThemeMode(newTheme);
  }
}

/// Helper provider to check if current theme is dark
@riverpod
bool isDarkMode(Ref ref) {
  final themeMode = ref.watch(appThemeModeProvider);
  return themeMode.when(
    data: (mode) => switch (mode) {
      material.ThemeMode.light => false,
      material.ThemeMode.dark => true,
      material.ThemeMode.system =>
        false, // Could be enhanced to check system theme
    },
    loading: () => false,
    error: (_, __) => false,
  );
}
