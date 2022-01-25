import 'package:firebase_auth_app/presentation/theme/theme_color.dart';
import 'package:firebase_auth_app/presentation/theme/theme_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomGoogleButton extends StatelessWidget {
  final VoidCallback? onTap;

  const CustomGoogleButton({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onTap,
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: ThemeColor.text60),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        backgroundColor: ThemeColor.white,
        minimumSize: const Size.fromHeight(0),
      ),
      label: Text(
        'Continue with Google'.toUpperCase(),
        style: ThemeText.semibold,
      ),
      icon: SvgPicture.asset('assets/icons/google.svg'),
    );
  }
}
