/// Application route names and paths
class RouteNames {
  // Auth Routes
  static const String login = '/login';
  static const String signup = '/signup';
  static const String forgotPassword = '/forgot-password';
  
  // Main App Routes
  static const String home = '/';
  static const String profile = '/profile';
  static const String settings = '/settings';
  
  // Feature Routes (can be extended)
  static const String dashboard = '/dashboard';
  static const String notifications = '/notifications';
  
  // Utility Routes
  static const String splash = '/splash';
  static const String onboarding = '/onboarding';
  static const String error = '/error';
  
  /// Get route name without parameters
  static String getRouteName(String fullPath) {
    final uri = Uri.parse(fullPath);
    return uri.path;
  }
  
  /// Check if route requires authentication
  static bool requiresAuth(String route) {
    const publicRoutes = [
      login,
      signup,
      forgotPassword,
      splash,
      onboarding,
      error,
    ];
    
    return !publicRoutes.contains(route);
  }
  
  /// Check if route is auth-related
  static bool isAuthRoute(String route) {
    const authRoutes = [
      login,
      signup,
      forgotPassword,
    ];
    
    return authRoutes.contains(route);
  }
}
