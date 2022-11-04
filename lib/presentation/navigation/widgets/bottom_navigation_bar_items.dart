import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:uma/presentation/common/style/style.dart';

class BottomNavigationBarItems {
  static items() {
    return [
      CustomNavigationBarItem(
        icon: const ImageIcon(AssetImage("assets/icons/home_icon.png")),
        title: Text(
          'Home',
          style: TextStyles.navigationTextStyle(),
        ),
      ),
      CustomNavigationBarItem(
          icon: const ImageIcon(AssetImage("assets/icons/rutero_icon.png")),
          title: Text(
            "Rutero",
            style: TextStyles.navigationTextStyle(),
          )),
      CustomNavigationBarItem(
          icon: const ImageIcon(AssetImage("assets/icons/estadisticas_icon.png")),
          title: Text(
            "Estadísticas",
            style: TextStyles.navigationTextStyle(),
          )),
      CustomNavigationBarItem(
        icon: const ImageIcon(AssetImage("assets/icons/herramientas_icon.png")),
        title: Text(
          "Herramientas",
          style: TextStyles.navigationTextStyle(),
        ),
      ),
    ];
  }
}
