import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';

import '../errors/failures.dart';
import '../errors/exceptions.dart';
import '../utils/typedef.dart';

/// Network service for handling HTTP requests
class NetworkService {
  const NetworkService(this._dio);

  final Dio _dio;

  /// GET request
  FutureResult<T> get<T>(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    T Function(dynamic)? fromJson,
  }) async {
    try {
      final response = await _dio.get(
        endpoint,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );

      return Right(_handleResponse<T>(response, fromJson));
    } catch (e) {
      return Left(_handleError(e));
    }
  }

  /// POST request
  FutureResult<T> post<T>(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    T Function(dynamic)? fromJson,
  }) async {
    try {
      final response = await _dio.post(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );

      return Right(_handleResponse<T>(response, fromJson));
    } catch (e) {
      return Left(_handleError(e));
    }
  }

  /// PUT request
  FutureResult<T> put<T>(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    T Function(dynamic)? fromJson,
  }) async {
    try {
      final response = await _dio.put(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );

      return Right(_handleResponse<T>(response, fromJson));
    } catch (e) {
      return Left(_handleError(e));
    }
  }

  /// PATCH request
  FutureResult<T> patch<T>(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    T Function(dynamic)? fromJson,
  }) async {
    try {
      final response = await _dio.patch(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );

      return Right(_handleResponse<T>(response, fromJson));
    } catch (e) {
      return Left(_handleError(e));
    }
  }

  /// DELETE request
  FutureResult<T> delete<T>(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    T Function(dynamic)? fromJson,
  }) async {
    try {
      final response = await _dio.delete(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );

      return Right(_handleResponse<T>(response, fromJson));
    } catch (e) {
      return Left(_handleError(e));
    }
  }

  /// Upload file
  FutureResult<T> uploadFile<T>(
    String endpoint, {
    required String filePath,
    required String fileName,
    Map<String, dynamic>? data,
    Options? options,
    ProgressCallback? onSendProgress,
    T Function(dynamic)? fromJson,
  }) async {
    try {
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(filePath, filename: fileName),
        if (data != null) ...data,
      });

      final response = await _dio.post(
        endpoint,
        data: formData,
        options: options,
        onSendProgress: onSendProgress,
      );

      return Right(_handleResponse<T>(response, fromJson));
    } catch (e) {
      return Left(_handleError(e));
    }
  }

  /// Download file
  FutureResult<void> downloadFile(
    String endpoint,
    String savePath, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      await _dio.download(
        endpoint,
        savePath,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );

      return const Right(null);
    } catch (e) {
      return Left(_handleError(e));
    }
  }

  /// Handle response and parse data
  T _handleResponse<T>(Response response, T Function(dynamic)? fromJson) {
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      if (fromJson != null) {
        return fromJson(response.data);
      }
      return response.data as T;
    } else {
      throw ServerException(
        message: 'Server error: ${response.statusCode}',
        code: response.statusCode.toString(),
        details: {'response': response.data},
      );
    }
  }

  /// Handle errors and convert to failures
  Failure _handleError(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return const NetworkFailure(
            message: 'Connection timeout. Please check your internet connection.',
          );
        case DioExceptionType.badResponse:
          return ServerFailure(
            message: 'Server error: ${error.response?.statusCode}',
            code: error.response?.statusCode.toString(),
            details: {'response': error.response?.data},
          );
        case DioExceptionType.cancel:
          return const NetworkFailure(message: 'Request was cancelled');
        case DioExceptionType.connectionError:
          return const NetworkFailure(message: 'No internet connection');
        case DioExceptionType.badCertificate:
          return const NetworkFailure(message: 'Certificate error');
        case DioExceptionType.unknown:
        default:
          return NetworkFailure(message: 'Network error: ${error.message}');
      }
    } else if (error is ServerException) {
      return ServerFailure(
        message: error.message,
        code: error.code,
        details: error.details,
      );
    } else if (error is NetworkException) {
      return NetworkFailure(
        message: error.message,
        code: error.code,
        details: error.details,
      );
    } else {
      return UnknownFailure(message: 'An unexpected error occurred: $error');
    }
  }
}
