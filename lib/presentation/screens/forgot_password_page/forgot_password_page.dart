import 'package:firebase_auth_app/application/forgot_password/forgot_password_cubit.dart';
import 'package:firebase_auth_app/get_it.dart';
import 'package:firebase_auth_app/presentation/core/validator.dart';
import 'package:firebase_auth_app/presentation/theme/theme_color.dart';
import 'package:firebase_auth_app/presentation/theme/theme_text.dart';
import 'package:firebase_auth_app/presentation/widgets/custom_button.dart';
import 'package:firebase_auth_app/presentation/widgets/custom_loading_dialog.dart';
import 'package:firebase_auth_app/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flash/flash.dart';

part './widgets/forgot_password_body.dart';
part './widgets/forgot_password_header.dart';

class ForgotPasswordPage extends StatefulWidget {
  static const String routeName = '/forgot-password';

  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  late final ForgotPasswordCubit _forgotPasswordCubit;

  @override
  void initState() {
    super.initState();
    _forgotPasswordCubit = getIt<ForgotPasswordCubit>();
  }

  @override
  void dispose() {
    _forgotPasswordCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _forgotPasswordCubit,
      child: MultiBlocListener(
        listeners: [
          BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
            listenWhen: (p, c) => p.isSuccess != c.isSuccess && c.isSuccess,
            listener: (context, state) async {
              Navigator.pop(context);
              context.showSuccessBar(
                content: Text(
                  'Success, Please check your email to reset the password',
                  style: ThemeText.normal.copyWith(
                    color: ThemeColor.white,
                    fontSize: 14,
                  ),
                ),
              );
              Navigator.pop(context);
            },
          ),
          BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
            listenWhen: (p, c) => p.failureOption != c.failureOption && c.failureOption.isSome(),
            listener: (context, state) {
              Navigator.pop(context);
              state.failureOption.fold(
                () {},
                (failure) => context.showErrorBar(
                  content: Text(
                    failure.when(
                      unexpected: () => 'Something went wrong, please try again',
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
          BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
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
        child: Scaffold(
          backgroundColor: ThemeColor.white,
          body: SafeArea(
            child: Column(
              children: const [
                _ForgotPasswordHeader(),
                SizedBox(height: 24),
                _ForgotPasswordBody(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
