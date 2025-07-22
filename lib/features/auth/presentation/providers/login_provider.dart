import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/entities/user_entity.dart';
import 'auth_providers.dart';

part 'login_provider.freezed.dart';
part 'login_provider.g.dart';

/// Login state
@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default(false) bool isLoading,
    @Default('') String email,
    @Default('') String password,
    String? errorMessage,
    UserEntity? user,
  }) = _LoginState;
}

/// Login provider
@riverpod
class Login extends _$Login {
  @override
  LoginState build() {
    return const LoginState();
  }

  /// Update email
  void updateEmail(String email) {
    state = state.copyWith(email: email, errorMessage: null);
  }

  /// Update password
  void updatePassword(String password) {
    state = state.copyWith(password: password, errorMessage: null);
  }

  /// Sign in with email and password
  Future<void> signIn() async {
    if (state.isLoading) return;

    // Validate inputs
    if (state.email.isEmpty) {
      state = state.copyWith(errorMessage: 'Email is required');
      return;
    }

    if (state.password.isEmpty) {
      state = state.copyWith(errorMessage: 'Password is required');
      return;
    }

    if (!_isValidEmail(state.email)) {
      state = state.copyWith(errorMessage: 'Please enter a valid email');
      return;
    }

    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final signInUseCase = ref.read(signInUseCaseProvider);
      final result = await signInUseCase(
        email: state.email,
        password: state.password,
      );

      result.fold(
        (failure) {
          state = state.copyWith(
            isLoading: false,
            errorMessage: _getErrorMessage(failure),
          );
        },
        (user) {
          state = state.copyWith(
            isLoading: false,
            user: user,
            errorMessage: null,
          );
        },
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'An unexpected error occurred',
      );
    }
  }

  /// Clear error message
  void clearError() {
    state = state.copyWith(errorMessage: null);
  }

  /// Reset state
  void reset() {
    state = const LoginState();
  }

  /// Validate email format
  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  /// Get user-friendly error message
  String _getErrorMessage(Failure failure) {
    if (failure is AuthFailure) {
      return failure.message;
    } else if (failure is NetworkFailure) {
      return 'Network error. Please check your connection.';
    } else {
      return 'An unexpected error occurred. Please try again.';
    }
  }
}
