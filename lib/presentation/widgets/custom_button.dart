import 'package:firebase_auth_app/presentation/theme/theme_color.dart';
import 'package:firebase_auth_app/presentation/theme/theme_text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  final bool isSecondary;

  const CustomButton({
    Key? key,
    required this.label,
    this.onTap,
    this.isSecondary = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          side: isSecondary ? const BorderSide(color: ThemeColor.text60) : BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        backgroundColor: isSecondary ? ThemeColor.white : ThemeColor.primary,
        minimumSize: const Size.fromHeight(0),
      ),
      child: Text(
        label.toUpperCase(),
        style: ThemeText.semibold.copyWith(color: isSecondary ? ThemeColor.text : ThemeColor.white),
      ),
    );
  }
}
