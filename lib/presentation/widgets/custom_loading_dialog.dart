import 'package:firebase_auth_app/presentation/theme/theme_color.dart';
import 'package:flutter/material.dart';

class CustomLoadingDIalog extends StatelessWidget {
  const CustomLoadingDIalog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: ThemeColor.white,
            ),
            child: const SizedBox(
              height: 32,
              width: 32,
              child: CircularProgressIndicator(color: ThemeColor.primary),
            ),
          ),
        ],
      ),
    );
  }
}
