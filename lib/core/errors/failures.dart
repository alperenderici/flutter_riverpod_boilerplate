import 'package:equatable/equatable.dart';

/// Base class for all failures in the application
abstract class Failure extends Equatable {
  const Failure({
    required this.message,
    this.code,
    this.details,
  });

  final String message;
  final String? code;
  final Map<String, dynamic>? details;

  @override
  List<Object?> get props => [message, code, details];
}

/// Server-related failures
class ServerFailure extends Failure {
  const ServerFailure({
    required super.message,
    super.code,
    super.details,
  });
}

/// Network-related failures
class NetworkFailure extends Failure {
  const NetworkFailure({
    required super.message,
    super.code,
    super.details,
  });
}

/// Cache-related failures
class CacheFailure extends Failure {
  const CacheFailure({
    required super.message,
    super.code,
    super.details,
  });
}

/// Authentication-related failures
class AuthFailure extends Failure {
  const AuthFailure({
    required super.message,
    super.code,
    super.details,
  });
}

/// Validation-related failures
class ValidationFailure extends Failure {
  const ValidationFailure({
    required super.message,
    super.code,
    super.details,
  });
}

/// Permission-related failures
class PermissionFailure extends Failure {
  const PermissionFailure({
    required super.message,
    super.code,
    super.details,
  });
}

/// Unknown/Unexpected failures
class UnknownFailure extends Failure {
  const UnknownFailure({
    required super.message,
    super.code,
    super.details,
  });
}
