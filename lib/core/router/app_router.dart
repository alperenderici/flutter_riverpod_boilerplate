import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/signup_page.dart';
import '../constants/app_constants.dart';
import 'route_names.dart';

part 'app_router.g.dart';

/// GoRouter configuration provider
@Riverpod(keepAlive: true)
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
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
    redirect: (context, state) {
      // Add authentication logic here
      // For now, allow all routes
      return null;
    },
  );
}

/// Home page placeholder
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: () => context.go(RouteNames.settings),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to Flutter Riverpod Boilerplate!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Text(
              'This is a comprehensive boilerplate with clean architecture,\nRiverpod state management, and modern development practices.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

/// Settings page placeholder
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: const Center(
        child: Text('Settings Page - Coming Soon!'),
      ),
    );
  }
}

/// Error page
class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key, this.error});

  final Exception? error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 64,
              color: Colors.red,
            ),
            const SizedBox(height: 16),
            const Text(
              'Oops! Something went wrong.',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            if (error != null)
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  error.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.go(RouteNames.home),
              child: const Text('Go Home'),
            ),
          ],
        ),
      ),
    );
  }
}
