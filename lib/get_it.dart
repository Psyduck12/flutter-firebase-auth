import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_app/application/auth/auth_cubit.dart';
import 'package:firebase_auth_app/application/auth/user/user_cubit.dart';
import 'package:firebase_auth_app/application/forgot_password/forgot_password_cubit.dart';
import 'package:firebase_auth_app/application/sign_in/sign_in_cubit.dart';
import 'package:firebase_auth_app/application/sign_up/sign_up_cubit.dart';
import 'package:firebase_auth_app/application/set_profile/set_profile_cubit.dart';
import 'package:firebase_auth_app/domain/auth/i_auth_repository.dart';
import 'package:firebase_auth_app/domain/user/i_user_repository.dart';
import 'package:firebase_auth_app/infrastucture/auth/auth_firebase.dart';
import 'package:firebase_auth_app/infrastucture/auth/auth_repository.dart';
import 'package:firebase_auth_app/infrastucture/user/user_firestore.dart';
import 'package:firebase_auth_app/infrastucture/user/user_repository.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  //Tool
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  getIt.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
  getIt.registerLazySingleton<FirebaseStorage>(() => FirebaseStorage.instance);

  //Service
  getIt.registerLazySingleton<IAuthFirebase>(() => AuthFirebase(firebaseAuth: getIt()));
  getIt.registerLazySingleton<IUserFirestore>(
    () => UserFirestore(
      firestore: getIt(),
      storage: getIt(),
    ),
  );

  //Repository
  getIt.registerLazySingleton<IAuthRepository>(() => AuthRepository(authFirebase: getIt()));
  getIt.registerLazySingleton<IUserRepository>(() => UserRepository(userFirestore: getIt()));

  //Cubit
  /*SINGLETON*/
  getIt.registerLazySingleton<AuthCubit>(
    () => AuthCubit(
      userCubit: getIt(),
      authRepository: getIt(),
    ),
  );
  getIt.registerLazySingleton<UserCubit>(
    () => UserCubit(
      userRepository: getIt(),
      authRepository: getIt(),
    ),
  );

  /*FACTORY*/
  getIt.registerFactory<ForgotPasswordCubit>(() => ForgotPasswordCubit(authRepository: getIt()));
  getIt.registerFactory<SetProfileCubit>(
    () => SetProfileCubit(
      authRepository: getIt(),
      userRepository: getIt(),
    ),
  );
  getIt.registerFactory<SignInCubit>(() => SignInCubit(authRepository: getIt()));
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(authRepository: getIt()));
}
