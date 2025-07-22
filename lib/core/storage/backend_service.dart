import '../utils/typedef.dart';

/// Abstract backend service interface
abstract class BackendService {
  /// Initialize the backend service
  Future<void> initialize();
  
  /// Check if the service is initialized
  bool get isInitialized;
  
  /// Dispose resources
  Future<void> dispose();
}

/// Abstract authentication service interface
abstract class AuthService extends BackendService {
  /// Current user stream
  Stream<User?> get userStream;
  
  /// Current user
  User? get currentUser;
  
  /// Sign in with email and password
  FutureResult<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
  
  /// Sign up with email and password
  FutureResult<User> signUpWithEmailAndPassword({
    required String email,
    required String password,
    Map<String, dynamic>? metadata,
  });
  
  /// Sign out
  FutureVoidResult signOut();
  
  /// Send password reset email
  FutureVoidResult sendPasswordResetEmail(String email);
  
  /// Delete user account
  FutureVoidResult deleteAccount();
  
  /// Update user profile
  FutureResult<User> updateProfile(Map<String, dynamic> data);
}

/// Abstract database service interface
abstract class DatabaseService extends BackendService {
  /// Create a document
  FutureResult<String> create({
    required String collection,
    required Map<String, dynamic> data,
    String? id,
  });
  
  /// Read a document by ID
  FutureResult<Map<String, dynamic>?> read({
    required String collection,
    required String id,
  });
  
  /// Update a document
  FutureVoidResult update({
    required String collection,
    required String id,
    required Map<String, dynamic> data,
  });
  
  /// Delete a document
  FutureVoidResult delete({
    required String collection,
    required String id,
  });
  
  /// Query documents
  FutureResult<List<Map<String, dynamic>>> query({
    required String collection,
    Map<String, dynamic>? where,
    String? orderBy,
    bool descending = false,
    int? limit,
  });
  
  /// Listen to document changes
  Stream<Map<String, dynamic>?> listenToDocument({
    required String collection,
    required String id,
  });
  
  /// Listen to collection changes
  Stream<List<Map<String, dynamic>>> listenToCollection({
    required String collection,
    Map<String, dynamic>? where,
    String? orderBy,
    bool descending = false,
    int? limit,
  });
}

/// Abstract storage service interface
abstract class StorageService extends BackendService {
  /// Upload a file
  FutureResult<String> uploadFile({
    required String path,
    required List<int> bytes,
    String? contentType,
    Map<String, String>? metadata,
  });
  
  /// Download a file
  FutureResult<List<int>> downloadFile(String path);
  
  /// Get file URL
  FutureResult<String> getFileUrl(String path);
  
  /// Delete a file
  FutureVoidResult deleteFile(String path);
  
  /// List files in a directory
  FutureResult<List<String>> listFiles(String directory);
}

/// User model interface
abstract class User {
  String get id;
  String? get email;
  String? get displayName;
  String? get photoUrl;
  bool get emailVerified;
  DateTime get createdAt;
  DateTime? get lastSignInAt;
  Map<String, dynamic>? get metadata;
}
