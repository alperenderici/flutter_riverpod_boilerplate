import 'package:flutter/material.dart';

/// Application color scheme and color constants
class AppColors {
  // Primary Colors
  static const Color primaryColor = Color(0xFF6366F1);
  static const Color primaryVariant = Color(0xFF4F46E5);
  
  // Secondary Colors
  static const Color secondaryColor = Color(0xFF10B981);
  static const Color secondaryVariant = Color(0xFF059669);
  
  // Error Colors
  static const Color errorColor = Color(0xFFEF4444);
  static const Color errorVariant = Color(0xFFDC2626);
  
  // Warning Colors
  static const Color warningColor = Color(0xFFF59E0B);
  static const Color warningVariant = Color(0xFFD97706);
  
  // Success Colors
  static const Color successColor = Color(0xFF10B981);
  static const Color successVariant = Color(0xFF059669);
  
  // Info Colors
  static const Color infoColor = Color(0xFF3B82F6);
  static const Color infoVariant = Color(0xFF2563EB);
  
  // Neutral Colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color grey50 = Color(0xFFF9FAFB);
  static const Color grey100 = Color(0xFFF3F4F6);
  static const Color grey200 = Color(0xFFE5E7EB);
  static const Color grey300 = Color(0xFFD1D5DB);
  static const Color grey400 = Color(0xFF9CA3AF);
  static const Color grey500 = Color(0xFF6B7280);
  static const Color grey600 = Color(0xFF4B5563);
  static const Color grey700 = Color(0xFF374151);
  static const Color grey800 = Color(0xFF1F2937);
  static const Color grey900 = Color(0xFF111827);
  
  /// Light color scheme
  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: primaryColor,
    onPrimary: white,
    primaryContainer: Color(0xFFE0E7FF),
    onPrimaryContainer: Color(0xFF1E1B93),
    secondary: secondaryColor,
    onSecondary: white,
    secondaryContainer: Color(0xFFD1FAE5),
    onSecondaryContainer: Color(0xFF064E3B),
    tertiary: Color(0xFF8B5CF6),
    onTertiary: white,
    tertiaryContainer: Color(0xFFEDE9FE),
    onTertiaryContainer: Color(0xFF4C1D95),
    error: errorColor,
    onError: white,
    errorContainer: Color(0xFFFEE2E2),
    onErrorContainer: Color(0xFF991B1B),
    background: grey50,
    onBackground: grey900,
    surface: white,
    onSurface: grey900,
    surfaceVariant: grey100,
    onSurfaceVariant: grey600,
    outline: grey300,
    outlineVariant: grey200,
    shadow: black,
    scrim: black,
    inverseSurface: grey800,
    onInverseSurface: grey100,
    inversePrimary: Color(0xFFA5B4FC),
    surfaceTint: primaryColor,
  );
  
  /// Dark color scheme
  static const ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFFA5B4FC),
    onPrimary: Color(0xFF1E1B93),
    primaryContainer: Color(0xFF312E81),
    onPrimaryContainer: Color(0xFFE0E7FF),
    secondary: Color(0xFF6EE7B7),
    onSecondary: Color(0xFF064E3B),
    secondaryContainer: Color(0xFF047857),
    onSecondaryContainer: Color(0xFFD1FAE5),
    tertiary: Color(0xFFC4B5FD),
    onTertiary: Color(0xFF4C1D95),
    tertiaryContainer: Color(0xFF6D28D9),
    onTertiaryContainer: Color(0xFFEDE9FE),
    error: Color(0xFFFCA5A5),
    onError: Color(0xFF991B1B),
    errorContainer: Color(0xFFDC2626),
    onErrorContainer: Color(0xFFFEE2E2),
    background: grey900,
    onBackground: grey100,
    surface: grey800,
    onSurface: grey100,
    surfaceVariant: grey700,
    onSurfaceVariant: grey300,
    outline: grey600,
    outlineVariant: grey700,
    shadow: black,
    scrim: black,
    inverseSurface: grey100,
    onInverseSurface: grey800,
    inversePrimary: primaryColor,
    surfaceTint: Color(0xFFA5B4FC),
  );
  
  // Semantic Colors
  static const Color divider = grey200;
  static const Color dividerDark = grey700;
  static const Color disabled = grey400;
  static const Color disabledDark = grey600;
  static const Color hint = grey500;
  static const Color hintDark = grey400;
  
  // Gradient Colors
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primaryColor, primaryVariant],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient secondaryGradient = LinearGradient(
    colors: [secondaryColor, secondaryVariant],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
