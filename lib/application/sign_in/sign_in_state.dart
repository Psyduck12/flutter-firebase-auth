part of 'sign_in_cubit.dart';

@freezed
class SignInState with _$SignInState {
  const SignInState._();
  const factory SignInState({
    required String email,
    required String password,
    required bool isLoading,
    required bool isSuccess,
    required Option<SignInFailure> failureOption,
  }) = _SignInState;

  factory SignInState.initial() {
    return SignInState(
      email: '',
      password: '',
      isLoading: false,
      isSuccess: false,
      failureOption: none(),
    );
  }
}
