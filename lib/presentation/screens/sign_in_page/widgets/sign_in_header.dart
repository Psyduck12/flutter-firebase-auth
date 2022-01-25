part of '../sign_in_page.dart';

class _SignInHeader extends StatelessWidget {
  const _SignInHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: SvgPicture.asset('assets/icons/back.svg'),
        ),
        const SizedBox(width: 6),
      ],
    );
  }
}
