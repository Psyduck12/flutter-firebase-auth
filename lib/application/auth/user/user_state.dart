part of 'user_cubit.dart';

@freezed
class UserState with _$UserState {
  const UserState._();
  const factory UserState({
    required UserModel user,
    required bool isUserChecked,
    required Option<UserFailure> failureOption,
  }) = _UserState;

  factory UserState.initial() {
    return UserState(
      isUserChecked: false,
      user: UserModel.empty(),
      failureOption: none(),
    );
  }

  bool get isUserAvailable => user != UserModel.empty() && isUserChecked;
  bool get isUserEmpty => user == UserModel.empty() && isUserChecked && failureOption.isNone();
  bool get isUserFailed => failureOption.isSome() && isUserChecked;
}
