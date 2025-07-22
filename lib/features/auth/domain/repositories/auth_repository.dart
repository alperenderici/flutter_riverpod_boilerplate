import '../../../../core/utils/typedef.dart';
import '../entities/user_entity.dart';

/// Abstract authentication repository
abstract class AuthRepository {
  /// Current user stream
  Stream<UserEntity?> get userStream;
  
  /// Current user
  UserEntity? get currentUser;
  
  /// Sign in with email and password
  FutureResult<UserEntity> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
  
  /// Sign up with email and password
  FutureResult<UserEntity> signUpWithEmailAndPassword({
    required String email,
    required String password,
    String? displayName,
  });
  
  /// Sign out
  FutureVoidResult signOut();
  
  /// Send password reset email
  FutureVoidResult sendPasswordResetEmail(String email);
  
  /// Update user profile
  FutureResult<UserEntity> updateProfile({
    String? displayName,
    String? photoUrl,
  });
  
  /// Delete user account
  FutureVoidResult deleteAccount();
  
  /// Check if user is signed in
  bool get isSignedIn;
}
