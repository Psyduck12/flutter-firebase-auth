import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth_app/application/auth/user/user_cubit.dart';
import 'package:firebase_auth_app/domain/auth/i_auth_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  final IAuthRepository _authRepository;
  final UserCubit _userCubit;
  late StreamSubscription _authStateChanges;

  UserCubit get userCubit => _userCubit;

  AuthCubit({
    required IAuthRepository authRepository,
    required UserCubit userCubit,
  })  : _authRepository = authRepository,
        _userCubit = userCubit,
        super(const AuthState.unauthenticated()) {
    _authStateChanges = _authRepository.authStateChanges.listen(_listenAuthStateChanges);
  }

  @override
  Future<void> close() {
    _authStateChanges.cancel();
    return super.close();
  }

  void _listenAuthStateChanges(bool isAuthenticated) {
    if (isAuthenticated) {
      emit(const AuthState.authenticated());
      _userCubit.setUser();
    } else {
      emit(const AuthState.unauthenticated());
      _userCubit.disposeUser();
    }
  }

  Future<void> signOut() async {
    await _authRepository.signOut();
  }
}
