import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';

@freezed
class UserModel with _$UserModel {
  const UserModel._();

  const factory UserModel({
    required String uid,
    required String email,
    required String username,
    required String imagePath,
  }) = _UserModel;

  factory UserModel.empty() {
    return const UserModel(
      uid: '',
      email: '',
      username: '',
      imagePath: '',
    );
  }
}
