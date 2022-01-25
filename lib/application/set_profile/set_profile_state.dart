part of 'set_profile_cubit.dart';

@freezed
class SetProfileState with _$SetProfileState {
  const factory SetProfileState({
    required String username,
    required File? image,
    required bool isLoading,
    required bool isSuccess,
    required Option<UserFailure> failureOption,
  }) = _SetProfileState;

  factory SetProfileState.initial() {
    return SetProfileState(
      username: '',
      image: null,
      isLoading: false,
      isSuccess: false,
      failureOption: none(),
    );
  }
}
