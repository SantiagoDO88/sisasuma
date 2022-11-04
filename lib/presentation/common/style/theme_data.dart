import 'package:flutter/material.dart';

import 'package:uma/presentation/common/style/style.dart';

ThemeData themeData() {
  return ThemeData(
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: createMaterialColor(kPrimaryRed),
      accentColor: createMaterialColor(kPrimaryGrey),
      cardColor: createMaterialColor(kPrimaryWhite),
      backgroundColor: createMaterialColor(kBackgroundGrey),
      errorColor: createMaterialColor(kPrimaryRed),
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: createMaterialColor(kBackgroundGrey),
    textSelectionTheme: const TextSelectionThemeData(
        cursorColor: kPrimaryRed, selectionColor: kPrimaryRed),
    sliderTheme: SliderThemeData(
      overlayShape: SliderComponentShape.noThumb,
      thumbColor: Colors.transparent,
      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6, elevation: 0),
      trackHeight: 10,
    ),
  );
}
