import 'package:dartz/dartz.dart';
import '../errors/failures.dart';

/// Common type definitions used throughout the application

/// Result type for operations that can fail
typedef Result<T> = Either<Failure, T>;

/// Future result type for async operations that can fail
typedef FutureResult<T> = Future<Result<T>>;

/// Void result type for operations that don't return data
typedef VoidResult = Result<void>;

/// Future void result type for async operations that don't return data
typedef FutureVoidResult = FutureResult<void>;

/// JSON type definition
typedef JSON = Map<String, dynamic>;

/// List of JSON objects
typedef JSONList = List<JSON>;

/// Callback function type
typedef VoidCallback = void Function();

/// Callback function with parameter
typedef Callback<T> = void Function(T value);

/// Async callback function
typedef AsyncCallback = Future<void> Function();

/// Async callback function with parameter
typedef AsyncCallbackWithParam<T> = Future<void> Function(T value);

/// Validator function type
typedef Validator<T> = String? Function(T? value);

/// Mapper function type
typedef Mapper<T, R> = R Function(T value);

/// Predicate function type
typedef Predicate<T> = bool Function(T value);
