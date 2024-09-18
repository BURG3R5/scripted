import 'package:flutter/material.dart';

/// Color Palette: https://colorswall.com/palette/generate/7c70ff-eb6fb2-63bf76-ffad7d-e0fdff-000000
const Color primary = Color(0xFF7C70FF),
    secondary = Color(0xFFEB6FB2),
    tertiary = Color(0xFF63BF76),
    quaternary = Color(0xFFFFAD7D),
    white = Color(0xFFE0FDFF),
    black = Colors.black;

// Brand colors
const Color chantsOfSennaarColor = Color(0xFFD02D57);
const Color outerWildsColor = Color(0xFFF09225);
const Color loreleiAndTheLaserEyesColor = Color(0xFFD63BC5);
const Color taijiColor = Color(0xFFACBD3B);
const Color githubColor = Color(0xFF3EC856);
const Color fontStructColor = Color(0xFFFFDE01);
const Color redditColor = Color(0xFFFF4500);
const Color musaColor = Color(0xFFF7F385);
const Color fontAwesomeColor = Color(0xFFFAB005);
const Color freeSoundColor = Color(0xFFFF3546);
const Color flutterColor = Color(0xFF5FC9F8);

final appTheme = ThemeData.from(
  colorScheme: ColorScheme.fromSeed(
    seedColor: primary,
    brightness: Brightness.dark,
    primary: primary,
    onPrimary: black,
    surface: black,
    onSurface: primary,
    secondary: secondary,
    onSecondary: black,
    tertiary: tertiary,
    onTertiary: black,
  ),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(fontFamily: 'GridMandrillMusa'),
    headlineSmall: TextStyle(fontFamily: 'GridMandrillMusa'),
    displaySmall: TextStyle(fontFamily: 'GridMandrillMusa'),
    displayMedium: TextStyle(fontFamily: 'Mandrill'),
    bodyMedium: TextStyle(fontFamily: 'GridMandrillMusa'),
    titleLarge: TextStyle(fontFamily: 'Mandrill', color: white),
  ),
);
