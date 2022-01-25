import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth_app/domain/auth/i_auth_repository.dart';
import 'package:firebase_auth_app/domain/user/i_user_repository.dart';
import 'package:firebase_auth_app/domain/user/user_failure.dart';
import 'package:firebase_auth_app/domain/user/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_state.dart';
part 'user_cubit.freezed.dart';

class UserCubit extends Cubit<UserState> {
  final IUserRepository _userRepository;
  final IAuthRepository _authRepository;
  StreamSubscription<Either<UserFailure, UserModel>>? _userStreamSubscription;

  UserCubit({
    required IUserRepository userRepository,
    required IAuthRepository authRepository,
  })  : _userRepository = userRepository,
        _authRepository = authRepository,
        super(UserState.initial());

  @override
  Future<void> close() {
    _userStreamSubscription?.cancel();
    return super.close();
  }

  void setUser() {
    final uid = _authRepository.getUserId;
    _userStreamSubscription = _userRepository.userStream(uid).listen(_listenUserStream);
  }

  void disposeUser() {
    _userStreamSubscription?.cancel();
    _userStreamSubscription = null;
    emit(UserState.initial());
  }

  void _listenUserStream(Either<UserFailure, UserModel> result) {
    result.fold((failure) {
      return emit(state.copyWith(isUserChecked: true, failureOption: some(failure)));
    }, (user) {
      return emit(state.copyWith(isUserChecked: true, user: user));
    });
  }
}
