part of '../sign_in_page.dart';

class _ForgotPasswordButton extends StatelessWidget {
  const _ForgotPasswordButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, ForgotPasswordPage.routeName);
        },
        child: Text(
          'Forgot Password?',
          style: ThemeText.light.copyWith(
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
