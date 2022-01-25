import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_app/domain/auth/auth_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth_app/domain/auth/i_auth_repository.dart';
import 'package:firebase_auth_app/infrastucture/auth/auth_firebase.dart';

class AuthRepository implements IAuthRepository {
  final IAuthFirebase _authFirebase;

  AuthRepository({
    required IAuthFirebase authFirebase,
  }) : _authFirebase = authFirebase;

  @override
  Stream<bool> get authStateChanges => _authFirebase.authStateChanges;

  @override
  String get getUserId => _authFirebase.getUserId;

  @override
  String get getEmail => _authFirebase.getEmail;

  @override
  Future<Either<SignUpFailure, Unit>> signUp({
    required String email,
    required String password,
  }) async {
    try {
      await _authFirebase.signUp(
        email: email,
        password: password,
      );
      return right(unit);
    } on FirebaseAuthException catch (e) {
      late final SignUpFailure failure;
      if (e.code == 'weak-password') {
        failure = const SignUpFailure.weakPassword();
      } else if (e.code == 'email-already-in-use') {
        failure = const SignUpFailure.emailExists();
      } else {
        failure = const SignUpFailure.unexpected();
      }
      return left(failure);
    } catch (e) {
      return left(const SignUpFailure.unexpected());
    }
  }

  @override
  Future<Either<SignInFailure, Unit>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await _authFirebase.signIn(
        email: email,
        password: password,
      );
      return right(unit);
    } on FirebaseAuthException catch (e) {
      late final SignInFailure failure;
      if (e.code == 'user-not-found') {
        failure = const SignInFailure.userNotFound();
      } else if (e.code == 'wrong-password') {
        failure = const SignInFailure.wrongPassword();
      } else {
        failure = const SignInFailure.unexpected();
      }
      return left(failure);
    } catch (e) {
      return left(const SignInFailure.unexpected());
    }
  }

  @override
  Future<Either<SignInFailure, Unit>> signInWithGoogle() async {
    try {
      await _authFirebase.signInWithGoogle();
      return right(unit);
    } catch (e) {
      return left(const SignInFailure.unexpected());
    }
  }

  @override
  Future<Either<SignUpFailure, Unit>> signUpWithGoogle() async {
    try {
      await _authFirebase.signInWithGoogle();
      return right(unit);
    } catch (e) {
      return left(const SignUpFailure.unexpected());
    }
  }

  @override
  Future<void> signOut() async {
    await _authFirebase.signOut();
  }

  @override
  Future<Either<ResetPasswordFailure, Unit>> resetPassword({required String email}) async {
    try {
      await _authFirebase.resetPassword(email: email);
      return right(unit);
    } on FirebaseAuthException catch (e) {
      print(e);
      late final ResetPasswordFailure failure;
      if (e.code == 'user-not-found') {
        failure = const ResetPasswordFailure.userNotFound();
      } else {
        failure = const ResetPasswordFailure.unexpected();
      }
      return left(failure);
    } catch (e) {
      return left(const ResetPasswordFailure.unexpected());
    }
  }
}
