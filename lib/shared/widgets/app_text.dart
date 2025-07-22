import 'package:flutter/material.dart';

/// Centralized text widget with consistent styling
class AppText extends StatelessWidget {
  const AppText(
    this.text, {
    super.key,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.softWrap,
    this.textScaleFactor,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.letterSpacing,
    this.wordSpacing,
    this.height,
    this.decoration,
    this.decorationColor,
    this.decorationStyle,
    this.decorationThickness,
    this.shadows,
  });

  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final bool? softWrap;
  final double? textScaleFactor;

  // Style properties
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final double? letterSpacing;
  final double? wordSpacing;
  final double? height;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final TextDecorationStyle? decorationStyle;
  final double? decorationThickness;
  final List<Shadow>? shadows;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    TextStyle effectiveStyle =
        style ?? theme.textTheme.bodyMedium ?? const TextStyle();

    // Apply individual style properties
    if (color != null) {
      effectiveStyle = effectiveStyle.copyWith(color: color);
    }
    if (fontSize != null) {
      effectiveStyle = effectiveStyle.copyWith(fontSize: fontSize);
    }
    if (fontWeight != null) {
      effectiveStyle = effectiveStyle.copyWith(fontWeight: fontWeight);
    }
    if (fontStyle != null) {
      effectiveStyle = effectiveStyle.copyWith(fontStyle: fontStyle);
    }
    if (letterSpacing != null) {
      effectiveStyle = effectiveStyle.copyWith(letterSpacing: letterSpacing);
    }
    if (wordSpacing != null) {
      effectiveStyle = effectiveStyle.copyWith(wordSpacing: wordSpacing);
    }
    if (height != null) {
      effectiveStyle = effectiveStyle.copyWith(height: height);
    }
    if (decoration != null) {
      effectiveStyle = effectiveStyle.copyWith(decoration: decoration);
    }
    if (decorationColor != null) {
      effectiveStyle = effectiveStyle.copyWith(
        decorationColor: decorationColor,
      );
    }
    if (decorationStyle != null) {
      effectiveStyle = effectiveStyle.copyWith(
        decorationStyle: decorationStyle,
      );
    }
    if (decorationThickness != null) {
      effectiveStyle = effectiveStyle.copyWith(
        decorationThickness: decorationThickness,
      );
    }
    if (shadows != null) {
      effectiveStyle = effectiveStyle.copyWith(shadows: shadows);
    }

    return Text(
      text,
      style: effectiveStyle,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
      textScaler: textScaleFactor != null
          ? TextScaler.linear(textScaleFactor!)
          : null,
    );
  }
}

/// Predefined text styles for common use cases
class AppTextStyles {
  // Display styles
  static Widget displayLarge(
    String text, {
    Key? key,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) => AppText(
    text,
    key: key,
    style: const TextStyle(fontSize: 57, fontWeight: FontWeight.w400),
    color: color,
    textAlign: textAlign,
    maxLines: maxLines,
    overflow: overflow,
  );

  static Widget displayMedium(
    String text, {
    Key? key,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) => AppText(
    text,
    key: key,
    style: const TextStyle(fontSize: 45, fontWeight: FontWeight.w400),
    color: color,
    textAlign: textAlign,
    maxLines: maxLines,
    overflow: overflow,
  );

  static Widget displaySmall(
    String text, {
    Key? key,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) => AppText(
    text,
    key: key,
    style: const TextStyle(fontSize: 36, fontWeight: FontWeight.w400),
    color: color,
    textAlign: textAlign,
    maxLines: maxLines,
    overflow: overflow,
  );

  // Headline styles
  static Widget headlineLarge(
    String text, {
    Key? key,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) => AppText(
    text,
    key: key,
    style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w400),
    color: color,
    textAlign: textAlign,
    maxLines: maxLines,
    overflow: overflow,
  );

  static Widget headlineMedium(
    String text, {
    Key? key,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) => AppText(
    text,
    key: key,
    style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w400),
    color: color,
    textAlign: textAlign,
    maxLines: maxLines,
    overflow: overflow,
  );

  static Widget headlineSmall(
    String text, {
    Key? key,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) => AppText(
    text,
    key: key,
    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
    color: color,
    textAlign: textAlign,
    maxLines: maxLines,
    overflow: overflow,
  );

  // Title styles
  static Widget titleLarge(
    String text, {
    Key? key,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) => AppText(
    text,
    key: key,
    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
    color: color,
    textAlign: textAlign,
    maxLines: maxLines,
    overflow: overflow,
  );

  static Widget titleMedium(
    String text, {
    Key? key,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) => AppText(
    text,
    key: key,
    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
    color: color,
    textAlign: textAlign,
    maxLines: maxLines,
    overflow: overflow,
  );

  static Widget titleSmall(
    String text, {
    Key? key,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) => AppText(
    text,
    key: key,
    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
    color: color,
    textAlign: textAlign,
    maxLines: maxLines,
    overflow: overflow,
  );

  // Body styles
  static Widget bodyLarge(
    String text, {
    Key? key,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) => AppText(
    text,
    key: key,
    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
    color: color,
    textAlign: textAlign,
    maxLines: maxLines,
    overflow: overflow,
  );

  static Widget bodyMedium(
    String text, {
    Key? key,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) => AppText(
    text,
    key: key,
    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
    color: color,
    textAlign: textAlign,
    maxLines: maxLines,
    overflow: overflow,
  );

  static Widget bodySmall(
    String text, {
    Key? key,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) => AppText(
    text,
    key: key,
    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
    color: color,
    textAlign: textAlign,
    maxLines: maxLines,
    overflow: overflow,
  );

  // Label styles
  static Widget labelLarge(
    String text, {
    Key? key,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) => AppText(
    text,
    key: key,
    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
    color: color,
    textAlign: textAlign,
    maxLines: maxLines,
    overflow: overflow,
  );

  static Widget labelMedium(
    String text, {
    Key? key,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) => AppText(
    text,
    key: key,
    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
    color: color,
    textAlign: textAlign,
    maxLines: maxLines,
    overflow: overflow,
  );

  static Widget labelSmall(
    String text, {
    Key? key,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) => AppText(
    text,
    key: key,
    style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
    color: color,
    textAlign: textAlign,
    maxLines: maxLines,
    overflow: overflow,
  );
}
