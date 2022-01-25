part of '../forgot_password_page.dart';

class _ForgotPasswordHeader extends StatelessWidget {
  const _ForgotPasswordHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: SvgPicture.asset('assets/icons/back.svg'),
          ),
          const SizedBox(width: 6),
          Text(
            'Forgot Password',
            style: ThemeText.semibold.copyWith(
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }
}
