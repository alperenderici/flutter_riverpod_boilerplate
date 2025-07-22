/// Application-wide constants
class AppConstants {
  // App Information
  static const String appName = 'Flutter Riverpod Boilerplate';
  static const String appVersion = '1.0.0';
  
  // API Configuration
  static const String baseUrl = 'https://api.example.com';
  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
  
  // Storage Keys
  static const String userTokenKey = 'user_token';
  static const String userDataKey = 'user_data';
  static const String themeKey = 'theme_mode';
  static const String languageKey = 'language_code';
  
  // Hive Box Names
  static const String userBox = 'user_box';
  static const String settingsBox = 'settings_box';
  static const String cacheBox = 'cache_box';
  
  // Feature Toggles
  static const bool enableAutoRoute = bool.fromEnvironment('AUTO_ROUTE', defaultValue: false);
  static const bool enableFirebase = bool.fromEnvironment('FIREBASE', defaultValue: false);
  static const bool enableSupabase = bool.fromEnvironment('SUPABASE', defaultValue: true);
  static const bool enableLocalization = bool.fromEnvironment('LOCALIZATION', defaultValue: true);
  static const bool enableDioLogging = bool.fromEnvironment('DIO_LOGGING', defaultValue: true);
  
  // Validation
  static const int minPasswordLength = 8;
  static const int maxPasswordLength = 128;
  static const int maxEmailLength = 254;
  
  // UI Constants
  static const double defaultPadding = 16.0;
  static const double smallPadding = 8.0;
  static const double largePadding = 24.0;
  static const double borderRadius = 12.0;
  static const double buttonHeight = 48.0;
  
  // Animation Durations
  static const Duration shortAnimation = Duration(milliseconds: 200);
  static const Duration mediumAnimation = Duration(milliseconds: 300);
  static const Duration longAnimation = Duration(milliseconds: 500);
}
