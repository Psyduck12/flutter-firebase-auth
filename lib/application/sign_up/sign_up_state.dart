part of 'sign_up_cubit.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState({
    required String email,
    required String password,
    required bool isLoading,
    required bool isSuccess,
    required Option<SignUpFailure> failureOption,
  }) = _SignUpState;

  factory SignUpState.initial() {
    return SignUpState(
      email: '',
      password: '',
      isLoading: false,
      isSuccess: false,
      failureOption: none(),
    );
  }
}
