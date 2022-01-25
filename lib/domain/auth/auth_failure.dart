import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failure.freezed.dart';

@freezed
class ResetPasswordFailure with _$ResetPasswordFailure {
  const factory ResetPasswordFailure.unexpected() = _ResetPasswordUnexpected;
  const factory ResetPasswordFailure.userNotFound() = _ResetPasswordUserNotFound;
}

@freezed
class SignInFailure with _$SignInFailure {
  const factory SignInFailure.unexpected() = _SignInUnexpected;
  const factory SignInFailure.wrongPassword() = _SignInWrongPassword;
  const factory SignInFailure.userNotFound() = _SignInUserNotFound;
}

@freezed
class SignUpFailure with _$SignUpFailure {
  const factory SignUpFailure.unexpected() = _SignUpUnexpected;
  const factory SignUpFailure.weakPassword() = _SignUpWeakPassword;
  const factory SignUpFailure.emailExists() = _SignUpEmailExists;
}
