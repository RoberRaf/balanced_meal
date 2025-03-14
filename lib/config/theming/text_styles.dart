import 'package:flutter/material.dart';
import 'package:flutterflow_task/config/theming/app_colors.dart';

abstract class TStyle {
  static const regular = FontWeight.w400;

  static const semi = FontWeight.w500;

  static const bold = FontWeight.w700;

  static const bolder = FontWeight.w900;

  static TextStyle primaryRegular(double fontSize) => TextStyle(
        // fontFamily: "Segoe",
        fontSize: fontSize,
        fontWeight: regular,
        color: Co.primary,
      );
  static TextStyle primarySemi(double fontSize) => TextStyle(
        // fontFamily: "Segoe",
        fontSize: fontSize,
        fontWeight: semi,
        color: Co.primary,
      );
  static TextStyle primaryBold(double fontSize) => TextStyle(
        // fontFamily: "Segoe",
        fontSize: fontSize,
        fontWeight: bold,
        color: Co.primary,
      );
  static TextStyle primaryBolder(double fontSize) => TextStyle(
        // fontFamily: "Segoe",
        fontSize: fontSize,
        fontWeight: bolder,
        color: Co.primary,
      );
  static TextStyle whiteRegular(double fontSize) => TextStyle(
        // fontFamily: "Segoe",
        fontSize: fontSize,
        fontWeight: regular,
        color: Co.white,
      );
  static TextStyle whiteSemi(double fontSize) => TextStyle(
        // fontFamily: "Segoe",
        fontSize: fontSize,
        fontWeight: semi,
        color: Co.white,
      );
  static TextStyle whiteBold(double fontSize) => TextStyle(
        // fontFamily: "Segoe",
        fontSize: fontSize,
        fontWeight: bold,
        color: Co.white,
      );
  static TextStyle whiteBolder(double fontSize) => TextStyle(
        // fontFamily: "Segoe",
        fontSize: fontSize,
        fontWeight: bolder,
        color: Co.white,
      );
  static TextStyle blackRegular(double fontSize) => TextStyle(
        // fontFamily: "Segoe",
        fontSize: fontSize,
        fontWeight: regular,
        color: Co.black,
      );
  static TextStyle blackSemi(double fontSize) => TextStyle(
        // fontFamily: "Segoe",
        fontSize: fontSize,
        fontWeight: semi,
        color: Co.black,
      );
  static TextStyle blackBold(double fontSize) => TextStyle(
        // fontFamily: "Segoe",
        fontSize: fontSize,
        fontWeight: bold,
        color: Co.black,
      );
  static TextStyle blackBolder(double fontSize) => TextStyle(
        // fontFamily: "Segoe",
        fontSize: fontSize,
        fontWeight: bolder,
        color: Co.black,
      );
  static TextStyle greyRegular(double fontSize) => TextStyle(
        // fontFamily: "Segoe",
        fontSize: fontSize,
        fontWeight: regular,
        color: Co.grey,
      );
  static TextStyle greySemi(double fontSize) => TextStyle(
        // fontFamily: "Segoe",
        fontSize: fontSize,
        fontWeight: semi,
        color: Co.grey,
      );
  static TextStyle greyBold(double fontSize) => TextStyle(
        // fontFamily: "Segoe",
        fontSize: fontSize,
        fontWeight: bold,
        color: Co.grey,
      );
  static TextStyle greyBolder(double fontSize) => TextStyle(
        // fontFamily: "Segoe",
        fontSize: fontSize,
        fontWeight: bolder,
        color: Co.grey,
      );
}
