import 'package:firebase_auth_app/application/auth/auth_cubit.dart';
import 'package:firebase_auth_app/application/auth/user/user_cubit.dart';
import 'package:firebase_auth_app/domain/user/user_model.dart';
import 'package:firebase_auth_app/presentation/screens/main_page.dart';
import 'package:firebase_auth_app/presentation/screens/set_profile_page/set_profile_page.dart';
import 'package:firebase_auth_app/presentation/screens/sign_in_page/sign_in_page.dart';
import 'package:firebase_auth_app/presentation/screens/sign_up_page/sign_up_page.dart';
import 'package:firebase_auth_app/presentation/theme/theme_color.dart';
import 'package:firebase_auth_app/presentation/theme/theme_text.dart';
import 'package:firebase_auth_app/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

part 'widgets/welcome_body.dart';

class WelcomePage extends StatelessWidget {
  static const String routeName = '/';

  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<UserCubit, UserState>(
          listenWhen: (p, c) => p.isUserFailed != c.isUserFailed && c.isUserFailed,
          listener: (context, state) {
            debugPrint('User Retrieve Failed');
          },
        ),
        BlocListener<UserCubit, UserState>(
          listenWhen: (p, c) => p.isUserAvailable != c.isUserAvailable && c.isUserAvailable,
          listener: (context, state) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              MainPage.routeName,
              (route) => false,
            );
          },
        ),
        BlocListener<UserCubit, UserState>(
          listenWhen: (p, c) => p.isUserEmpty != c.isUserEmpty && c.isUserEmpty,
          listener: (context, state) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              SetProfilePage.routeName,
              (route) => false,
            );
          },
        ),
      ],
      child: Scaffold(
        backgroundColor: ThemeColor.white,
        body: BlocBuilder<AuthCubit, AuthState>(
          buildWhen: (p, c) => p != c,
          builder: (context, state) {
            if (state == const AuthState.unauthenticated()) {
              return const _WelcomeBody();
            } else {
              return const Center(child: CircularProgressIndicator(color: ThemeColor.primary));
            }
          },
        ),
      ),
    );
  }
}
