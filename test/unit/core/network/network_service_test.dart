import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:flutter_riverpod_boilerplate/core/network/network_service.dart';
import 'package:flutter_riverpod_boilerplate/core/errors/failures.dart';

class MockDio extends Mock implements Dio {}

void main() {
  group('NetworkService', () {
    late NetworkService networkService;
    late MockDio mockDio;

    setUp(() {
      mockDio = MockDio();
      networkService = NetworkService(mockDio);
    });

    group('GET request', () {
      test('should return data when request is successful', () async {
        // Arrange
        const endpoint = '/test';
        const responseData = {'message': 'success'};
        final response = Response<Map<String, dynamic>>(
          data: responseData,
          statusCode: 200,
          requestOptions: RequestOptions(path: endpoint),
        );

        when(() => mockDio.get(
              endpoint,
              queryParameters: any(named: 'queryParameters'),
              options: any(named: 'options'),
              cancelToken: any(named: 'cancelToken'),
            )).thenAnswer((_) async => response);

        // Act
        final result = await networkService.get<Map<String, dynamic>>(endpoint);

        // Assert
        expect(result.isRight(), true);
        result.fold(
          (failure) => fail('Expected success but got failure: $failure'),
          (data) => expect(data, responseData),
        );
      });

      test('should return NetworkFailure when connection timeout occurs', () async {
        // Arrange
        const endpoint = '/test';
        final dioException = DioException(
          type: DioExceptionType.connectionTimeout,
          requestOptions: RequestOptions(path: endpoint),
        );

        when(() => mockDio.get(
              endpoint,
              queryParameters: any(named: 'queryParameters'),
              options: any(named: 'options'),
              cancelToken: any(named: 'cancelToken'),
            )).thenThrow(dioException);

        // Act
        final result = await networkService.get<Map<String, dynamic>>(endpoint);

        // Assert
        expect(result.isLeft(), true);
        result.fold(
          (failure) {
            expect(failure, isA<NetworkFailure>());
            expect(failure.message, contains('Connection timeout'));
          },
          (data) => fail('Expected failure but got success: $data'),
        );
      });

      test('should return ServerFailure when bad response occurs', () async {
        // Arrange
        const endpoint = '/test';
        final dioException = DioException(
          type: DioExceptionType.badResponse,
          response: Response(
            statusCode: 500,
            requestOptions: RequestOptions(path: endpoint),
          ),
          requestOptions: RequestOptions(path: endpoint),
        );

        when(() => mockDio.get(
              endpoint,
              queryParameters: any(named: 'queryParameters'),
              options: any(named: 'options'),
              cancelToken: any(named: 'cancelToken'),
            )).thenThrow(dioException);

        // Act
        final result = await networkService.get<Map<String, dynamic>>(endpoint);

        // Assert
        expect(result.isLeft(), true);
        result.fold(
          (failure) {
            expect(failure, isA<ServerFailure>());
            expect(failure.message, contains('Server error: 500'));
          },
          (data) => fail('Expected failure but got success: $data'),
        );
      });
    });

    group('POST request', () {
      test('should return data when request is successful', () async {
        // Arrange
        const endpoint = '/test';
        const requestData = {'name': 'test'};
        const responseData = {'id': 1, 'name': 'test'};
        final response = Response<Map<String, dynamic>>(
          data: responseData,
          statusCode: 201,
          requestOptions: RequestOptions(path: endpoint),
        );

        when(() => mockDio.post(
              endpoint,
              data: requestData,
              queryParameters: any(named: 'queryParameters'),
              options: any(named: 'options'),
              cancelToken: any(named: 'cancelToken'),
            )).thenAnswer((_) async => response);

        // Act
        final result = await networkService.post<Map<String, dynamic>>(
          endpoint,
          data: requestData,
        );

        // Assert
        expect(result.isRight(), true);
        result.fold(
          (failure) => fail('Expected success but got failure: $failure'),
          (data) => expect(data, responseData),
        );
      });
    });
  });
}
