/// Enum representing different app flavors
enum Flavor {
  development,
  staging,
  production,
}

/// Configuration class for managing app flavors
class FlavorConfig {
  static FlavorConfig? _instance;
  
  final Flavor flavor;
  final String appName;
  final String baseUrl;
  final String bundleId;
  final bool enableLogging;
  final bool enableDebugFeatures;
  final Map<String, dynamic> additionalConfig;

  FlavorConfig._({
    required this.flavor,
    required this.appName,
    required this.baseUrl,
    required this.bundleId,
    required this.enableLogging,
    required this.enableDebugFeatures,
    this.additionalConfig = const {},
  });

  /// Get the current flavor configuration instance
  static FlavorConfig get instance {
    if (_instance == null) {
      throw Exception('FlavorConfig not initialized. Call FlavorConfig.initialize() first.');
    }
    return _instance!;
  }

  /// Check if flavor configuration is initialized
  static bool get isInitialized => _instance != null;

  /// Initialize flavor configuration
  static void initialize({
    required Flavor flavor,
    required String appName,
    required String baseUrl,
    required String bundleId,
    bool enableLogging = true,
    bool enableDebugFeatures = false,
    Map<String, dynamic> additionalConfig = const {},
  }) {
    _instance = FlavorConfig._(
      flavor: flavor,
      appName: appName,
      baseUrl: baseUrl,
      bundleId: bundleId,
      enableLogging: enableLogging,
      enableDebugFeatures: enableDebugFeatures,
      additionalConfig: additionalConfig,
    );
  }

  /// Initialize with predefined configurations based on flavor
  static void initializeForFlavor(Flavor flavor) {
    switch (flavor) {
      case Flavor.development:
        initialize(
          flavor: Flavor.development,
          appName: 'Flutter Riverpod Boilerplate (Dev)',
          baseUrl: 'https://dev-api.example.com',
          bundleId: 'com.example.flutter_riverpod_boilerplate.dev',
          enableLogging: true,
          enableDebugFeatures: true,
          additionalConfig: {
            'enableMockData': true,
            'showDebugBanner': true,
            'logLevel': 'debug',
          },
        );
        break;
      case Flavor.staging:
        initialize(
          flavor: Flavor.staging,
          appName: 'Flutter Riverpod Boilerplate (Staging)',
          baseUrl: 'https://staging-api.example.com',
          bundleId: 'com.example.flutter_riverpod_boilerplate.staging',
          enableLogging: true,
          enableDebugFeatures: false,
          additionalConfig: {
            'enableMockData': false,
            'showDebugBanner': false,
            'logLevel': 'info',
          },
        );
        break;
      case Flavor.production:
        initialize(
          flavor: Flavor.production,
          appName: 'Flutter Riverpod Boilerplate',
          baseUrl: 'https://api.example.com',
          bundleId: 'com.example.flutter_riverpod_boilerplate',
          enableLogging: false,
          enableDebugFeatures: false,
          additionalConfig: {
            'enableMockData': false,
            'showDebugBanner': false,
            'logLevel': 'error',
          },
        );
        break;
    }
  }

  /// Get flavor from string (useful for command line arguments)
  static Flavor flavorFromString(String flavorString) {
    switch (flavorString.toLowerCase()) {
      case 'development':
      case 'dev':
        return Flavor.development;
      case 'staging':
      case 'stg':
        return Flavor.staging;
      case 'production':
      case 'prod':
        return Flavor.production;
      default:
        return Flavor.development; // Default to development
    }
  }

  /// Get current flavor as string
  String get flavorName {
    switch (flavor) {
      case Flavor.development:
        return 'development';
      case Flavor.staging:
        return 'staging';
      case Flavor.production:
        return 'production';
    }
  }

  /// Check if current flavor is development
  bool get isDevelopment => flavor == Flavor.development;

  /// Check if current flavor is staging
  bool get isStaging => flavor == Flavor.staging;

  /// Check if current flavor is production
  bool get isProduction => flavor == Flavor.production;

  /// Get additional configuration value
  T? getConfig<T>(String key) {
    return additionalConfig[key] as T?;
  }

  @override
  String toString() {
    return 'FlavorConfig(flavor: $flavorName, appName: $appName, baseUrl: $baseUrl)';
  }
}
