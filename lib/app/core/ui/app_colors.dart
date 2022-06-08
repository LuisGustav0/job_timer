import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color primaryColor = Color(0xff0066b0);
  static const Color primaryColorLight = Color(0xff219fff);

  static const Color grey = Colors.grey;
  static final Color grey200 = Colors.grey[200]!;

  static const Color black = Colors.black;
  static const Color white = Colors.white;

  static const MaterialColor primarySwatch = MaterialColor(
    0xFF0066B0,
    {
      50: Color(0xff005c9e),
      100: Color(0xFF00528d),
      200: Color(0xFF00477b),
      300: Color(0xFF003d6a),
      400: Color(0xFF003358),
      500: Color(0xFF002946),
      600: Color(0xFF001f35),
      700: Color(0xFF001423),
      800: Color(0xFF000a12),
      900: Color(0xFF000000),
    },
  );
}