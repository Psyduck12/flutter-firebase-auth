import 'package:firebase_auth_app/application/auth/auth_cubit.dart';
import 'package:firebase_auth_app/get_it.dart';
import 'package:firebase_auth_app/presentation/core/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatApp extends StatefulWidget {
  const ChatApp({Key? key}) : super(key: key);

  @override
  State<ChatApp> createState() => _ChatAppState();
}

class _ChatAppState extends State<ChatApp> {
  final AuthCubit _authCubit = getIt<AuthCubit>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: false,
          create: (context) => _authCubit,
        ),
        BlocProvider(
          lazy: false,
          create: (context) => _authCubit.userCubit,
        ),
      ],
      child: MaterialApp(routes: routes),
    );
  }
}
