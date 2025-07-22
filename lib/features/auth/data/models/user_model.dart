import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/user_entity.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

/// User model for data layer
@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String email,
    String? displayName,
    String? photoUrl,
    @Default(false) bool emailVerified,
    required DateTime createdAt,
    DateTime? lastSignInAt,
    Map<String, dynamic>? metadata,
  }) = _UserModel;

  const UserModel._();

  /// Create from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  /// Convert to entity
  UserEntity toEntity() {
    return UserEntity(
      id: id,
      email: email,
      displayName: displayName,
      photoUrl: photoUrl,
      emailVerified: emailVerified,
      createdAt: createdAt,
      lastSignInAt: lastSignInAt,
      metadata: metadata,
    );
  }

  /// Create from entity
  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      id: entity.id,
      email: entity.email,
      displayName: entity.displayName,
      photoUrl: entity.photoUrl,
      emailVerified: entity.emailVerified,
      createdAt: entity.createdAt,
      lastSignInAt: entity.lastSignInAt,
      metadata: entity.metadata,
    );
  }
}
