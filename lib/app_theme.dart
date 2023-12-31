import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/utils/palette.dart';

class AppTheme {
  static TextTheme lightTextTheme = TextTheme(
    bodyLarge: GoogleFonts.lato(
      fontSize: 18.0,
      color: Palette.black,
    ),
    bodyMedium: GoogleFonts.lato(
      fontSize: 16.0,
      color: Palette.black,
    ),
    bodySmall: GoogleFonts.lato(
      fontSize: 14.0,
      color: Palette.black,
    ),
    labelLarge: GoogleFonts.lato(
      fontSize: 22.0,
      fontWeight: FontWeight.bold,
      color: Palette.purple,
    ),
    labelMedium: GoogleFonts.lato(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Palette.purple,
    ),
    labelSmall: GoogleFonts.lato(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: Palette.purple,
    ),
    headlineLarge: GoogleFonts.lato(
      fontSize: 22.0,
      fontWeight: FontWeight.bold,
      color: Palette.black,
    ),
    headlineMedium: GoogleFonts.lato(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Palette.black,
    ),
    headlineSmall: GoogleFonts.lato(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: Palette.black,
    ),
    displayLarge: GoogleFonts.lato(
      fontSize: 22.0,
      fontWeight: FontWeight.bold,
      color: Palette.orange,
    ),
    displayMedium: GoogleFonts.lato(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Palette.orange,
    ),
    displaySmall: GoogleFonts.lato(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: Palette.orange,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    bodyLarge: GoogleFonts.lato(
      fontSize: 18.0,
      color: Palette.black,
    ),
    bodyMedium: GoogleFonts.lato(
      fontSize: 16.0,
      color: Palette.black,
    ),
    bodySmall: GoogleFonts.lato(
      fontSize: 14.0,
      color: Palette.black,
    ),
    labelLarge: GoogleFonts.lato(
      fontSize: 22.0,
      fontWeight: FontWeight.bold,
      color: Palette.purple,
    ),
    labelMedium: GoogleFonts.lato(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Palette.purple,
    ),
    labelSmall: GoogleFonts.lato(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: Palette.purple,
    ),
    headlineLarge: GoogleFonts.lato(
      fontSize: 22.0,
      fontWeight: FontWeight.bold,
      color: Palette.purple,
    ),
    headlineMedium: GoogleFonts.lato(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Palette.purple,
    ),
    headlineSmall: GoogleFonts.lato(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: Palette.black,
    ),
    displayLarge: GoogleFonts.lato(
      fontSize: 22.0,
      fontWeight: FontWeight.bold,
      color: Palette.orange,
    ),
    displayMedium: GoogleFonts.lato(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Palette.orange,
    ),
    displaySmall: GoogleFonts.lato(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: Palette.orange,
    ),
  );

  // TODO: test and adjust light theme color
  static ThemeData light() {
    return ThemeData.light().copyWith(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: Palette.purple),
      textTheme: lightTextTheme,
      primaryColor: Palette.purple,
      focusColor: Palette.orange,
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        foregroundColor: Palette.white,
        backgroundColor: Palette.purple,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          foregroundColor:
              MaterialStateColor.resolveWith((states) => Palette.black),
          backgroundColor:
              MaterialStateColor.resolveWith((states) => Palette.orange),
          textStyle: MaterialStateTextStyle.resolveWith(
              (states) => lightTextTheme.headlineSmall!),
        ),
      ),
      cardColor: Palette.white,
      cardTheme: CardTheme(
        color: Palette.white,
      ),
      // textButtonTheme: TextButtonThemeData(
      //   style: ButtonStyle(
      //     foregroundColor:
      //         MaterialStateColor.resolveWith((states) => Palette.white),
      //   ),
      // ),
      expansionTileTheme: ExpansionTileThemeData(
        textColor: Palette.orange,
        iconColor: Palette.orange,
        collapsedTextColor: lightTextTheme.headlineMedium!.color,
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateColor.resolveWith(
            (states) => Palette.darkGray.withOpacity(0.3),
          ),
          overlayColor: MaterialStateColor.resolveWith(
            (states) => Palette.darkGray.withOpacity(0.3),
          ),
          shape: MaterialStateProperty.resolveWith(
            (states) => RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          padding: MaterialStateProperty.resolveWith(
            (states) => EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          ),
        ),
      ),
    );
  }

  // TODO: test and adjust dark theme color
  static ThemeData dark() {
    return ThemeData.dark().copyWith(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: Palette.purple),
      textTheme: darkTextTheme,
      primaryColor: Palette.purple,
      focusColor: Palette.orange,
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(
        foregroundColor: Palette.darkGray,
        backgroundColor: Palette.purple,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          foregroundColor:
              MaterialStateColor.resolveWith((states) => Palette.darkGray),
          backgroundColor:
              MaterialStateColor.resolveWith((states) => Palette.black),
          textStyle: MaterialStateTextStyle.resolveWith(
              (states) => darkTextTheme.bodyMedium!),
        ),
      ),
      expansionTileTheme: ExpansionTileThemeData(
        textColor: Palette.orange,
        iconColor: Palette.orange,
        collapsedTextColor: darkTextTheme.headlineMedium!.color,
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateColor.resolveWith(
                (states) => Palette.darkGray.withOpacity(0.3),
          ),
          overlayColor: MaterialStateColor.resolveWith(
                (states) => Palette.darkGray.withOpacity(0.3),
          ),
          shape: MaterialStateProperty.resolveWith(
                (states) => RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          padding: MaterialStateProperty.resolveWith(
                (states) => EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          ),
        ),
      ),
    );
  }
}
