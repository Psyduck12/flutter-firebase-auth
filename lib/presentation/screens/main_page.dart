import 'package:firebase_auth_app/application/auth/auth_cubit.dart';
import 'package:firebase_auth_app/application/auth/user/user_cubit.dart';
import 'package:firebase_auth_app/presentation/screens/welcome_page/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainPage extends StatefulWidget {
  static const String routeName = '/main-page';
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    context.read<UserCubit>().setUser();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (p, c) => p != c && c == const AuthState.unauthenticated(),
      listener: (context, state) async {
        Navigator.pushNamedAndRemoveUntil(context, WelcomePage.routeName, (route) => false);
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(children: const []),
              BlocBuilder<UserCubit, UserState>(
                buildWhen: (p, c) => p.user != c.user && c.isUserAvailable,
                builder: (context, state) {
                  return Column(
                    children: [
                      state.user.imagePath.isNotEmpty
                          ? CircleAvatar(
                              backgroundImage: NetworkImage(state.user.imagePath),
                              radius: 60,
                            )
                          : SvgPicture.asset('assets/icons/user_placeholder.svg'),
                      const SizedBox(height: 8),
                      Text(state.user.email),
                      const SizedBox(height: 8),
                      Text(state.user.username),
                    ],
                  );
                },
              ),
              TextButton(
                onPressed: context.read<AuthCubit>().signOut,
                child: const Text('Sign Out'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
