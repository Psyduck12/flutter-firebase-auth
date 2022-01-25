part of 'forgot_password_cubit.dart';

@freezed
class ForgotPasswordState with _$ForgotPasswordState {
  const factory ForgotPasswordState({
    required String email,
    required bool isLoading,
    required bool isSuccess,
    required Option<ResetPasswordFailure> failureOption,
  }) = _ForgotPasswordState;

  factory ForgotPasswordState.initial() {
    return ForgotPasswordState(
      email: '',
      isLoading: false,
      isSuccess: false,
      failureOption: none(),
    );
  }
}
