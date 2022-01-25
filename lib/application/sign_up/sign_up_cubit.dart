import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth_app/domain/auth/auth_failure.dart';
import 'package:firebase_auth_app/domain/auth/i_auth_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_state.dart';
part 'sign_up_cubit.freezed.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final IAuthRepository _authRepository;

  SignUpCubit({
    required IAuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(SignUpState.initial());

  void onEmailChanged(String email) {
    emit(state.copyWith(email: email));
  }

  void onPasswordChanged(String password) {
    emit(state.copyWith(password: password));
  }

  Future<void> signUp() async {
    _emitLoading();
    final result = await _authRepository.signUp(
      email: state.email,
      password: state.password,
    );
    result.fold(
      (failure) => _emitFailure(failure),
      (_) => _emitSuccess(),
    );
  }

  Future<void> signUpWithGoggle() async {
    _emitLoading();
    final result = await _authRepository.signUpWithGoogle();
    result.fold(
      (failure) => _emitFailure(failure),
      (_) => _emitSuccess(),
    );
  }

  void _emitFailure(SignUpFailure failure) {
    return emit(state.copyWith(
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
