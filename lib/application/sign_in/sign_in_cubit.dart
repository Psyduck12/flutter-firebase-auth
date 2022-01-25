import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth_app/domain/auth/auth_failure.dart';
import 'package:firebase_auth_app/domain/auth/i_auth_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_state.dart';
part 'sign_in_cubit.freezed.dart';

class SignInCubit extends Cubit<SignInState> {
  final IAuthRepository _authRepository;

  SignInCubit({
    required IAuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(SignInState.initial());

  void onEmailChanged(String email) {
    emit(state.copyWith(email: email));
  }

  void onPasswordChanged(String password) {
    emit(state.copyWith(password: password));
  }

  Future<void> signIn() async {
    _emitLoading();
    final result = await _authRepository.signIn(
      email: state.email,
      password: state.password,
    );
    result.fold(
      (failure) => _emitFailure(failure),
      (_) => _emitSuccess(),
    );
  }

  Future<void> signInWithGoggle() async {
    _emitLoading();
    final result = await _authRepository.signInWithGoogle();
    result.fold(
      (failure) => _emitFailure(failure),
      (_) => _emitSuccess(),
    );
  }

  void _emitFailure(SignInFailure failure) {
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
