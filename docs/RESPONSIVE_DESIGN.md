# Responsive Design Guide

This document explains how to use the responsive design system in the Flutter Riverpod Boilerplate.

## Overview

The responsive design system provides a consistent way to create adaptive layouts that work well across different screen sizes, with a focus on mobile and tablet devices.

## Breakpoints

The system uses the following breakpoints:

```dart
class ResponsiveBreakpoints {
  static const double mobile = 600;
  static const double tablet = 1024;
  static const double desktop = 1440;
}
```

- **Mobile**: < 600px width
- **Tablet**: 600px - 1024px width  
- **Desktop**: > 1024px width (not actively supported)

## Context Extensions

### Responsive Padding

Use `context.responsivePadding` for consistent padding across screen sizes:

```dart
Container(
  padding: context.responsivePadding,
  child: child,
)
```

This provides:
- Mobile: 16px padding
- Tablet: 24px padding
- Desktop: 32px padding

### Responsive Spacing

Use `context.responsiveSpacing()` for consistent spacing:

```dart
SizedBox(height: context.responsiveSpacing(mobile: 16, tablet: 24))
```

Parameters:
- `mobile`: Spacing for mobile screens (required)
- `tablet`: Spacing for tablet screens (optional, defaults to mobile * 1.5)
- `desktop`: Spacing for desktop screens (optional, defaults to tablet * 1.33)

### Responsive Icon Sizes

Use `context.responsiveIconSize()` for adaptive icon sizes:

```dart
Icon(
  Icons.home,
  size: context.responsiveIconSize(mobile: 24, tablet: 32),
)
```

### Theme Colors

Quick access to theme colors:

```dart
Container(
  color: context.primaryColor,
  child: Text(
    'Hello',
    style: TextStyle(color: context.onPrimary),
  ),
)
```

Available color getters:
- `context.primaryColor`
- `context.onPrimary`
- `context.surface`
- `context.onSurface`
- `context.errorColor`
- `context.onError`

## AppText System

### Using AppTextStyles

Replace standard Text widgets with AppTextStyles for consistent typography:

```dart
// Instead of:
Text('Title', style: Theme.of(context).textTheme.headlineMedium)

// Use:
AppTextStyles.headlineMedium('Title')
```

### Available Text Styles

```dart
// Display styles
AppTextStyles.displayLarge('Large Display')
AppTextStyles.displayMedium('Medium Display')
AppTextStyles.displaySmall('Small Display')

// Headline styles
AppTextStyles.headlineLarge('Large Headline')
AppTextStyles.headlineMedium('Medium Headline')
AppTextStyles.headlineSmall('Small Headline')

// Title styles
AppTextStyles.titleLarge('Large Title')
AppTextStyles.titleMedium('Medium Title')
AppTextStyles.titleSmall('Small Title')

// Body styles
AppTextStyles.bodyLarge('Large Body')
AppTextStyles.bodyMedium('Medium Body')
AppTextStyles.bodySmall('Small Body')

// Label styles
AppTextStyles.labelLarge('Large Label')
AppTextStyles.labelMedium('Medium Label')
AppTextStyles.labelSmall('Small Label')
```

### Customizing Text Styles

All AppTextStyles methods accept optional parameters:

```dart
AppTextStyles.headlineMedium(
  'Custom Title',
  color: Colors.blue,
  textAlign: TextAlign.center,
  maxLines: 2,
  overflow: TextOverflow.ellipsis,
)
```

## Best Practices

### 1. Use Responsive Extensions

Always use the responsive extensions instead of hardcoded values:

```dart
// ❌ Don't do this
Padding(padding: EdgeInsets.all(16))

// ✅ Do this
Padding(padding: context.responsivePadding)
```

### 2. Consistent Spacing

Use the responsive spacing system for consistent layouts:

```dart
Column(
  children: [
    AppTextStyles.headlineMedium('Title'),
    SizedBox(height: context.responsiveSpacing(mobile: 16)),
    AppTextStyles.bodyLarge('Content'),
    SizedBox(height: context.responsiveSpacing(mobile: 24)),
    ElevatedButton(onPressed: () {}, child: Text('Action')),
  ],
)
```

### 3. Responsive Icons

Use responsive icon sizes for better visual hierarchy:

```dart
// Primary action icons
Icon(Icons.add, size: context.responsiveIconSize(mobile: 24))

// Secondary action icons  
Icon(Icons.settings, size: context.responsiveIconSize(mobile: 20))

// Large feature icons
Icon(Icons.star, size: context.responsiveIconSize(mobile: 48, tablet: 64))
```

### 4. AppText for Typography

Always use AppTextStyles for consistent typography:

```dart
// Page titles
AppTextStyles.headlineLarge('Page Title')

// Section headers
AppTextStyles.titleLarge('Section Header')

// Body content
AppTextStyles.bodyMedium('Body content goes here...')

// Captions and labels
AppTextStyles.labelSmall('Caption text')
```

## Migration from Standard Widgets

### Text Widget Migration

```dart
// Before
Text(
  'Hello World',
  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
    color: Colors.blue,
    fontWeight: FontWeight.bold,
  ),
)

// After
AppTextStyles.headlineMedium(
  'Hello World',
  color: Colors.blue,
  fontWeight: FontWeight.bold,
)
```

### Padding Migration

```dart
// Before
Padding(
  padding: EdgeInsets.all(16),
  child: child,
)

// After
Padding(
  padding: context.responsivePadding,
  child: child,
)
```

### Spacing Migration

```dart
// Before
SizedBox(height: 24)

// After
SizedBox(height: context.responsiveSpacing(mobile: 24))
```

## Examples

### Responsive Card Layout

```dart
Card(
  margin: context.responsivePadding,
  child: Padding(
    padding: context.responsivePadding,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextStyles.titleLarge('Card Title'),
        SizedBox(height: context.responsiveSpacing(mobile: 8)),
        AppTextStyles.bodyMedium('Card content goes here...'),
        SizedBox(height: context.responsiveSpacing(mobile: 16)),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {},
              child: Text('Cancel'),
            ),
            SizedBox(width: context.responsiveSpacing(mobile: 8)),
            ElevatedButton(
              onPressed: () {},
              child: Text('Confirm'),
            ),
          ],
        ),
      ],
    ),
  ),
)
```

### Responsive App Bar

```dart
AppBar(
  title: AppTextStyles.titleLarge('App Title'),
  actions: [
    IconButton(
      icon: Icon(
        Icons.search,
        size: context.responsiveIconSize(mobile: 24),
      ),
      onPressed: () {},
    ),
    IconButton(
      icon: Icon(
        Icons.more_vert,
        size: context.responsiveIconSize(mobile: 24),
      ),
      onPressed: () {},
    ),
  ],
)
```

This responsive design system ensures your app looks great and provides a consistent user experience across all supported devices.
