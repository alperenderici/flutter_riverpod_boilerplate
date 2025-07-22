import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';

/// User entity representing the domain model
@freezed
class UserEntity with _$UserEntity {
  const factory UserEntity({
    required String id,
    required String email,
    String? displayName,
    String? photoUrl,
    @Default(false) bool emailVerified,
    required DateTime createdAt,
    DateTime? lastSignInAt,
    Map<String, dynamic>? metadata,
  }) = _UserEntity;

  const UserEntity._();

  /// Get user initials for avatar
  String get initials {
    if (displayName != null && displayName!.isNotEmpty) {
      final names = displayName!.split(' ');
      if (names.length >= 2) {
        return '${names[0][0]}${names[1][0]}'.toUpperCase();
      }
      return displayName![0].toUpperCase();
    }
    return email[0].toUpperCase();
  }

  /// Get display name or email
  String get displayNameOrEmail => displayName ?? email;

  /// Check if user has a profile picture
  bool get hasProfilePicture => photoUrl != null && photoUrl!.isNotEmpty;
}
