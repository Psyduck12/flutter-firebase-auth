import 'package:firebase_auth_app/presentation/theme/theme_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeText {
  const ThemeText._();

  static final TextStyle light = GoogleFonts.poppins(
    color: ThemeColor.text,
    fontWeight: FontWeight.w300,
  );

  static final TextStyle normal = GoogleFonts.poppins(
    color: ThemeColor.text,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle medium = GoogleFonts.poppins(
    color: ThemeColor.text,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle semibold = GoogleFonts.poppins(
    color: ThemeColor.text,
    fontWeight: FontWeight.w600,
  );
  static final TextStyle bold = GoogleFonts.poppins(
    color: ThemeColor.text,
    fontWeight: FontWeight.w600,
  );
}
