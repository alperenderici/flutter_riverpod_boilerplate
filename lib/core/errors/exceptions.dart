/// Base class for all exceptions in the application
abstract class AppException implements Exception {
  const AppException({
    required this.message,
    this.code,
    this.details,
  });

  final String message;
  final String? code;
  final Map<String, dynamic>? details;

  @override
  String toString() => 'AppException: $message${code != null ? ' (Code: $code)' : ''}';
}

/// Server-related exceptions
class ServerException extends AppException {
  const ServerException({
    required super.message,
    super.code,
    super.details,
  });
}

/// Network-related exceptions
class NetworkException extends AppException {
  const NetworkException({
    required super.message,
    super.code,
    super.details,
  });
}

/// Cache-related exceptions
class CacheException extends AppException {
  const CacheException({
    required super.message,
    super.code,
    super.details,
  });
}

/// Authentication-related exceptions
class AuthException extends AppException {
  const AuthException({
    required super.message,
    super.code,
    super.details,
  });
}

/// Validation-related exceptions
class ValidationException extends AppException {
  const ValidationException({
    required super.message,
    super.code,
    super.details,
  });
}

/// Permission-related exceptions
class PermissionException extends AppException {
  const PermissionException({
    required super.message,
    super.code,
    super.details,
  });
}

/// Unknown/Unexpected exceptions
class UnknownException extends AppException {
  const UnknownException({
    required super.message,
    super.code,
    super.details,
  });
}
