import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DosTheme {
  static const Color background = Colors.black;
  static const Color primary = Color(0xFF33FF00); // Classic Terminal Green
  static const Color secondary = Color(0xFF00AA00); // Dimmer Green
  static const Color alert = Color(0xFFFF0000); // Error Red
  
  static TextStyle get textStyle => GoogleFonts.vt323(
    color: primary,
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );

  static TextStyle get headerStyle => GoogleFonts.vt323(
    color: primary,
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );

  static ThemeData get themeData => ThemeData(
    scaffoldBackgroundColor: background,
    primaryColor: primary,
    colorScheme: const ColorScheme.dark(
      primary: primary,
      secondary: secondary,
      surface: background,
      error: alert,
    ),
    textTheme: TextTheme(
      bodyMedium: textStyle,
      bodyLarge: textStyle.copyWith(fontSize: 24),
      titleLarge: headerStyle,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: background,
      elevation: 0,
      titleTextStyle: headerStyle,
      iconTheme: const IconThemeData(color: primary),
      shape: const Border(bottom: BorderSide(color: primary, width: 2)),
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: secondary),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: primary, width: 2),
      ),
      labelStyle: textStyle.copyWith(color: secondary),
      hintStyle: textStyle.copyWith(color: secondary.withOpacity(0.5)),
      prefixIconColor: primary,
    ),
  );
}
