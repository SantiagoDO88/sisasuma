import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:uma/presentation/common/widgets/widgets.dart';

import 'package:uma/presentation/pages/home/home_controller.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (homeController) {
        return CustomButton(
          placeHolder: 'Guardar',
          onPressed: () => {
            homeController.saveDayStart(),
            Get.back(),
          },
        );
      },
    );
  }
}