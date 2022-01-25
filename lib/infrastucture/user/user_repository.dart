import 'package:dartz/dartz.dart';
import 'dart:io';
import 'package:rxdart/rxdart.dart';

import 'package:firebase_auth_app/domain/user/i_user_repository.dart';
import 'package:firebase_auth_app/domain/user/user_model.dart';
import 'package:firebase_auth_app/domain/user/user_failure.dart';
import 'package:firebase_auth_app/infrastucture/user/user_dto.dart';
import 'package:firebase_auth_app/infrastucture/user/user_firestore.dart';

class UserRepository implements IUserRepository {
  final IUserFirestore _userFirestore;

  UserRepository({
    required IUserFirestore userFirestore,
  }) : _userFirestore = userFirestore;

  @override
  Future<Either<UserFailure, Unit>> createUserProfile({
    required String uid,
    required String email,
    required String username,
    required File? image,
  }) async {
    try {
      await _userFirestore.createUserProfile(
        uid: uid,
        email: email,
        username: username,
        image: image,
      );
      return right(unit);
    } catch (e) {
      return left(const UserFailure());
    }
  }

  @override
  Future<Either<UserFailure, Unit>> updateUserProfile({
    required String uid,
    required String username,
    required File? image,
  }) async {
    try {
      await _userFirestore.updateUserProfile(
        uid: uid,
        username: username,
        image: image,
      );
      return right(unit);
    } catch (e) {
      return left(const UserFailure());
    }
  }

  @override
  Stream<Either<UserFailure, UserModel>> userStream(String uid) {
    return _userFirestore.userStream(uid: uid).map((data) {
      return right<UserFailure, UserModel>(
        data != null ? UserDto.fromMap(data).toUser() : UserModel.empty(),
      );
    }).onErrorReturnWith((error, stackTrace) {
      return left(const UserFailure());
    });
  }
}
