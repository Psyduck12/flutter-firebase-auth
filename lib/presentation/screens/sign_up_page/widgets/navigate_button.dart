part of '../sign_up_page.dart';

class _NavigateButton extends StatelessWidget {
  const _NavigateButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account? ',
          style: ThemeText.light,
        ),
        GestureDetector(
          onTap: () => Navigator.pushReplacementNamed(context, SignInPage.routeName),
          child: Text(
            'Sign In',
            style: ThemeText.normal.copyWith(color: ThemeColor.secondary),
          ),
        )
      ],
    );
  }
}
