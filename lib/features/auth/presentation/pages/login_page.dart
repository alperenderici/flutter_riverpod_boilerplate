import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/router/route_names.dart';
import '../../../../shared/extensions/context_extensions.dart';
import '../../../../shared/widgets/app_text.dart';
import '../../../../shared/widgets/custom_text_field.dart';
import '../../../../shared/widgets/loading_button.dart';

/// Login page
class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final isPasswordVisible = useState(false);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: context.responsivePadding,
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Logo/Title
                Icon(
                  Icons.lock_outline,
                  size: context.responsiveIconSize(mobile: 80),
                  color: context.primaryColor,
                ),
                SizedBox(height: context.responsiveSpacing(mobile: 32)),
                AppTextStyles.headlineMedium(
                  'Welcome Back',
                  textAlign: TextAlign.center,
                  color: context.onSurface,
                ),
                SizedBox(height: context.responsiveSpacing(mobile: 8)),
                AppTextStyles.bodyLarge(
                  'Sign in to your account',
                  textAlign: TextAlign.center,
                  color: context.onSurface.withValues(alpha: 0.7),
                ),
                SizedBox(height: context.responsiveSpacing(mobile: 48)),

                // Email Field
                CustomTextField(
                  controller: emailController,
                  label: 'Email',
                  hintText: 'Enter your email',
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: const Icon(Icons.email_outlined),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    }
                    if (!RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                    ).hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: context.responsiveSpacing(mobile: 16)),

                // Password Field
                CustomTextField(
                  controller: passwordController,
                  label: 'Password',
                  hintText: 'Enter your password',
                  obscureText: !isPasswordVisible.value,
                  prefixIcon: const Icon(Icons.lock_outlined),
                  suffixIcon: IconButton(
                    icon: Icon(
                      isPasswordVisible.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      isPasswordVisible.value = !isPasswordVisible.value;
                    },
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                SizedBox(height: context.responsiveSpacing(mobile: 24)),

                // Login Button
                LoadingButton(
                  onPressed: () async {
                    if (formKey.currentState?.validate() ?? false) {
                      // TODO: Implement login logic
                      await Future.delayed(const Duration(seconds: 2));
                      if (context.mounted) {
                        context.go(RouteNames.home);
                      }
                    }
                  },
                  text: 'Sign In',
                ),
                SizedBox(height: context.responsiveSpacing(mobile: 16)),

                // Forgot Password
                TextButton(
                  onPressed: () {
                    // TODO: Implement forgot password
                  },
                  child: const Text('Forgot Password?'),
                ),
                SizedBox(height: context.responsiveSpacing(mobile: 32)),

                // Sign Up Link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account? "),
                    TextButton(
                      onPressed: () {
                        context.go(RouteNames.signup);
                      },
                      child: const Text('Sign Up'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
