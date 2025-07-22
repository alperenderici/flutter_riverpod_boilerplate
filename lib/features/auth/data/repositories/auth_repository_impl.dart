import '../../../../core/utils/typedef.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';

/// Implementation of AuthRepository
class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl(this._remoteDataSource);

  final AuthRemoteDataSource _remoteDataSource;

  @override
  Stream<UserEntity?> get userStream {
    return _remoteDataSource.userStream.map((user) => user?.toEntity());
  }

  @override
  UserEntity? get currentUser {
    return _remoteDataSource.currentUser?.toEntity();
  }

  @override
  FutureResult<UserEntity> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final result = await _remoteDataSource.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    
    return result.map((user) => user.toEntity());
  }

  @override
  FutureResult<UserEntity> signUpWithEmailAndPassword({
    required String email,
    required String password,
    String? displayName,
  }) async {
    final result = await _remoteDataSource.signUpWithEmailAndPassword(
      email: email,
      password: password,
      displayName: displayName,
    );
    
    return result.map((user) => user.toEntity());
  }

  @override
  FutureVoidResult signOut() async {
    return await _remoteDataSource.signOut();
  }

  @override
  FutureVoidResult sendPasswordResetEmail(String email) async {
    return await _remoteDataSource.sendPasswordResetEmail(email);
  }

  @override
  FutureResult<UserEntity> updateProfile({
    String? displayName,
    String? photoUrl,
  }) async {
    final result = await _remoteDataSource.updateProfile(
      displayName: displayName,
      photoUrl: photoUrl,
    );
    
    return result.map((user) => user.toEntity());
  }

  @override
  FutureVoidResult deleteAccount() async {
    return await _remoteDataSource.deleteAccount();
  }

  @override
  bool get isSignedIn => _remoteDataSource.currentUser != null;
}
