part of '../sign_up_page.dart';

class _SignUpHeader extends StatelessWidget {
  const _SignUpHeader({
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
