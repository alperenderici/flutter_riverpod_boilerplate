import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/signup_page.dart';
import '../../shared/extensions/context_extensions.dart';
import '../../shared/widgets/app_text.dart';
import 'route_names.dart';

part 'app_router.g.dart';

/// GoRouter configuration provider
@Riverpod(keepAlive: true)
GoRouter goRouter(Ref ref) => GoRouter(
  initialLocation: RouteNames.login,
  debugLogDiagnostics: true,
  routes: [
    // Auth Routes
    GoRoute(
      path: RouteNames.login,
      name: RouteNames.login,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: RouteNames.signup,
      name: RouteNames.signup,
      builder: (context, state) => const SignupPage(),
    ),

    // Main App Routes
    GoRoute(
      path: RouteNames.home,
      name: RouteNames.home,
      builder: (context, state) => const HomePage(),
    ),

    // Settings Routes
    GoRoute(
      path: RouteNames.settings,
      name: RouteNames.settings,
      builder: (context, state) => const SettingsPage(),
    ),
  ],
  errorBuilder: (context, state) => ErrorPage(error: state.error),
  redirect: (context, state) => null, // Add authentication logic here
);

/// Home page placeholder
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: AppTextStyles.titleLarge('Home'),
      actions: [
        IconButton(
          onPressed: () => context.go(RouteNames.settings),
          icon: const Icon(Icons.settings),
        ),
      ],
    ),
    body: Center(
      child: Padding(
        padding: context.responsivePadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppTextStyles.headlineMedium(
              'Welcome to Flutter Riverpod Boilerplate!',
              textAlign: TextAlign.center,
              color: context.onSurface,
            ),
            SizedBox(height: context.responsiveSpacing(mobile: 16)),
            AppTextStyles.bodyLarge(
              'This is a comprehensive boilerplate with clean architecture,\nRiverpod state management, and modern development practices.',
              textAlign: TextAlign.center,
              color: context.onSurface.withValues(alpha: 0.8),
            ),
          ],
        ),
      ),
    ),
  );
}

/// Settings page placeholder
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: AppTextStyles.titleLarge('Settings')),
    body: Center(
      child: AppTextStyles.bodyLarge(
        'Settings Page - Coming Soon!',
        color: context.onSurface,
      ),
    ),
  );
}

/// Error page
class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key, this.error});

  final Exception? error;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: AppTextStyles.titleLarge('Error')),
    body: Center(
      child: Padding(
        padding: context.responsivePadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: context.responsiveIconSize(mobile: 64),
              color: context.errorColor,
            ),
            SizedBox(height: context.responsiveSpacing(mobile: 16)),
            AppTextStyles.titleLarge(
              'Oops! Something went wrong.',
              textAlign: TextAlign.center,
              color: context.onSurface,
            ),
            SizedBox(height: context.responsiveSpacing(mobile: 8)),
            if (error != null)
              Padding(
                padding: context.responsivePadding,
                child: AppTextStyles.bodyMedium(
                  error.toString(),
                  textAlign: TextAlign.center,
                  color: context.onSurface.withValues(alpha: 0.6),
                ),
              ),
            SizedBox(height: context.responsiveSpacing(mobile: 16)),
            ElevatedButton(
              onPressed: () => context.go(RouteNames.home),
              child: const Text('Go Home'),
            ),
          ],
        ),
      ),
    ),
  );
}
