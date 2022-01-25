import 'package:firebase_auth_app/presentation/screens/forgot_password_page/forgot_password_page.dart';
import 'package:firebase_auth_app/presentation/screens/main_page.dart';
import 'package:firebase_auth_app/presentation/screens/set_profile_page/set_profile_page.dart';
import 'package:firebase_auth_app/presentation/screens/sign_in_page/sign_in_page.dart';
import 'package:firebase_auth_app/presentation/screens/sign_up_page/sign_up_page.dart';
import 'package:firebase_auth_app/presentation/screens/welcome_page/welcome_page.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> get routes {
  return {
    ForgotPasswordPage.routeName: (_) => const ForgotPasswordPage(),
    MainPage.routeName: (_) => const MainPage(),
    SetProfilePage.routeName: (_) => const SetProfilePage(),
    SignInPage.routeName: (_) => const SignInPage(),
    SignUpPage.routeName: (_) => const SignUpPage(),
    WelcomePage.routeName: (_) => const WelcomePage(),
  };
}
