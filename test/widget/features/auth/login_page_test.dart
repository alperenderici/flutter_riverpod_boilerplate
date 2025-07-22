import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flutter_riverpod_boilerplate/features/auth/presentation/pages/login_page.dart';

void main() {
  group('LoginPage Widget Tests', () {
    testWidgets('should display all required UI elements', (tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: const LoginPage(),
          ),
        ),
      );

      // Assert
      expect(find.text('Welcome Back'), findsOneWidget);
      expect(find.text('Sign in to your account'), findsOneWidget);
      expect(find.byType(TextFormField), findsNWidgets(2)); // Email and Password
      expect(find.text('Sign In'), findsOneWidget);
      expect(find.text('Forgot Password?'), findsOneWidget);
      expect(find.text("Don't have an account? "), findsOneWidget);
      expect(find.text('Sign Up'), findsOneWidget);
    });

    testWidgets('should show validation errors for empty fields', (tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: const LoginPage(),
          ),
        ),
      );

      // Act
      await tester.tap(find.text('Sign In'));
      await tester.pump();

      // Assert
      expect(find.text('Email is required'), findsOneWidget);
      expect(find.text('Password is required'), findsOneWidget);
    });

    testWidgets('should show validation error for invalid email', (tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: const LoginPage(),
          ),
        ),
      );

      // Act
      await tester.enterText(find.byType(TextFormField).first, 'invalid-email');
      await tester.enterText(find.byType(TextFormField).last, 'password123');
      await tester.tap(find.text('Sign In'));
      await tester.pump();

      // Assert
      expect(find.text('Please enter a valid email'), findsOneWidget);
    });

    testWidgets('should show validation error for short password', (tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: const LoginPage(),
          ),
        ),
      );

      // Act
      await tester.enterText(find.byType(TextFormField).first, 'test@example.com');
      await tester.enterText(find.byType(TextFormField).last, '123');
      await tester.tap(find.text('Sign In'));
      await tester.pump();

      // Assert
      expect(find.text('Password must be at least 6 characters'), findsOneWidget);
    });

    testWidgets('should toggle password visibility', (tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: const LoginPage(),
          ),
        ),
      );

      final passwordField = find.byType(TextFormField).last;
      final visibilityToggle = find.byIcon(Icons.visibility);

      // Act & Assert - Initially password should be hidden
      expect(find.byIcon(Icons.visibility), findsOneWidget);
      expect(find.byIcon(Icons.visibility_off), findsNothing);

      // Tap to show password
      await tester.tap(visibilityToggle);
      await tester.pump();

      expect(find.byIcon(Icons.visibility_off), findsOneWidget);
      expect(find.byIcon(Icons.visibility), findsNothing);
    });

    testWidgets('should accept valid email and password', (tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: const LoginPage(),
          ),
        ),
      );

      // Act
      await tester.enterText(find.byType(TextFormField).first, 'test@example.com');
      await tester.enterText(find.byType(TextFormField).last, 'password123');
      await tester.tap(find.text('Sign In'));
      await tester.pump();

      // Assert - No validation errors should be shown
      expect(find.text('Email is required'), findsNothing);
      expect(find.text('Password is required'), findsNothing);
      expect(find.text('Please enter a valid email'), findsNothing);
      expect(find.text('Password must be at least 6 characters'), findsNothing);
    });
  });
}
