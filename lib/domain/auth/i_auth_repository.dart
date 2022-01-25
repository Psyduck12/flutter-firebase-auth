import 'package:dartz/dartz.dart';
import 'package:firebase_auth_app/domain/auth/auth_failure.dart';

abstract class IAuthRepository {
  Stream<bool> get authStateChanges;
  String get getUserId;
  String get getEmail;
  Future<Either<SignInFailure, Unit>> signIn({
    required String email,
    required String password,
  });
  Future<Either<SignUpFailure, Unit>> signUp({
    required String email,
    required String password,
  });
  Future<Either<SignInFailure, Unit>> signInWithGoogle();
  Future<Either<SignUpFailure, Unit>> signUpWithGoogle();
  Future<void> signOut();
  Future<Either<ResetPasswordFailure, Unit>> resetPassword({
    required String email,
  });
}
