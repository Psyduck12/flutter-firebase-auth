import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth_app/domain/user/user_failure.dart';
import 'package:firebase_auth_app/domain/user/user_model.dart';

abstract class IUserRepository {
  Stream<Either<UserFailure, UserModel>> userStream(String uid);
  Future<Either<UserFailure, Unit>> createUserProfile({
    required String uid,
    required String email,
    required String username,
    required File? image,
  });
  Future<Either<UserFailure, Unit>> updateUserProfile({
    required String uid,
    required String username,
    required File? image,
  });
}
