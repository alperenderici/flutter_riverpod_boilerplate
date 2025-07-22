import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/storage/mock_auth_service.dart';
import '../../data/datasources/auth_remote_datasource.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecases/sign_in_usecase.dart';
import '../../domain/usecases/sign_out_usecase.dart';
import '../../domain/usecases/sign_up_usecase.dart';

part 'auth_providers.g.dart';

/// Auth service provider
@Riverpod(keepAlive: true)
MockAuthService authService(AuthServiceRef ref) {
  return MockAuthService();
}

/// Auth remote data source provider
@Riverpod(keepAlive: true)
AuthRemoteDataSource authRemoteDataSource(AuthRemoteDataSourceRef ref) {
  final authService = ref.watch(authServiceProvider);
  return AuthRemoteDataSourceImpl(authService);
}

/// Auth repository provider
@Riverpod(keepAlive: true)
AuthRepository authRepository(AuthRepositoryRef ref) {
  final remoteDataSource = ref.watch(authRemoteDataSourceProvider);
  return AuthRepositoryImpl(remoteDataSource);
}

/// Sign in use case provider
@riverpod
SignInUseCase signInUseCase(SignInUseCaseRef ref) {
  final repository = ref.watch(authRepositoryProvider);
  return SignInUseCase(repository);
}

/// Sign up use case provider
@riverpod
SignUpUseCase signUpUseCase(SignUpUseCaseRef ref) {
  final repository = ref.watch(authRepositoryProvider);
  return SignUpUseCase(repository);
}

/// Sign out use case provider
@riverpod
SignOutUseCase signOutUseCase(SignOutUseCaseRef ref) {
  final repository = ref.watch(authRepositoryProvider);
  return SignOutUseCase(repository);
}

/// Current user provider
@riverpod
Stream<UserEntity?> currentUser(CurrentUserRef ref) {
  final repository = ref.watch(authRepositoryProvider);
  return repository.userStream;
}

/// Auth state provider
@riverpod
bool isAuthenticated(IsAuthenticatedRef ref) {
  final userAsync = ref.watch(currentUserProvider);
  return userAsync.when(
    data: (user) => user != null,
    loading: () => false,
    error: (_, __) => false,
  );
}
