import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/router/route_names.dart';
import '../../../../shared/extensions/context_extensions.dart';
import '../../../../shared/widgets/app_text.dart';
import '../../../../shared/widgets/custom_text_field.dart';
import '../../../../shared/widgets/loading_button.dart';

/// Sign up page
class SignupPage extends HookConsumerWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();
    final displayNameController = useTextEditingController();
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final isPasswordVisible = useState(false);
    final isConfirmPasswordVisible = useState(false);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: context.responsivePadding,
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: context.responsiveSpacing(mobile: 40)),

                  // Logo/Title
                  Icon(
                    Icons.person_add_outlined,
                    size: context.responsiveIconSize(mobile: 80),
                    color: context.primaryColor,
                  ),
                  SizedBox(height: context.responsiveSpacing(mobile: 32)),
                  AppTextStyles.headlineMedium(
                    'Create Account',
                    textAlign: TextAlign.center,
                    color: context.onSurface,
                  ),
                  SizedBox(height: context.responsiveSpacing(mobile: 8)),
                  AppTextStyles.bodyLarge(
                    'Sign up to get started',
                    textAlign: TextAlign.center,
                    color: context.onSurface.withValues(alpha: 0.7),
                  ),
                  SizedBox(height: context.responsiveSpacing(mobile: 48)),

                  // Display Name Field
                  CustomTextField(
                    controller: displayNameController,
                    label: 'Display Name',
                    hintText: 'Enter your display name',
                    prefixIcon: const Icon(Icons.person_outlined),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Display name is required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: context.responsiveSpacing(mobile: 16)),

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
                      if (value.length < 8) {
                        return 'Password must be at least 8 characters';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: context.responsiveSpacing(mobile: 16)),

                  // Confirm Password Field
                  CustomTextField(
                    controller: confirmPasswordController,
                    label: 'Confirm Password',
                    hintText: 'Confirm your password',
                    obscureText: !isConfirmPasswordVisible.value,
                    prefixIcon: const Icon(Icons.lock_outlined),
                    suffixIcon: IconButton(
                      icon: Icon(
                        isConfirmPasswordVisible.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        isConfirmPasswordVisible.value =
                            !isConfirmPasswordVisible.value;
                      },
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      }
                      if (value != passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: context.responsiveSpacing(mobile: 24)),

                  // Sign Up Button
                  LoadingButton(
                    onPressed: () async {
                      if (formKey.currentState?.validate() ?? false) {
                        // TODO: Implement sign up logic
                        await Future.delayed(const Duration(seconds: 2));
                        if (context.mounted) {
                          context.go(RouteNames.home);
                        }
                      }
                    },
                    text: 'Sign Up',
                  ),
                  SizedBox(height: context.responsiveSpacing(mobile: 32)),

                  // Sign In Link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account? '),
                      TextButton(
                        onPressed: () {
                          context.go(RouteNames.login);
                        },
                        child: const Text('Sign In'),
                      ),
                    ],
                  ),
                  SizedBox(height: context.responsiveSpacing(mobile: 40)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
