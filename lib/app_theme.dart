import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/utils/palette.dart';

class AppTheme {
  static TextTheme lightTextTheme = TextTheme(
    bodyLarge: GoogleFonts.lato(
      fontSize: 20.0,
      color: Palette.black,
    ),
    bodyMedium: GoogleFonts.lato(
      fontSize: 18.0,
      color: Palette.black,
    ),
    bodySmall: GoogleFonts.lato(
      fontSize: 16.0,
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
      fontSize: 20.0,
      color: Palette.lightGray,
    ),
    bodyMedium: GoogleFonts.lato(
      fontSize: 18.0,
      color: Palette.lightGray,
    ),
    bodySmall: GoogleFonts.lato(
      fontSize: 16.0,
      color: Palette.lightGray,
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
      color: Palette.white,
    ),
    headlineMedium: GoogleFonts.lato(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Palette.white,
    ),
    headlineSmall: GoogleFonts.lato(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: Palette.white,
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
    return ThemeData(
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
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor:
                MaterialStateColor.resolveWith((states) => Palette.white),
            textStyle: MaterialStateTextStyle.resolveWith(
                (states) => lightTextTheme.bodyLarge!),
          ),
        ),
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
        ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Palette.orange)
        // checkboxTheme: CheckboxThemeData(
        //   fillColor: MaterialStateColor.resolveWith(
        //         (states) {
        //       return Palette.orange;
        //     },
        //   ),
        // ),
        // floatingActionButtonTheme: FloatingActionButtonThemeData(
        //   foregroundColor: Palette.orange,
        //   backgroundColor: Palette.purple,
        //   shape:
        //   RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
        // ),
        // bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        //   backgroundColor: Palette.lightGray,
        // ),
        //scaffoldBackgroundColor: Colors.white,
        //visualDensity: VisualDensity.adaptivePlatformDensity,
        );
  }

  // TODO: test and adjust dark theme color
  static ThemeData dark() {
    return ThemeData(
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
              (states) => lightTextTheme.bodyMedium!),
        ),
      ),
      // checkboxTheme: CheckboxThemeData(
      //   fillColor: MaterialStateColor.resolveWith(
      //         (states) {
      //       return Palette.orange;
      //     },
      //   ),
      // ),
      // floatingActionButtonTheme: const FloatingActionButtonThemeData(
      //   foregroundColor: Palette.orange,
      //   backgroundColor: Palette.purple,
      // ),
      // bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      //   backgroundColor: Palette.lightGray,
      // ),
      //visualDensity: VisualDensity.adaptivePlatformDensity,
      //scaffoldBackgroundColor: Colors.black,
    );
  }
}
