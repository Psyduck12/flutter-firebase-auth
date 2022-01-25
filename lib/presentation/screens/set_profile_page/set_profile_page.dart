import 'dart:io';

import 'package:firebase_auth_app/application/set_profile/set_profile_cubit.dart';
import 'package:firebase_auth_app/get_it.dart';
import 'package:firebase_auth_app/presentation/core/validator.dart';
import 'package:firebase_auth_app/presentation/helper/image_picker.dart';
import 'package:firebase_auth_app/presentation/screens/main_page.dart';
import 'package:firebase_auth_app/presentation/theme/theme_color.dart';
import 'package:firebase_auth_app/presentation/theme/theme_text.dart';
import 'package:firebase_auth_app/presentation/widgets/custom_button.dart';
import 'package:firebase_auth_app/presentation/widgets/custom_loading_dialog.dart';
import 'package:firebase_auth_app/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flash/flash.dart';

part './widgets/image_profile_picker.dart';
part './widgets/set_profile_body.dart';
part './widgets/set_profile_header.dart';

class SetProfilePage extends StatefulWidget {
  static const String routeName = '/set-profile';

  const SetProfilePage({Key? key}) : super(key: key);

  @override
  State<SetProfilePage> createState() => _SetProfilePageState();
}

class _SetProfilePageState extends State<SetProfilePage> {
  late final SetProfileCubit _setProfileCubit;

  @override
  void initState() {
    super.initState();
    _setProfileCubit = getIt<SetProfileCubit>();
  }

  @override
  void dispose() {
    _setProfileCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _setProfileCubit,
      child: MultiBlocListener(
        listeners: [
          BlocListener<SetProfileCubit, SetProfileState>(
            listenWhen: (p, c) => p.isSuccess != c.isSuccess && c.isSuccess,
            listener: (context, state) async {
              Navigator.pushNamedAndRemoveUntil(context, MainPage.routeName, (route) => false);
            },
          ),
          BlocListener<SetProfileCubit, SetProfileState>(
            listenWhen: (p, c) => p.failureOption != c.failureOption && c.failureOption.isSome(),
            listener: (context, state) {
              Navigator.pop(context);
              state.failureOption.fold(
                () {},
                (failure) => context.showErrorBar(
                  content: Text(
                    'Something went wrong, please try again',
                    style: ThemeText.normal.copyWith(
                      color: ThemeColor.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              );
            },
          ),
          BlocListener<SetProfileCubit, SetProfileState>(
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
                _SetProfileHeader(),
                SizedBox(height: 16),
                _SetProfileBody(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
