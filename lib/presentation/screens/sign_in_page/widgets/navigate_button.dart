part of '../sign_in_page.dart';

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
          'Don\'t have an account? ',
          style: ThemeText.light,
        ),
        GestureDetector(
          onTap: () => Navigator.of(context).pushReplacementNamed(SignUpPage.routeName),
          child: Text(
            'Sign Up',
            style: ThemeText.normal.copyWith(color: ThemeColor.secondary),
          ),
        )
      ],
    );
  }
}
