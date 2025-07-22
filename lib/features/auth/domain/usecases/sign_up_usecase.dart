import '../../../../core/utils/typedef.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

/// Use case for signing up with email and password
class SignUpUseCase {
  const SignUpUseCase(this._repository);

  final AuthRepository _repository;

  /// Execute the sign up use case
  FutureResult<UserEntity> call({
    required String email,
    required String password,
    String? displayName,
  }) async {
    return await _repository.signUpWithEmailAndPassword(
      email: email,
      password: password,
      displayName: displayName,
    );
  }
}
