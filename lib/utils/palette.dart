import 'package:flutter/material.dart';

class Palette {
  static const Color purple = Color.fromRGBO(49, 40, 80, 1.0);
  static const Color darkPurple = Color.fromRGBO(18, 4, 37, 1.0);
  static const Color orange = Color(0xffF99417);
  static const Color darkGray = Color(0xffE8E2E2);
  static const Color lightGray = Color(0xffF5F5F5);
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  //snack bar colors
  static const Color snackBarWarning = Colors.orange;
  static const Color snackBarError = Colors.red;
  static const Color snackBarSuccess = Colors.green;

  static Color hexToColor(String hexString, {String alphaChannel = 'FF'}) {
    return Color(int.parse(hexString.replaceFirst('#', '0x$alphaChannel')));
  }
}