import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uma/presentation/common/style/style.dart';

class TextStyles {
  static TextStyle titleStyle(
      {Color color = kGraySubtitle, bool isBold = false}) {
    return TextStyle(
      color: color,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      fontFamily: 'Montserrat',
      fontSize: Get.height * 0.022 / Get.textScaleFactor,
    );
  }

  static TextStyle titleStyle2(
      {Color color = kPrimaryRed, bool isBold = true}) {
    return TextStyle(
      color: color,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      fontFamily: 'Montserrat',
      fontSize: Get.height * 0.025 / Get.textScaleFactor,
    );
  }

  static TextStyle subtitleStyle(
      {Color color = kPrimaryBlack, bool isBold = false}) {
    return TextStyle(
      color: color,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      fontFamily: 'Montserrat',
      fontSize: Get.height * 0.02 / Get.textScaleFactor,
    );
  }

  static TextStyle buttonStyle(
      {Color color = kPrimaryWhite, bool isBold = true}) {
    return TextStyle(
      color: color,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      fontFamily: 'Montserrat',
      fontSize: Get.height * 0.02 / Get.textScaleFactor,
    );
  }

  static TextStyle bodyStyle(
      {Color color = kPrimaryBlack, bool isBold = false}) {
    return TextStyle(
      color: color,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      fontFamily: 'OpenSans',
      fontSize: Get.height * 0.02 / Get.textScaleFactor,
    );
  }

  static TextStyle navigationTextStyle(
      {Color color = kPrimaryWhite, bool isBold = true}) {
    return TextStyle(
      color: color,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      fontFamily: 'Montserrat',
      fontSize: Get.height * 0.015 / Get.textScaleFactor,
    );
  }
}
