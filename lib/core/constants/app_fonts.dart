import 'package:flutter/material.dart';

class AppFonts {
  static const String primaryFont = 'Roboto';
  static const String secondaryFont = 'Montserrat';

  static const TextStyle headline1 = TextStyle(
    fontFamily: primaryFont,
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle bodyText = TextStyle(
    fontFamily: secondaryFont,
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: Colors.black54,
  );
}
