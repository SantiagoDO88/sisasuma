import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:uma/presentation/pages/home/home_controller.dart';

import 'package:uma/presentation/common/widgets/widgets.dart';

class PhotoInput extends StatelessWidget {
  const PhotoInput({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (homeController) {
        return InkWell(
          onTap: () {},
          child: Row(
            children: [
              Image(
                image: const AssetImage('assets/icons/add_photo.png'),
                height: Get.height * 0.12,
              ),
              SizedBox(width: Get.width * 0.04),
              Expanded(
                child: CustomTextFieldDialog(
                  readOnly: true,
                  textEditingController: homeController.picNameController,
                  hint: "Tomar Foto",
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
