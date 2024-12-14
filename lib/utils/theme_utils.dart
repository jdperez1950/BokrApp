import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeUtils {
  static Color primaryColor = const Color(0xFF508FF7);
  static Color secondaryColor = const Color(0xFF8B2FE0);
  static Color tertiaryColor = const Color(0xFF696A69);
  static Color greyColor = const Color(0xFF61646B);
  static Color bgButtonAccount = const Color(0xFFF8F8F8);
  static Color dropDownButtonColor = const Color(0xFFEFEFF0);
  static Color inputBorderColor = Colors.black.withOpacity(0.4);
  static Color inputFocusedColor = Colors.black;

  static List<Color> gradientButton = [
    const Color(0xFF8B2FE0),
    const Color(0xFF508FF7),
  ];
  static List<Color> gradientButtonAlt = [
    const Color(0xFFFFAB37),
    const Color(0xFFDD21A8),
    const Color(0xFFFF7452),
    const Color(0xFF9F2AD2),
    const Color(0xFF6175F0),
  ];

  static ThemeData defaultTheme() {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(backgroundColor: primaryColor),
      backgroundColor: Colors.white,
      primaryColor: primaryColor,
      textTheme: const TextTheme(
        headline3: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w300,
          color: Colors.black,
        ),
        headline4: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
        headline5: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        headline6: TextStyle(
          color: Colors.black,
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
      ),
      fontFamily: GoogleFonts.overpass().fontFamily,
    );
  }
}
