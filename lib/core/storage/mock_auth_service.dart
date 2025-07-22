import 'package:dartz/dartz.dart';

import '../constants/app_constants.dart';
import '../errors/failures.dart';
import '../utils/typedef.dart';
import 'backend_service.dart';

/// Mock authentication service for development and testing
class MockAuthService implements AuthService {
  bool _isInitialized = false;
  MockUser? _currentUser;

  @override
  Future<void> initialize() async {
    _isInitialized = true;
  }

  @override
  bool get isInitialized => _isInitialized;

  @override
  Future<void> dispose() async {
    _currentUser = null;
    _isInitialized = false;
  }

  @override
  Stream<User?> get userStream {
    return Stream.value(_currentUser);
  }

  @override
  User? get currentUser => _currentUser;

  @override
  FutureResult<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    // Mock validation
    if (email == 'test@example.com' && password == 'password123') {
      _currentUser = MockUser(
        id: '1',
        email: email,
        displayName: 'Test User',
        emailVerified: true,
        createdAt: DateTime.now(),
        lastSignInAt: DateTime.now(),
      );
      return Right(_currentUser!);
    } else {
      return const Left(AuthFailure(message: 'Invalid credentials'));
    }
  }

  @override
  FutureResult<User> signUpWithEmailAndPassword({
    required String email,
    required String password,
    Map<String, dynamic>? metadata,
  }) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    _currentUser = MockUser(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      email: email,
      displayName: metadata?['display_name'] as String?,
      emailVerified: false,
      createdAt: DateTime.now(),
    );
    return Right(_currentUser!);
  }

  @override
  FutureVoidResult signOut() async {
    await Future.delayed(const Duration(milliseconds: 500));
    _currentUser = null;
    return const Right(null);
  }

  @override
  FutureVoidResult sendPasswordResetEmail(String email) async {
    await Future.delayed(const Duration(seconds: 1));
    return const Right(null);
  }

  @override
  FutureVoidResult deleteAccount() async {
    await Future.delayed(const Duration(seconds: 1));
    _currentUser = null;
    return const Right(null);
  }

  @override
  FutureResult<User> updateProfile(Map<String, dynamic> data) async {
    await Future.delayed(const Duration(seconds: 1));
    
    if (_currentUser != null) {
      _currentUser = MockUser(
        id: _currentUser!.id,
        email: _currentUser!.email,
        displayName: data['display_name'] as String? ?? _currentUser!.displayName,
        photoUrl: data['avatar_url'] as String? ?? _currentUser!.photoUrl,
        emailVerified: _currentUser!.emailVerified,
        createdAt: _currentUser!.createdAt,
        lastSignInAt: _currentUser!.lastSignInAt,
        metadata: {...?_currentUser!.metadata, ...data},
      );
      return Right(_currentUser!);
    } else {
      return const Left(AuthFailure(message: 'No user signed in'));
    }
  }
}

/// Mock user implementation for development
class MockUser implements User {
  const MockUser({
    required this.id,
    required this.email,
    this.displayName,
    this.photoUrl,
    this.emailVerified = false,
    required this.createdAt,
    this.lastSignInAt,
    this.metadata,
  });

  @override
  final String id;

  @override
  final String? email;

  @override
  final String? displayName;

  @override
  final String? photoUrl;

  @override
  final bool emailVerified;

  @override
  final DateTime createdAt;

  @override
  final DateTime? lastSignInAt;

  @override
  final Map<String, dynamic>? metadata;
}
