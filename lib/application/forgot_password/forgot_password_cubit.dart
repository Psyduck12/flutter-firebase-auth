import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth_app/domain/auth/i_auth_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:firebase_auth_app/domain/auth/auth_failure.dart';

part 'forgot_password_state.dart';
part 'forgot_password_cubit.freezed.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final IAuthRepository _authRepository;

  ForgotPasswordCubit({
    required IAuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(ForgotPasswordState.initial());

  void onEmailChanged(String email) {
    emit(state.copyWith(email: email));
  }

  Future<void> resetPassword() async {
    _emitLoading();
    final result = await _authRepository.resetPassword(email: state.email);
    result.fold(
      (failure) => _emitFailure(failure),
      (_) => _emitSuccess(),
    );
  }

  void _emitFailure(ResetPasswordFailure failure) {
    emit(state.copyWith(
      failureOption: some(failure),
      isLoading: false,
    ));
  }

  void _emitLoading() {
    emit(state.copyWith(isLoading: true, failureOption: none()));
  }

  void _emitSuccess() {
    emit(state.copyWith(isLoading: false, isSuccess: true));
  }
}
