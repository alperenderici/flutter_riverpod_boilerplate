import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:flutter_riverpod_boilerplate/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_riverpod_boilerplate/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_riverpod_boilerplate/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:flutter_riverpod_boilerplate/core/errors/failures.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  group('SignInUseCase', () {
    late SignInUseCase useCase;
    late MockAuthRepository mockRepository;

    setUp(() {
      mockRepository = MockAuthRepository();
      useCase = SignInUseCase(mockRepository);
    });

    test('should return UserEntity when sign in is successful', () async {
      // Arrange
      const email = 'test@example.com';
      const password = 'password123';
      final userEntity = UserEntity(
        id: '1',
        email: email,
        displayName: 'Test User',
        emailVerified: true,
        createdAt: DateTime.now(),
      );

      when(() => mockRepository.signInWithEmailAndPassword(
            email: email,
            password: password,
          )).thenAnswer((_) async => Right(userEntity));

      // Act
      final result = await useCase(email: email, password: password);

      // Assert
      expect(result, Right(userEntity));
      verify(() => mockRepository.signInWithEmailAndPassword(
            email: email,
            password: password,
          )).called(1);
    });

    test('should return AuthFailure when sign in fails', () async {
      // Arrange
      const email = 'test@example.com';
      const password = 'wrongpassword';
      const failure = AuthFailure(message: 'Invalid credentials');

      when(() => mockRepository.signInWithEmailAndPassword(
            email: email,
            password: password,
          )).thenAnswer((_) async => const Left(failure));

      // Act
      final result = await useCase(email: email, password: password);

      // Assert
      expect(result, const Left(failure));
      verify(() => mockRepository.signInWithEmailAndPassword(
            email: email,
            password: password,
          )).called(1);
    });
  });
}
