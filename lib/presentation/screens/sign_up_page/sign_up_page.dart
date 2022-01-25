import 'package:firebase_auth_app/application/sign_up/sign_up_cubit.dart';
import 'package:firebase_auth_app/get_it.dart';
import 'package:firebase_auth_app/presentation/core/validator.dart';
import 'package:firebase_auth_app/presentation/screens/sign_in_page/sign_in_page.dart';
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

part 'widgets/sign_up_body.dart';
part 'widgets/sign_up_header.dart';
part 'widgets/navigate_button.dart';

class SignUpPage extends StatefulWidget {
  static const String routeName = '/sign-up';

  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late final SignUpCubit _signUpCubit;

  @override
  void initState() {
    super.initState();
    _signUpCubit = getIt<SignUpCubit>();
  }

  @override
  void dispose() {
    _signUpCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _signUpCubit,
      child: MultiBlocListener(
        listeners: [
          BlocListener<SignUpCubit, SignUpState>(
            listenWhen: (p, c) => p.failureOption != c.failureOption && c.failureOption.isSome(),
            listener: (context, state) {
              Navigator.pop(context);
              state.failureOption.fold(
                () {},
                (failure) => context.showErrorBar(
                  content: Text(
                    failure.when(
                      unexpected: () => 'Something went wrong, please try again',
                      weakPassword: () => 'The password provided is too weak.',
                      emailExists: () => 'The account already exists for that email.',
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
          BlocListener<SignUpCubit, SignUpState>(
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
          body: _SignUpBody(),
        ),
      ),
    );
  }
}
