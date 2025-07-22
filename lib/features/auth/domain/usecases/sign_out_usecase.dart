import '../../../../core/utils/typedef.dart';
import '../repositories/auth_repository.dart';

/// Use case for signing out
class SignOutUseCase {
  const SignOutUseCase(this._repository);

  final AuthRepository _repository;

  /// Execute the sign out use case
  FutureVoidResult call() async {
    return await _repository.signOut();
  }
}
