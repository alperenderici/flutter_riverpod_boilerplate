import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flutter_riverpod_boilerplate/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Auth Flow Integration Tests', () {
    testWidgets('complete auth flow - login to home', (tester) async {
      // Start the app
      app.main();
      await tester.pumpAndSettle();

      // Verify we're on the login page
      expect(find.text('Welcome Back'), findsOneWidget);
      expect(find.text('Sign in to your account'), findsOneWidget);

      // Enter valid credentials
      await tester.enterText(
        find.byType(TextFormField).first,
        'test@example.com',
      );
      await tester.enterText(
        find.byType(TextFormField).last,
        'password123',
      );

      // Tap sign in button
      await tester.tap(find.text('Sign In'));
      await tester.pumpAndSettle();

      // Verify navigation to home page
      expect(find.text('Welcome to Flutter Riverpod Boilerplate!'), findsOneWidget);
      expect(find.text('This is a comprehensive boilerplate'), findsOneWidget);
    });

    testWidgets('navigation from login to signup', (tester) async {
      // Start the app
      app.main();
      await tester.pumpAndSettle();

      // Verify we're on the login page
      expect(find.text('Welcome Back'), findsOneWidget);

      // Tap sign up link
      await tester.tap(find.text('Sign Up'));
      await tester.pumpAndSettle();

      // Verify navigation to signup page
      expect(find.text('Create Account'), findsOneWidget);
      expect(find.text('Sign up to get started'), findsOneWidget);
    });

    testWidgets('navigation from signup to login', (tester) async {
      // Start the app
      app.main();
      await tester.pumpAndSettle();

      // Navigate to signup page
      await tester.tap(find.text('Sign Up'));
      await tester.pumpAndSettle();

      // Verify we're on the signup page
      expect(find.text('Create Account'), findsOneWidget);

      // Tap sign in link
      await tester.tap(find.text('Sign In'));
      await tester.pumpAndSettle();

      // Verify navigation back to login page
      expect(find.text('Welcome Back'), findsOneWidget);
      expect(find.text('Sign in to your account'), findsOneWidget);
    });

    testWidgets('complete signup flow', (tester) async {
      // Start the app
      app.main();
      await tester.pumpAndSettle();

      // Navigate to signup page
      await tester.tap(find.text('Sign Up'));
      await tester.pumpAndSettle();

      // Fill out signup form
      final textFields = find.byType(TextFormField);
      await tester.enterText(textFields.at(0), 'Test User'); // Display Name
      await tester.enterText(textFields.at(1), 'test@example.com'); // Email
      await tester.enterText(textFields.at(2), 'password123'); // Password
      await tester.enterText(textFields.at(3), 'password123'); // Confirm Password

      // Tap sign up button
      await tester.tap(find.text('Sign Up'));
      await tester.pumpAndSettle();

      // Verify navigation to home page
      expect(find.text('Welcome to Flutter Riverpod Boilerplate!'), findsOneWidget);
    });

    testWidgets('validation errors prevent form submission', (tester) async {
      // Start the app
      app.main();
      await tester.pumpAndSettle();

      // Try to submit empty login form
      await tester.tap(find.text('Sign In'));
      await tester.pump();

      // Verify validation errors are shown
      expect(find.text('Email is required'), findsOneWidget);
      expect(find.text('Password is required'), findsOneWidget);

      // Verify we're still on login page
      expect(find.text('Welcome Back'), findsOneWidget);
    });
  });
}
