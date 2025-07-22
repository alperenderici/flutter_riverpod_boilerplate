import 'package:dio/dio.dart';

/// Network interceptor for handling authentication and common headers
class NetworkInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Add authentication token if available
    // This can be enhanced to get token from storage
    // final token = getAuthToken();
    // if (token != null) {
    //   options.headers['Authorization'] = 'Bearer $token';
    // }

    // Add common headers
    options.headers.addAll({
      'User-Agent': 'Flutter Riverpod Boilerplate/1.0.0',
      'X-Requested-With': 'XMLHttpRequest',
    });

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // Handle successful responses
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Handle authentication errors
    if (err.response?.statusCode == 401) {
      // Handle unauthorized access
      // This could trigger a logout or token refresh
    }

    // Handle other common errors
    switch (err.response?.statusCode) {
      case 400:
        err = err.copyWith(
          message: 'Bad request. Please check your input.',
        );
        break;
      case 403:
        err = err.copyWith(
          message: 'Access forbidden. You don\'t have permission.',
        );
        break;
      case 404:
        err = err.copyWith(
          message: 'Resource not found.',
        );
        break;
      case 500:
        err = err.copyWith(
          message: 'Internal server error. Please try again later.',
        );
        break;
      case 502:
        err = err.copyWith(
          message: 'Bad gateway. Server is temporarily unavailable.',
        );
        break;
      case 503:
        err = err.copyWith(
          message: 'Service unavailable. Please try again later.',
        );
        break;
    }

    super.onError(err, handler);
  }
}
