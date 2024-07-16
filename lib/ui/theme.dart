import 'package:flutter/material.dart';

const Color primary = Color(0xFF7C70FF);
const Color secondary = Color(0xFFEB6FB2);
const Color tertiary = Color(0xFF63BF76);
const Color white = Color(0xFFE0FDFF);
const Color background = Colors.black;

// Brand colors
const Color chantsOfSennaarColor = Color(0xFFD02D57);
const Color outerWildsColor = Color(0xFFF09225);
const Color loreleiAndTheLaserEyesColor = Color(0xFFD63BC5);
const Color taijiColor = Color(0xFFACBD3B);
const Color fontStructColor = Color(0xFFFFDE01);
const Color redditColor = Color(0xFFFF4500);
const Color musaColor = Color(0xFFF7F385);
const Color fontAwesomeColor = Color(0xFFFAB005);
const Color flutterColor = Color(0xFF5FC9F8);

final appTheme = ThemeData.from(
  colorScheme: ColorScheme.fromSeed(
    seedColor: primary,
    onPrimary: Colors.black,
    brightness: Brightness.dark,
    surface: background,
    onSurface: primary,
    secondary: secondary,
    onSecondary: Colors.black,
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
