import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';

import 'package:uma/presentation/navigation/navigation_controller.dart';
import 'package:uma/presentation/navigation/widgets/bottom_navigation_bar_items.dart';
import 'package:uma/presentation/common/style/colors.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<NavigationController>(
      builder: (navigationController) => Container(
        margin: EdgeInsets.only(bottom: Get.height * 0.02),
        child: CustomNavigationBar(
          onTap: (index) => navigationController.selectedMenuOption = index,
          currentIndex: navigationController.selectedMenuOption,
          isFloating: true,
          borderRadius: const Radius.circular(25),
          iconSize: 26,
          backgroundColor: kPrimaryRed,
          selectedColor: kPrimaryBlack,
          unSelectedColor: kPrimaryWhite,
          strokeColor: kPrimaryBlack,
          items: BottomNavigationBarItems.items(),
        ),
      ),
    );
  }
}
