import '../../../../core/utils/typedef.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

/// Use case for signing in with email and password
class SignInUseCase {
  const SignInUseCase(this._repository);

  final AuthRepository _repository;

  /// Execute the sign in use case
  FutureResult<UserEntity> call({
    required String email,
    required String password,
  }) async {
    return await _repository.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
