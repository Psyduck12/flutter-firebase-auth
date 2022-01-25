import 'package:firebase_auth_app/application/sign_in/sign_in_cubit.dart';
import 'package:firebase_auth_app/get_it.dart';
import 'package:firebase_auth_app/presentation/core/validator.dart';
import 'package:firebase_auth_app/presentation/screens/forgot_password_page/forgot_password_page.dart';
import 'package:firebase_auth_app/presentation/screens/sign_up_page/sign_up_page.dart';
import 'package:firebase_auth_app/presentation/theme/theme_color.dart';
import 'package:firebase_auth_app/presentation/theme/theme_text.dart';
import 'package:firebase_auth_app/presentation/widgets/custom_button.dart';
import 'package:firebase_auth_app/presentation/widgets/custom_divider.dart';
import 'package:firebase_auth_app/presentation/widgets/custom_google_button.dart';
import 'package:firebase_auth_app/presentation/widgets/custom_loading_dialog.dart';
import 'package:firebase_auth_app/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flash/flash.dart';

part 'widgets/sign_in_body.dart';
part 'widgets/sign_in_header.dart';
part 'widgets/navigate_button.dart';
part 'widgets/forgot_password_button.dart';

class SignInPage extends StatefulWidget {
  static const String routeName = '/sign-in';

  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late final SignInCubit _signInCubit;

  @override
  void initState() {
    super.initState();
    _signInCubit = getIt<SignInCubit>();
  }

  @override
  void dispose() {
    _signInCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _signInCubit,
      child: MultiBlocListener(
        listeners: [
          BlocListener<SignInCubit, SignInState>(
            listenWhen: (p, c) => p.failureOption != c.failureOption && c.failureOption.isSome(),
            listener: (context, state) {
              Navigator.pop(context);
              state.failureOption.fold(
                () {},
                (failure) => context.showErrorBar(
                  content: Text(
                    failure.when(
                      unexpected: () => 'Something went wrong, please try again',
                      wrongPassword: () => 'Wrong password provided for that user.',
                      userNotFound: () => 'No user found for that email.',
                    ),
                    style: ThemeText.normal.copyWith(
                      color: ThemeColor.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              );
            },
          ),
          BlocListener<SignInCubit, SignInState>(
            listenWhen: (p, c) => p.isLoading != c.isLoading && c.isLoading,
            listener: (context, state) {
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) {
                  return const CustomLoadingDIalog();
                },
              );
            },
          ),
        ],
        child: const Scaffold(
          backgroundColor: ThemeColor.white,
          body: _SignInBody(),
        ),
      ),
    );
  }
}
