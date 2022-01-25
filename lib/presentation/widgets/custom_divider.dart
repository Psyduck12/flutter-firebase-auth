import 'package:firebase_auth_app/presentation/theme/theme_color.dart';
import 'package:firebase_auth_app/presentation/theme/theme_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(right: 16),
            child: const Divider(
              color: ThemeColor.text,
              height: 40,
            ),
          ),
        ),
        Text(
          "Or",
          style: ThemeText.normal.copyWith(fontSize: 12),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 16),
            child: const Divider(
              color: ThemeColor.text,
              height: 40,
            ),
          ),
        ),
      ],
    );
  }
}
