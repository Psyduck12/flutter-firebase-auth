import 'package:firebase_auth_app/domain/user/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dto.freezed.dart';

@freezed
class UserDto with _$UserDto {
  const UserDto._();

  const factory UserDto({
    required String uid,
    required String email,
    required String username,
    required String imagePath,
  }) = _UserDto;

  factory UserDto.fromMap(Map<String, dynamic> data) {
    return UserDto(
      uid: data['uid'] ?? '',
      email: data['email'] ?? '',
      username: data['username'] ?? '',
      imagePath: data['image_path'] ?? '',
    );
  }

  UserModel toUser() {
    return UserModel(
      uid: uid,
      email: email,
      username: username,
      imagePath: imagePath,
    );
  }
}
