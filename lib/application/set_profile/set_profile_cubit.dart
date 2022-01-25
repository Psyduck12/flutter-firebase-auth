import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth_app/domain/auth/i_auth_repository.dart';
import 'package:firebase_auth_app/domain/user/i_user_repository.dart';
import 'package:firebase_auth_app/domain/user/user_failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'set_profile_state.dart';
part 'set_profile_cubit.freezed.dart';

class SetProfileCubit extends Cubit<SetProfileState> {
  final IUserRepository _userRepository;
  final IAuthRepository _authRepository;

  SetProfileCubit({
    required IUserRepository userRepository,
    required IAuthRepository authRepository,
  })  : _userRepository = userRepository,
        _authRepository = authRepository,
        super(SetProfileState.initial());

  void onUsernameChanged(String username) {
    emit(state.copyWith(username: username));
  }

  void onImageChanged(File? image) {
    emit(state.copyWith(image: image));
  }

  Future<void> createUserProfile() async {
    _emitLoading();
    final result = await _userRepository.createUserProfile(
      uid: _authRepository.getUserId,
      email: _authRepository.getEmail,
      username: state.username,
      image: state.image,
    );
    result.fold(
      (failure) => _emitFailure(failure),
      (_) => _emitSuccess(),
    );
  }

  void _emitFailure(UserFailure failure) {
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
