import 'package:flutter/material.dart';

/// Extensions for BuildContext to make common operations easier
extension ContextExtensions on BuildContext {
  /// MediaQuery extensions
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  Size get size => mediaQuery.size;
  
  /// Screen dimensions
  double get width => size.width;
  double get height => size.height;
  
  /// Screen orientation
  Orientation get orientation => mediaQuery.orientation;
  bool get isPortrait => orientation == Orientation.portrait;
  bool get isLandscape => orientation == Orientation.landscape;
  
  /// Device type helpers
  bool get isMobile => width < 768;
  bool get isTablet => width >= 768 && width < 1024;
  bool get isDesktop => width >= 1024;
  
  /// Responsive breakpoints
  bool get isSmall => width < 600;
  bool get isMedium => width >= 600 && width < 1200;
  bool get isLarge => width >= 1200;
  
  /// Safe area
  EdgeInsets get padding => mediaQuery.padding;
  EdgeInsets get viewInsets => mediaQuery.viewInsets;
  EdgeInsets get viewPadding => mediaQuery.viewPadding;
  
  double get topPadding => padding.top;
  double get bottomPadding => padding.bottom;
  double get leftPadding => padding.left;
  double get rightPadding => padding.right;
  
  /// Keyboard
  double get keyboardHeight => viewInsets.bottom;
  bool get isKeyboardOpen => keyboardHeight > 0;
  
  /// Device pixel ratio
  double get pixelRatio => mediaQuery.devicePixelRatio;
  
  /// Text scale factor
  double get textScaleFactor => mediaQuery.textScaler.scale(1.0);
  
  /// Responsive values based on screen size
  T responsive<T>({
    required T mobile,
    T? tablet,
    T? desktop,
  }) {
    if (isDesktop && desktop != null) return desktop;
    if (isTablet && tablet != null) return tablet;
    return mobile;
  }
  
  /// Responsive padding
  EdgeInsets get responsivePadding => EdgeInsets.all(
    responsive(
      mobile: 16.0,
      tablet: 24.0,
      desktop: 32.0,
    ),
  );
  
  /// Responsive margin
  EdgeInsets get responsiveMargin => EdgeInsets.all(
    responsive(
      mobile: 8.0,
      tablet: 12.0,
      desktop: 16.0,
    ),
  );
  
  /// Theme extensions
  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => theme.colorScheme;
  TextTheme get textTheme => theme.textTheme;
  
  /// Colors
  Color get primaryColor => colorScheme.primary;
  Color get secondaryColor => colorScheme.secondary;
  Color get backgroundColor => colorScheme.surface;
  Color get errorColor => colorScheme.error;
  Color get onPrimary => colorScheme.onPrimary;
  Color get onSecondary => colorScheme.onSecondary;
  Color get onSurface => colorScheme.onSurface;
  Color get onError => colorScheme.onError;
  
  /// Navigation
  NavigatorState get navigator => Navigator.of(this);
  
  void pop<T>([T? result]) => navigator.pop(result);
  
  Future<T?> push<T>(Route<T> route) => navigator.push(route);
  
  Future<T?> pushNamed<T>(String routeName, {Object? arguments}) =>
      navigator.pushNamed(routeName, arguments: arguments);
  
  Future<T?> pushReplacement<T, TO>(Route<T> newRoute, {TO? result}) =>
      navigator.pushReplacement(newRoute, result: result);
  
  Future<T?> pushReplacementNamed<T, TO>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) =>
      navigator.pushReplacementNamed(
        routeName,
        result: result,
        arguments: arguments,
      );
  
  Future<T?> pushAndRemoveUntil<T>(
    Route<T> newRoute,
    bool Function(Route<dynamic>) predicate,
  ) =>
      navigator.pushAndRemoveUntil(newRoute, predicate);
  
  Future<T?> pushNamedAndRemoveUntil<T>(
    String newRouteName,
    bool Function(Route<dynamic>) predicate, {
    Object? arguments,
  }) =>
      navigator.pushNamedAndRemoveUntil(
        newRouteName,
        predicate,
        arguments: arguments,
      );
  
  /// Focus
  FocusNode get focusScope => FocusScope.of(this);
  
  void unfocus() => focusScope.unfocus();
  
  /// Scaffold
  ScaffoldState get scaffold => Scaffold.of(this);
  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);
  
  /// Show snackbar
  void showSnackBar(
    String message, {
    Duration duration = const Duration(seconds: 4),
    SnackBarAction? action,
    Color? backgroundColor,
    Color? textColor,
  }) {
    scaffoldMessenger.showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(color: textColor),
        ),
        duration: duration,
        action: action,
        backgroundColor: backgroundColor,
      ),
    );
  }
  
  /// Show error snackbar
  void showErrorSnackBar(String message) {
    showSnackBar(
      message,
      backgroundColor: errorColor,
      textColor: onError,
    );
  }
  
  /// Show success snackbar
  void showSuccessSnackBar(String message) {
    showSnackBar(
      message,
      backgroundColor: Colors.green,
      textColor: Colors.white,
    );
  }
}

/// Extensions for responsive design
extension ResponsiveExtensions on BuildContext {
  /// Get responsive font size
  double responsiveFontSize({
    required double mobile,
    double? tablet,
    double? desktop,
  }) {
    return responsive(
      mobile: mobile,
      tablet: tablet ?? mobile * 1.2,
      desktop: desktop ?? mobile * 1.4,
    );
  }
  
  /// Get responsive spacing
  double responsiveSpacing({
    required double mobile,
    double? tablet,
    double? desktop,
  }) {
    return responsive(
      mobile: mobile,
      tablet: tablet ?? mobile * 1.5,
      desktop: desktop ?? mobile * 2.0,
    );
  }
  
  /// Get responsive icon size
  double responsiveIconSize({
    required double mobile,
    double? tablet,
    double? desktop,
  }) {
    return responsive(
      mobile: mobile,
      tablet: tablet ?? mobile * 1.3,
      desktop: desktop ?? mobile * 1.6,
    );
  }
}
