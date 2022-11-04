import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:uma/presentation/common/style/style.dart';
import 'package:uma/presentation/pages/home/home_controller.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (homeController) {
        return AppBar(
          elevation: 0,
          titleSpacing: -15,
          toolbarHeight: Get.height * 0.085,
          // leadingWidth: Get.width * 0.22,
          backgroundColor: kPrimaryWhite,
          leading: IconButton(
            onPressed: () {
              Get.back();
              FocusManager.instance.primaryFocus?.unfocus();
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded,
                color: kPrimaryRed),
          ),
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
