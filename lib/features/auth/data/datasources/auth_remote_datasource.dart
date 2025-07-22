import '../../../../core/storage/backend_service.dart';
import '../../../../core/utils/typedef.dart';
import '../models/user_model.dart';

/// Abstract remote data source for authentication
abstract class AuthRemoteDataSource {
  /// Current user stream
  Stream<UserModel?> get userStream;
  
  /// Current user
  UserModel? get currentUser;
  
  /// Sign in with email and password
  FutureResult<UserModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
  
  /// Sign up with email and password
  FutureResult<UserModel> signUpWithEmailAndPassword({
    required String email,
    required String password,
    String? displayName,
  });
  
  /// Sign out
  FutureVoidResult signOut();
  
  /// Send password reset email
  FutureVoidResult sendPasswordResetEmail(String email);
  
  /// Update user profile
  FutureResult<UserModel> updateProfile({
    String? displayName,
    String? photoUrl,
  });
  
  /// Delete user account
  FutureVoidResult deleteAccount();
}

/// Implementation using backend service
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  const AuthRemoteDataSourceImpl(this._authService);

  final AuthService _authService;

  @override
  Stream<UserModel?> get userStream {
    return _authService.userStream.map((user) {
      if (user == null) return null;
      return UserModel(
        id: user.id,
        email: user.email ?? '',
        displayName: user.displayName,
        photoUrl: user.photoUrl,
        emailVerified: user.emailVerified,
        createdAt: user.createdAt,
        lastSignInAt: user.lastSignInAt,
        metadata: user.metadata,
      );
    });
  }

  @override
  UserModel? get currentUser {
    final user = _authService.currentUser;
    if (user == null) return null;
    
    return UserModel(
      id: user.id,
      email: user.email ?? '',
      displayName: user.displayName,
      photoUrl: user.photoUrl,
      emailVerified: user.emailVerified,
      createdAt: user.createdAt,
      lastSignInAt: user.lastSignInAt,
      metadata: user.metadata,
    );
  }

  @override
  FutureResult<UserModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final result = await _authService.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    
    return result.map((user) => UserModel(
      id: user.id,
      email: user.email ?? '',
      displayName: user.displayName,
      photoUrl: user.photoUrl,
      emailVerified: user.emailVerified,
      createdAt: user.createdAt,
      lastSignInAt: user.lastSignInAt,
      metadata: user.metadata,
    ));
  }

  @override
  FutureResult<UserModel> signUpWithEmailAndPassword({
    required String email,
    required String password,
    String? displayName,
  }) async {
    final result = await _authService.signUpWithEmailAndPassword(
      email: email,
      password: password,
      metadata: displayName != null ? {'display_name': displayName} : null,
    );
    
    return result.map((user) => UserModel(
      id: user.id,
      email: user.email ?? '',
      displayName: user.displayName,
      photoUrl: user.photoUrl,
      emailVerified: user.emailVerified,
      createdAt: user.createdAt,
      lastSignInAt: user.lastSignInAt,
      metadata: user.metadata,
    ));
  }

  @override
  FutureVoidResult signOut() async {
    return await _authService.signOut();
  }

  @override
  FutureVoidResult sendPasswordResetEmail(String email) async {
    return await _authService.sendPasswordResetEmail(email);
  }

  @override
  FutureResult<UserModel> updateProfile({
    String? displayName,
    String? photoUrl,
  }) async {
    final data = <String, dynamic>{};
    if (displayName != null) data['display_name'] = displayName;
    if (photoUrl != null) data['avatar_url'] = photoUrl;
    
    final result = await _authService.updateProfile(data);
    
    return result.map((user) => UserModel(
      id: user.id,
      email: user.email ?? '',
      displayName: user.displayName,
      photoUrl: user.photoUrl,
      emailVerified: user.emailVerified,
      createdAt: user.createdAt,
      lastSignInAt: user.lastSignInAt,
      metadata: user.metadata,
    ));
  }

  @override
  FutureVoidResult deleteAccount() async {
    return await _authService.deleteAccount();
  }
}
