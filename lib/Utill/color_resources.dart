import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

Color primaryBackground = Color(0xFFF0FAF6);
Color accentLight = Color(0xFF656565);
Color accent = Color(0xFF1E99CE);
Color hintColor = Color(0xFFCBCED4);
Color primaryColor = Color(0xFF1FBCEE);
Color greyShade = Color(0xFF93B3AA);
Color accentShade = Color(0xFF78C2A7);
Color cyanColor = Color(0xFF285066);
Color arabicColor = Color(0xFFA4790D);

ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
        background: Color(0xFFE5EEF9),//background colorE5EEF9
        primary: Color(0xFF1E99CE),//icon Color, text Color
        onPrimary: Color(0xFF285066),// from text color
        onSurface: Colors.white,// text color
        onBackground: Colors.white,// card color
        onSecondary: Color(0xFFCBCED4),//hint color
        onTertiary: Color(0xFF14182A)
    ));

ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
        background: Color(0xFF14182A),//background color
        primary: Color(0xFF1E99CE), //icon Color, text Color, button color
        onPrimary: Color(0xFF285066),// from text color
        onSurface: Colors.white,// text color
        onBackground: Color(0xFF252E3D),// card color
        onSecondary: Color(0xFFCBCED4),
        onTertiary: Colors.white//hint color
    ));
