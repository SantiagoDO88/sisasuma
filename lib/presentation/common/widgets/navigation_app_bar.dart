import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:uma/presentation/common/style/style.dart';
import 'package:uma/presentation/pages/home/home_controller.dart';

class NavigationAppBar extends StatelessWidget with PreferredSizeWidget {
  const NavigationAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (homeController) {
        homeController.getUser();
        return AppBar(
          elevation: 0,
          toolbarHeight: Get.height * 0.085,
          //leadingWidth: Get.width * 0.18,
          titleSpacing: -1,
          backgroundColor: kPrimaryWhite,

          title: ListTile(
            leading: CircleAvatar(
              backgroundColor: kPrimaryRed,
              child: Padding(
                padding: EdgeInsets.all(Get.height * 0.01),
                child: const Image(
                  image:
                      AssetImage('assets/icons/circular_logo_white_letter.png'),
                ),
              ),
            ),
            title: Text(
              homeController.user.nombre,
              style: TextStyles.titleStyle(isBold: true),
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              homeController.user.codigoProveedor.toString(),
              style: TextStyles.subtitleStyle(),
            ),
          ),
        );
      },
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(Get.height * 0.085);
}
