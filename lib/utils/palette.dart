import 'package:flutter/material.dart';

class Palette {
  static const Color purple = Color.fromRGBO(49, 40, 80, 1.0);
  static const Color darkPurple = Color.fromRGBO(18, 4, 37, 1.0);
  static const Color orange = Color(0xffF99417);
  static const Color darkGray = Color(0xffE8E2E2);
  static const Color lightGray = Color(0xffdcdbdb); //9E9E9E80
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  //snack bar colors
  static const Color snackBarWarning = Colors.orange;
  static const Color snackBarError = Colors.red;
  static const Color snackBarSuccess = Colors.green;

  //expense category colors
  static const Color work = Color(0xff60a55a);
  static const Color leisure =  Color(0xff06b4bc);
  static const Color travel = Color(0xfff7d51f);
  static const Color food = Color(0xfffa5457);
  static const Color other = Color(0xfffa8925);

  static Color hexToColor(String hexString, {String alphaChannel = 'FF'}) {
    return Color(int.parse(hexString.replaceFirst('#', '0x$alphaChannel')));
  }
}